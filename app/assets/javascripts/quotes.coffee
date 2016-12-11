# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

Quotes =
  url: '/random_quote'
  imageURL: 'http://loremflickr.com/g/1280/1080'

  initialize: ->
    setInterval(( => @_callAjax()), 10 * 60 * 1000 )

  _callAjax: ->
    xmlhttp = new XMLHttpRequest

    xmlhttp.onreadystatechange = =>
      if xmlhttp.readyState == XMLHttpRequest.DONE
        if xmlhttp.status == 200
          console.log xmlhttp.responseText
          @_updateData(JSON.parse(xmlhttp.responseText))
        else if xmlhttp.status == 400
          alert 'There was an error 400'
        else
          alert 'something else other than 200 was returned'
      return

    xmlhttp.open 'GET', @url, true
    xmlhttp.send()

  _updateData: (jsonResponse) ->
    @_updateImage(jsonResponse['genre_type'])
    @_updateQuoteAndAuthor(jsonResponse['quote'], jsonResponse['author_name'])

  _updateQuoteAndAuthor: (quote, author_name) ->
    document.getElementById('quote').innerHTML = quote
    document.getElementById('author').innerHTML = "- #{author_name}"

  _updateImage: (genreType) ->
    imageDiv = document.getElementById('back-image')
    imageDiv.style['backgroundImage'] = "url('#{@imageURL}/#{genreType}?q=#{new Date().getTime()}')"

Quotes.initialize()
