# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$('document').ready ->
  
  $("#id_number").focus()

  $("#id_number").keyup ->
    $("#code_name").focus() if parseInt(@value.length) == parseInt($(this).attr("maxlength"))

  $("#code_name").keyup ->
    if parseInt(@value.length) == parseInt($(this).attr("maxlength"))
      sendData()
        .done(->
          setAlert('#alert-message', 'Prestamo exitoso', 'success')
          $("#code_name").val('')
        )
        .fail(->
          setAlert('#alert-message', 'Prestamo fallido. Intente de nuevo', 'error')
          $("#code_name").val('')
        )

  sendData = () ->
    idNumber = parseInt($('#id_number').val())
    codeName = parseInt($('#code_name').val())
    
    params = {
      id_number: idNumber,
      code_name: codeName,
    }

    $.ajax(
      type: "POST",
      url: "/controls",
      data: params
    )

  setAlert = (selector, message, type) ->
    id = Math.floor(Math.random() * 1000)
    html = "<div class='alert alert-#{type}' id='alert-message-#{id}'>#{message}<a class='close' data-dismiss='alert'>&times;</a></div>"
    $(selector).append(html)

    window.setTimeout (->
      $("#alert-message-#{id}").fadeTo(500, 0).slideUp 500, ->
        $(@).remove()
    ), 3000