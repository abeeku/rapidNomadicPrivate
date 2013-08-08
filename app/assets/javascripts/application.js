// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
// require twitter/bootstrap/bootstrap-transition
//= require twitter/bootstrap/bootstrap-alert
// require twitter/bootstrap/bootstrap-modal
//= require twitter/bootstrap/bootstrap-dropdown
// require twitter/bootstrap/bootstrap-scrollspy
//= require twitter/bootstrap/bootstrap-tab

// require twitter/bootstrap/bootstrap-tooltip
//= require twitter/bootstrap/bootstrap-popover
// require twitter/bootstrap/bootstrap-button
// require twitter/bootstrap/bootstrap-collapse
// require twitter/bootstrap/bootstrap-carousel
// require twitter/bootstrap/bootstrap-typeahead
// require twitter/bootstrap/bootstrap-affix
//= require jquery-fileupload/vendor/jquery.ui.widget
//= require jquery-fileupload/vendor/load-image
//= require jquery-fileupload/vendor/canvas-to-blob
//= require jquery-fileupload/vendor/tmpl
//= require jquery-fileupload/jquery.iframe-transport
//= require jquery-fileupload/jquery.fileupload
//= require jquery-fileupload/jquery.fileupload-fp
//= require jquery-fileupload/jquery.fileupload-ui
//= require jquery-fileupload/locale
$(function() {
  var faye = new Faye.Client('http://68.116.171.81:9292/faye');
  faye.subscribe("/messages", function(data) {
    alert(data);
  });
});
$(".popover").popover({ trigger: "hover" });
/*
$(window).scroll(function() {
    if($(window).scrollTop() + $(window).height() >= $(document).height()) {
        alert("bottom!");
    }
});
     */