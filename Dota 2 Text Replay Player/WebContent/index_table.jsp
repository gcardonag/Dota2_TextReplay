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
.timeslot-top {
	background-color: #a8a8a8;
	border-radius: 5px 5px 0 0;
	padding: 5px 5px 0 5px;
}

.timeslot-bot {
	background-color: #a8a8a8;
	border-radius: 0 0 5px 5px;
	padding: 0 0 5px 5px;
}

.mid {
	background-color: black;
}
</style>
</head>
<body>
<script src="WEB-INF/lib/jquery-1.10.2.min.js"></script>
<a href="TestServlet">CLICK HERE FOR TEST</a>
<br>
TODO: Make slideToggle work<br>
<script> 
$(document).ready(function(){
  $('.timeslot-top').click(function(){
    $(this).parent().next().fadeToggle();
  });
});
</script>
<table style="border-collapse: collapse;">
<c:set var="flag" value="true" />
<c:forEach var="level" items="${levelUps}">
	<tr>
		<c:if test="${flag eq true}">
			<td class="left"></td>
			<td class="mid"></td>
		</c:if>
		<td class="timeslot-top">
			${level.getTime()}<br>
		</td>
		<c:if test="${flag eq false}">
			<td class="mid"></td>
			<td class="right"></td>
		</c:if>
	</tr>
	<tr>
		<c:if test="${flag eq true}">
			<td class="left"></td>
			<td class="mid"></td>
		</c:if>
		<td class="timeslot-bot">
			${level.getHero()} reached level ${level.getLevel()}!<br>
				Replay Time: ${level.getReplaytime()}<br>
		</td>
		<c:if test="${flag eq false}">
			<td class="mid"></td>
			<td class="right"></td>
		</c:if>
		<c:set var="flag" value="${!flag}" />
	</tr>
</c:forEach>
</table>

</body>
</html>