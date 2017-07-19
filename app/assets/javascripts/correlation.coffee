# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


@Graph = (xdata, ydata, colordata) ->
	trace1 = {
  	x: xdata
  	y: colordata
  	mode: 'markers'
  	marker: {
    	size: 10
    	color: colordata
    	showscale : true
    	colorscale: 'Electric'
  	}
	}
	data = [trace1]
	layout = {
  	title: 'Scatter Plot with a Color Dimension'
  	width: 1800
  	height: 800
	}
	Plotly.newPlot('myDiv', data, layout)