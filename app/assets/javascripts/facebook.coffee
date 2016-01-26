# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
	$.ajax
		url: "/likes",
		success: (data) ->
			console.log(data)
			data = data.data
			chart = $('#facebook-graph').highcharts
				chart: 
					marginBottom: 120
					reflow: false
					marginLeft: 50
					marginRight: 20
					style:
						postion: 'absolute'
				credits:
					enabled: false
				title:
					text: 'Facebook likes'
				xAxis:
					type: 'datetime'
				yAxis:
					type:
						text: null
				plotOptions:
					series:
						marker:
							enabled: false
							status:
								hover:
									enabled: true
									radius: 3
				series: [
					name: 'Facebook Likes'
					data: data
				]
