<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>��ü��ȸPage</title>
<meta charset="ISO-8859-1" />
<title>register coffee</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-1.12.1.js"></script>
</head>
<body>
	<p
		style="font-size: 50px; color: white; background-color: green; width: 65%;">Ŀ���Ǹŷ������Դϴ�.</p>
	<table>
		<thead>
			<tr>
				<th>�̸�</th>
				<th>���Ǹŷ�</th>
				<th>�Ѽ���</th>
			</tr>
		</thead>
		<c:forEach items="${totallist}" var="coffee">
			<tr>
				<td>${coffee.name}</td>
				<td>${coffee.total_sale}</td>
				<td>${coffee.total_income}</td>
			</tr>
		</c:forEach>
	</table>

	<input type="button" value="�������ΰ���" onclick="location.href='/index'">
</body>
</html>