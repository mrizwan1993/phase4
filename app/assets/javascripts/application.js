// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery
//= require materialize-sprockets
//= require_tree .


// Our main JQuery function
$( document ).ready(function () {
  
//the Jquery for the Select boxes in the forms
$('select').formSelect();
$('select').material_select();
//Taken from Lab 6 - Gives a nice Date interface
$('.datepicker').datepicker({
    format: 'mmmm dd, yyyy',
    formatSubmit: 'mmmm dd, yyyy',
    selectMonths: true, // Creates a dropdown to control month
    selectYears: 15, // Creates a dropdown of 15 years to control year,
    today: 'Today',
    clear: 'Clear',
    close: 'Ok',
    closeOnSelect: false // Close upon selecting a date,
});

//The second Date picker for Date of Birth - Has a different range of SelectYears
$('.datepicker1').datepicker({
    format: 'mmmm dd, yyyy',
    formatSubmit: 'mmmm dd, yyyy',
    selectMonths: true, // Creates a dropdown to control month
    selectYears: 80, // Creates a dropdown of 80 years to control year,
    clear: 'Clear',
    close: 'Ok',
    closeOnSelect: false // Close upon selecting a date,
});

//HElps the dropdown menus in the top nav work on hover and open below origin
$(".dropdown-button").dropdown({ 
    hover: true,
    belowOrigin: true
});

//Works the tiny buttons to the right when I list any of the entities
$('.fixed-action-btn').floatingActionButton();

//Code to create "Scroll to top" button - taken from a website
var btn = $('#button');

  $(window).scroll(function() {
    if ($(window).scrollTop() > 300) {
      btn.addClass('show');
    } else {
      btn.removeClass('show');
    }
  });

  btn.on('click', function(e) {
    e.preventDefault();
    $('html, body').animate({scrollTop:0}, '300');
  });


})

