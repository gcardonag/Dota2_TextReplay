<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.dota2textplay.test.*" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Insert title here</title>

<style>
.timeline {
	display: block;
	height: 300px;
	min-width: 5000px;
	width: 100%;
}

.timeslot {
	display: block;
	width: 250px;
	float: left;
}

.timeslot-top {
	display: block;
	background-color: #a8a8a8;
	border-radius: 5px 5px 0 0;
	padding: 5px 5px 0 5px;
}

.timeslot-bot {
	display: block;
	background-color: #a8a8a8;
	border-radius: 0 0 5px 5px;
	padding: 0 0 5px 5px;
}

.mid {
	display: block;
	vertical-align: middle;
	float: left;
}
</style>
</head>
<body>
<script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
<a href="TestServlet">CLICK HERE FOR TEST</a>
<br>
TODO: Need ideas to scroll long ass timelines.<br>
<script> 
$(document).ready(function(){
  $(".timeslot-top").click(function(){
    $(this).parent().children(".timeslot-bot").slideToggle();
  });
});
</script>
<div class="timeline">
<c:set var="flag" value="true" />
<c:forEach var="level" items="${levelUps}">
	<c:if test="${flag eq true}">
		<div class="timeslot">
			<div class="timeslot-top">
				${level.getTime()}<br>
			</div>
			<div class="timeslot-bot">
			${level.getHero()} reached level ${level.getLevel()}!<br>
				Replay Time: ${level.getReplaytime()}<br>
			</div>
		</div>
		<div class="mid"></div>
	</c:if>	
	<c:if test="${flag eq false}">
		<div class="mid"></div>
		<div class="timeslot">
			<div class="timeslot-top">
				${level.getTime()}<br>
			</div>
			<div class="timeslot-bot">
			${level.getHero()} reached level ${level.getLevel()}!<br>
				Replay Time: ${level.getReplaytime()}<br>
			</div>
		</div>
	</c:if>
	
	<c:set var="flag" value="${!flag}" />
	
</c:forEach>
</div>

</body>
</html>