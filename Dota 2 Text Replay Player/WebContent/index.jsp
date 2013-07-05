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
.timeslot {
	background-color: #a8a8a8;
	width: auto;
	display: inline-block;
	margin: 10px;
	border-radius: 5px;
	padding: 5px;
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
<table style="border-collapse: collapse;">
<c:set var="flag" value="true" />
<c:forEach var="level" items="${levelUps}">
	<tr>
		<c:if test="${flag eq true}">
			<td class="left"></td>
			<td class="mid"></td>
		</c:if>
		<td>
			<div class="timeslot">
				<div class="top">
				${level.getTime()}<br>
				</div>
				<div class="bot">
				${level.getHero()} reached level ${level.getLevel()}!<br>
				Replay Time: ${level.getReplaytime()}<br>
				</div>
			</div>
		</td>
		<c:if test="${flag eq false}">
			<td class="mid"></td>
			<td class="right"></td>
		</c:if>
		<c:set var="flag" value="${!flag}" />
	</tr>
</c:forEach>
</table>
<script> 
  $(".top").click(function(){
    $(this).siblings(".bot").slideToggle("fast");
  });</script>
</body>
</html>