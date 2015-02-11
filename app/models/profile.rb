class Profile < ActiveRecord::Base

  belongs_to :user, dependent: :destroy

  has_many :profile_skills
  has_many :skills, through: :profile_skills
  has_many :navigats, class_name: "Pair", foreign_key: :navigator_id
  has_many :drives,   class_name: "Pair", foreign_key: :driver_id
  has_many :identities, dependent: :delete_all

  accepts_nested_attributes_for :user

  geocoded_by :address
  reverse_geocoded_by :latitude, :longitude
  after_validation :geocode, if: :address_changed?


  validates_presence_of :user

  validates :username, presence: true,
                       uniqueness: { case_sensitive: false },
                       length: {maximum: 50},
                       format: /\A[a-zA-Z\d]*\z/

  validates :first_name, length: {maximum: 50}

  # validates :phone, presence: true,
  #                   uniqueness: { case_sensitive: false },
  #                   length: {maximum: 50}

  # validates :age, presence: true,
  #                 length: {maximum: 4},
  #                 numericality: {only_integer: true,
  #                   greater_than_or_equal_to: Date.today.year - 90 ,
  #                   less_than_or_equal_to: Date.today.year + 90}


  # validates_numericality_of :rank
  has_attached_file :avatar, styles: {
   medium: "200x200>",
   small:  "100x100>",
   thumb:  '64x64!'
  }, :default_url => lambda { |attach| "https://robohash.org/#{attach.instance.username}.png" }

  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  def add_skill? skill
    skill = Skill.find_or_create_by!(name: skill)
    unless self.skills.include?(skill)
      self.skills << skill
    else
      false
    end
  end

  def name
    "#{first_name} #{last_name}"
  end


  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name   # assuming the user model has a name
      user.image = auth.info.image # assuming the user model has an image
    end
  end
end
