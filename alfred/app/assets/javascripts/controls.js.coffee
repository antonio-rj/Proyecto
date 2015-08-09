$('document').ready ->

  $("#id_number").focus()

  $("#id_number").scannerDetection
    endChar: [13],
    onComplete: (string) -> 
      $("#code_name").focus()

  $("#code_name").scannerDetection
    endChar: [13],
    onComplete: (string) -> 
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
    idNumber = $('#id_number').val()
    codeName = $('#code_name').val()
    
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
