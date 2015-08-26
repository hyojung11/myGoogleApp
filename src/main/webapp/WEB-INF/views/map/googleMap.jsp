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
	<title>Home</title>	
    <link rel="stylesheet" type="text/css" href="/resources/style.css">          
</head>
<body>
<h1>마커 위치 찍기</h1>
<!--[if lt IE 7]>
	<p class="browsehappy">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
<![endif]-->
<%-- <P>  appKeyfacebook ${faceBookAppKey}. </P>
<P>  appKeygoogle ${googleAppKey}. </P> --%>

<a href="/map">GoogleMapBasic</a>
<a href="/map/googleMap2">GoogleMapSearch</a>
<a href="/map/googleMap3">GoogleMapDraggable directions</a>

<div id="map_canvas"></div>


	<table border="1">
		<tr>
			<th width="100">위도</th>
			<td width="400" id="lat"></td>
		</tr>
		<tr>
			<th>경도</th>
			<td id="lng"></td>
		</tr>
		<tr>	
			<th>주소</th>
			<td id="address"></td>
		</tr>
	</table>


<script src="/resources/jquery-1.11.3.min.js"></script>    
<script type="text/javascript">		

$(document).ready(function() {
    var latlng = new google.maps.LatLng(37.5640, 126.9751);
    var myOptions = {
  	      zoom : 12,
  	      center : latlng,
  	      mapTypeId : google.maps.MapTypeId.ROADMAP
  	}
    var map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
    var marker = new google.maps.Marker({
		position : latlng, 
		map : map
	});
   
    var geocoder = new google.maps.Geocoder();
    
    google.maps.event.addListener(map, 'click', function(event) {
    	var location = event.latLng;
    	geocoder.geocode({
    		'latLng' : location
    	},
    	function(results, status){
    		if( status == google.maps.GeocoderStatus.OK ) {
    			$('#address').html(results[0].formatted_address);
    			$('#lat').html(results[0].geometry.location.lat());
    			$('#lng').html(results[0].geometry.location.lng());
    		}
    		else {
    			alert("Geocoder failed due to: " + status);
    		}
    	});
    	if( !marker ) {
    		marker = new google.maps.Marker({
    			position : location, 
	    		map : map
	    	});
    	}
    	else {
    		marker.setMap(null);
    		marker = new google.maps.Marker({
    			position : location, 
	    		map : map
	    	});
    	}
    	map.setCenter(location);
    });
});

/* function initMap() {
	  var map = new google.maps.Map(document.getElementById('map'), {
	    zoom: 4,
	    center: {lat: -25.363882, lng: 131.044922 }
	  });

	  var southWest = new google.maps.LatLng(-31.203405, 125.244141);
	  var northEast = new google.maps.LatLng(-25.363882, 131.044922);

	  // Display the area between the location southWest and northEast.
	  map.fitBounds(new google.maps.LatLngBounds(southWest, northEast));

	  // Add 5 markers to map at random locations.
	  // For each of these markers, give them a title with their index, and when
	  // they are clicked they should open an infowindow with text from a secret
	  // message.
	  var secretMessages = ['This', 'is', 'the', 'secret', 'message'];
	  var lngSpan = northEast.lng() - southWest.lng();
	  var latSpan = northEast.lat() - southWest.lat();
	  for (var i = 0; i < secretMessages.length; ++i) {
	    var marker = new google.maps.Marker({
	      position: {
	        lat: southWest.lat() + latSpan * Math.random(),
	        lng: southWest.lng() + lngSpan * Math.random()
	      },
	      map: map
	    });
	    attachSecretMessage(marker, secretMessages[i]);
	  }
	}

	// Attaches an info window to a marker with the provided message. When the
	// marker is clicked, the info window will open with the secret message.
	function attachSecretMessage(marker, secretMessage) {
	  var infowindow = new google.maps.InfoWindow({
	    content: secretMessage
	  });

	  marker.addListener('click', function() {
	    infowindow.open(marker.get('map'), marker);
	  });
	}
	 */

</script>
<script type="text/javascript" src="https://maps.google.com/maps/api/js?v=3.exp&region=KR"></script>
</body>
</html>