//# Place all the behaviors and hooks related to the matching controller here.
//# All this logic will automatically be available in application.js.
//# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

function toggleAddressFields () {
  if ($("#order_order_type_pickup").is(':checked')) {
    $(".address-field").hide();
  }
  else if ($("#order_order_type_delivery").is(':checked')) {
    $(".address-field").show();
  }
}

function togglePasswordFields() {
  $(".password-field-container").toggle();
}

$(function() {
  toggleAddressFields();
  $("#order_order_type_delivery").click(function() {
    toggleAddressFields();
  });
  $("#order_order_type_pickup").click(function() {
    toggleAddressFields();
  });
  console.log("pwd");
  togglePasswordFields();
  $("#create_account_").click(function () {
    togglePasswordFields();
  });
});
