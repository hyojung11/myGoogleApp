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
<h1>	Hello world!</h1>
<!--[if lt IE 7]>
	<p class="browsehappy">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
<![endif]-->
<P>  The time on the server is ${serverTime}. </P>
http://blog.aliencube.org/ko/2013/07/28/html5-boilerplate-and-more-for-seamless-cross-browsing/placeholder
<div id="wrapper">
	<ul class="menu">
		<li class="item1"><a href="#">Project Google</a>
			<ul>
				<li class="subitem1"><a href="/map">GoogleMap</a></li>
				<li class="subitem2"><a href="/dataStore">GoogleDataStore</a></li>
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
<div id="fb-root"></div>

<script src="/resources/jquery-1.11.3.min.js"></script>    
<script src="http://connect.facebook.net/ko_KR/all.js"></script>
<script>
var key = <c:out value="${faceBookAppKey}"/>
FB.init({
    appId      : key,
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
				  alert("로그인취소");
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
			  $("#user_id").val();
			});
	}	      
	 
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