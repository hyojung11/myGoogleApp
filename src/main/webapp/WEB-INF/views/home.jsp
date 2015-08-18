<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>	
	<title>Home</title>
	<meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="/resources/style.css">    	
</head>
<body>
<h1>	Hello world!</h1>
<P>  The time on the server is ${serverTime}. </P>

<div id="wrapper">

	<ul class="menu">
		<li class="item1"><a href="#">Friends <span>340</span></a>
			<ul>
				<li class="subitem1"><a href="#">Cute Kittens <span>14</span></a></li>
				<li class="subitem2"><a href="#">Strange “Stuff” <span>6</span></a></li>
				<li class="subitem3"><a href="#">Automatic Fails <span>2</span></a></li>
			</ul>
		</li>
		<li class="item2"><a href="#">Videos <span>147</span></a>
			<ul>
				<li class="subitem1"><a href="#">Cute Kittens <span>14</span></a></li>
				<li class="subitem2"><a href="#">Strange “Stuff” <span>6</span></a></li>
				<li class="subitem3"><a href="#">Automatic Fails <span>2</span></a></li>
			</ul>
		</li>
		<li class="item3"><a href="#">Galleries <span>340</span></a>
			<ul>
				<li class="subitem1"><a href="#">Cute Kittens <span>14</span></a></li>
				<li class="subitem2"><a href="#">Strange “Stuff” <span>6</span></a></li>
				<li class="subitem3"><a href="#">Automatic Fails <span>2</span></a></li>
			</ul>
		</li>
		<li class="item4"><a href="#">Podcasts <span>222</span></a>
			<ul>
				<li class="subitem1"><a href="#">Cute Kittens <span>14</span></a></li>
				<li class="subitem2"><a href="#">Strange “Stuff” <span>6</span></a></li>
				<li class="subitem3"><a href="#">Automatic Fails <span>2</span></a></li>
			</ul>
		</li>
		<li class="item5"><a href="#">Robots <span>16</span></a>
			<ul>
				<li class="subitem1"><a href="#">Cute Kittens <span>14</span></a></li>
				<li class="subitem2"><a href="#">Strange “Stuff” <span>6</span></a></li>
				<li class="subitem3"><a href="#">Automatic Fails <span>2</span></a></li>
			</ul>
		</li>
	</ul>

</div>


 <button type="button" class="ct-btn white" onclick="facebooklogin(); return false;">로그인</button>
 <button type="button" class="ct-btn white" onclick="facebooklogout(); return false;">로그아웃</button>
 <input type="text" id="user_id">
 <div id="map-canvas"></div>
<div id="fb-root"></div>
<script src="/resources/jquery-1.11.3.min.js"></script>    
<script src="http://connect.facebook.net/ko_KR/all.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?v=3.exp"></script>
<script>
FB.init({
    appId      : '450354071802804', //사용자 앱ID
    status     : true,
    xfbml      : true,
    version    : 'v2.4'
  });
	
	(function(d, s, id) {
		var js, fjs = d.getElementsByTagName(s)[0];
		if (d.getElementById(id)) return;
		js = d.createElement(s); js.id = id;
		js.src = "//connect.facebook.net/en_GB/all.js#xfbml=1&status=0";
		fjs.parentNode.insertBefore(js, fjs);
		}(document, 'script', 'facebook-jssdk'));
</script>
<script type="text/javascript">		
	 		
	var map = "";
	function initialize() {
	  map = new google.maps.Map(document.getElementById('map-canvas'), {
	    zoom: 8,
	    center: {lat: -34.397, lng: 150.644}
	  });
	}	
	
	function facebooklogin() {				  
		  FB.login(function(response) {
			  if (response.authResponse) {				  
			       // callback 영역입니다. 자신의 브라우저가 페북에 연동되면 여기로직을 처리 하게 되죠				  
				  FB.api('/me', function(response) {
					  $('#user_id').val(response.name);
				       console.log('Good to see you, ' + response.name + '.');
				     }); 				       
			  } else {
			       //오류가 났거나 연동이 실패 했을때 처리 하는부분.....
				  alert("실패");
			         }
			       } , {
			       scope: 'publish_actions, email', 
			       return_scopes: true
		  //,{scope: 'email,user_likes'}); //, {scope: "user_about_me,publish_stream,read_friendlists,offline_access,email,user_birthday"} 			   
		} ); }
	
	function facebooklogout() {
		FB.logout(function(response) {
			  // user is now logged out
			  alert("성공");
			});
	}
		
	 google.maps.event.addDomListener(window, 'load', initialize);			      
	 
	 $(function() {
			
		    var menu_ul = $('.menu > li > ul'),
		           menu_a  = $('.menu > li > a');
		    
		    menu_ul.hide();
		
		    menu_a.click(function(e) {
		        e.preventDefault();
		        if(!$(this).hasClass('active')) {
		            menu_a.removeClass('active');
		            menu_ul.filter(':visible').slideUp('normal');
		            $(this).addClass('active').next().stop(true,true).slideDown('normal');
		        } else {
		            $(this).removeClass('active');
		            $(this).next().stop(true,true).slideUp('normal');
		        }
		    });
		
		});
	
	</script>
</body>
</html>