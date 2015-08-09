$('document').ready ->
  $("#code_name_ret").focus()

  $("#code_name_ret").scannerDetection
    endChar: [13],
    onComplete: (string) -> 
      sendData()
        .done(->
          setAlert('#alert-message', 'Equipo devuelto', 'success')
          $("#code_name_ret").val('')
        )
        .fail(->
          setAlert('#alert-message', 'Equipo no pudo ser devuelto. Intente de nuevo', 'error')
          $("#code_name_ret").val('')
        )

  sendData = () ->
    codeName = $('#code_name_ret').val()    
    params = { code_name: codeName }

    $.ajax(
      type: "GET",
      url: "/controls/get_control",
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
