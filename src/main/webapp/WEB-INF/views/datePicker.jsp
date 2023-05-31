<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>datepicker</title>
    <script src="/resources/js/jquery-3.1.1.min.js"></script>
    <link href="/resources/dist/css/datepicker.min.css" rel="stylesheet" type="text/css" media="all">
    
    <script src="/resources/dist/js/datepicker.js"></script>
    <script src="/resources/dist/js/i18n/datepicker.ko.js"></script>
</head>
<body>
    <div>
        단일 달력<br />
        <input type="text" id="datepicker">
    </div>
</body>

<script>
    $("#datepicker").datepicker({
    	language: 'ko',
    });
    $('#datepicker').datepicker('setDate', '-20Y');
</script>
</html>
