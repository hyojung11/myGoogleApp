<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<head>	
	<meta charset="UTF-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge"> <!--  IE 호환성 모드 메타 태그 -->
	<title>Draggable directions</title>	
    <link rel="stylesheet" type="text/css" href="/resources/style.css">          
</head>
<body>
<h1>드래그 방향</h1>
<a href="/map">GoogleMapBasic</a>
<a href="/map/googleMap2">GoogleMapSearch</a>
<a href="/map/googleMap3">GoogleMapDraggable directions</a>

<div id="map_canvas" style="float:left;width:63%; height:100%"></div>
<div id="directionsPanel" class="panel" style="float:right;width:34%;height 100%">
	<p>Total Distance: <span id="total"></span></p>
</div>
    
<script src="/resources/jquery-1.11.3.min.js"></script>    
<script type="text/javascript">		
function initMap() {
	  var map = new google.maps.Map(document.getElementById('map_canvas'), {
	    zoom: 4,
	    center: {lat: -24.345, lng: 134.46}  // Australia.
	  });

	  var directionsService = new google.maps.DirectionsService;
	  var directionsDisplay = new google.maps.DirectionsRenderer({
	    draggable: true,
	    map: map,
	    panel: document.getElementById('directionsPanel')
	  });

	  directionsDisplay.addListener('directions_changed', function() {
	    computeTotalDistance(directionsDisplay.getDirections());
	  });

	  displayRoute('Perth, WA', 'Sydney, NSW', directionsService,
	      directionsDisplay);
	}

	function displayRoute(origin, destination, service, display) {
	  service.route({
	    origin: origin,
	    destination: destination,
	    waypoints: [{location: 'Cocklebiddy, WA'}, {location: 'Broken Hill, NSW'}],
	    travelMode: google.maps.TravelMode.DRIVING,
	    avoidTolls: true
	  }, function(response, status) {
	    if (status === google.maps.DirectionsStatus.OK) {
	      display.setDirections(response);
	    } else {
	      alert('Could not display directions due to: ' + status);
	    }
	  });
	}

	function computeTotalDistance(result) {
	  var total = 0;
	  var myroute = result.routes[0];
	  for (var i = 0; i < myroute.legs.length; i++) {
	    total += myroute.legs[i].distance.value;
	  }
	  total = total / 1000;
	  document.getElementById('total').innerHTML = total + ' km';
	}
</script>
 <script src="https://maps.googleapis.com/maps/api/js?signed_in=true&callback=initMap" async defer></script>
</body>
</html>