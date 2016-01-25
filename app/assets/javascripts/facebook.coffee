# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
	$.ajax
		url: "#{window.location.protocol}//connect.facebook.net/en_US/all.js"
		dataType: "script"
		cache: true
	window.fbAsyncInit = ->
		FB.init(appId: '1676774375936211', cookie: true)

		$("#facebook-connect").click(e) ->
			e.preventDefault()
			FB.login(response) ->
				window.location = '/auth/facebook/callback' if response.authResponse
