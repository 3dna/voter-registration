# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(document).scroll ->

  # If has not activated (has no attribute "data-top"
  unless $(".subnav").attr("data-top")

    # If already fixed, then do nothing
    return  if $(".subnav").hasClass("subnav-fixed")

    # Remember top position
    offset = $(".subnav").offset()
    $(".subnav").attr "data-top", offset.top
  if $(".subnav").attr("data-top") - $(".subnav").outerHeight() <= $(this).scrollTop()
    $(".subnav").addClass "subnav-fixed"
  else
    $(".subnav").removeClass "subnav-fixed"

jQuery ->
  $('#register_citizen').change ->
    us_citizen = $('#register_citizen')
    if us_citizen.is(":checked")
    else
      alert "You must be a U.S. citizen to vote."
