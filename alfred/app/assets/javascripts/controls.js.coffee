# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$('document').ready ->
  
  codes_all = ""
  $("#number_id").focus()
  $("#id_number").keyup ->
    $("#code_name").focus() if parseInt(@value.length) == parseInt($(this).attr("maxlength"))

  $("#code_name").keyup ->
    if parseInt(@value.length) == parseInt($(this).attr("maxlength"))
      #tmp = $("#code_name").val()
      #codes_all = string.concat(tmp)
      #$("#code_name").val('')
      #$("#code_name").focus()



      $("#submit_button").submit()

  # newCreate = () ->
  #   idNumber = parseInt($('#id_number').val())
  #   codeName = parseInt($('#code_name').val())
    
  #   params = {
  #     id_number: idNumber,
  #     code_name: codeName,
  #   }

  #   $.ajax(
  #     type: "POST",
  #     url: "/controls",
  #     data: params
  #   )