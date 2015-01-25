// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require jquery.turbolinks
//= require autocomplete-rails
//= require bootstrap-sprockets
//= require rails.validations
//= require rails.validations.simple_form
//= require turbolinks
//= require underscore
//= require gmaps/google
//= require gmaps-auto-complete
//= require_tree .

jQuery(function() {
    var completer;

      completer = new GmapsCompleter({
            inputField: '#gmaps-input-address',
                    errorField: '#gmaps-error'
          });

        completer.autoCompleteInit({
              country: "us"
            });
});
