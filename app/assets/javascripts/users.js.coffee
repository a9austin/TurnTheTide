# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

curr_selected = "all"

jQuery -> 
  vizHide()
  showSelected()

  $('.viz_selector').change ->
    showSelected()

vizHide = -> 
  $('.vizbar.walk').hide()
  $('.vizbar.bike').hide()
  $('.vizbar.train').hide()
  $('.vizbar.bus').hide()

showSelected = ->
 $('.vizbar.' + curr_selected).hide()
 selected = $('.viz_selector').val()
 $('.vizbar.' + selected).show()
 curr_selected = $('.viz_selector').val()


