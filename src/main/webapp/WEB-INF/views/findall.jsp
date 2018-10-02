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
<title>전체조회Page</title>
<meta charset="ISO-8859-1" />
<title>list coffee</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-1.12.1.js"></script>
</head>
<body>

	<script>
				function shopListAPI(id, stindex) {
						var shopList = "";						
						var s_id = id;
						var newURL = "http://9.240.101.220:8090/getShopListByCoffee/"+s_id;
						//var id1=id;
						//var stindex1=stindex;
						
						$.ajax({
									type : "GET",
									url : newURL,
									crossOrigin : true,
									async:false,
									success : function(data) {
									
										for (var i = 0; i < data.length; i++) {
											if(i == (data.length-1)){
												shopList += data[i].name
											}else{
												shopList += data[i].name
												+ ",";
											}			
										}
										document.getElementById(stindex).value = shopList;										
									},
									error : function(jqXHR, textStatus,
											errorThrown) {
										console.log("error");
									}
								});//ajax
						return shopList;
					}
				</script>


	<p
		style="font-size: 50px; color: white; background-color: green; width: 65%;">저장하고
		있는 커피목록입니다.</p>
	<table>
		<thead>
			<tr>
				<th>이름</th>
				<th>재고</th>
				<th>등록일</th>
				<th>수정일</th>
				<th>가격</th>
				<th>삭제</th>
				<th>shop리스트</th>
			</tr>
		</thead>

		<c:forEach items="${coffeeList}" var="coffee" varStatus="status">
			<script>
					var id=${coffee.id}; 
					
			</script>
			<tr>
				<td><spring:url value="selectCoffee/${coffee.id }"
						var="findByName" /> <a href="${findByName}"
					style="text-decoration: none; color: black;">${coffee.name}</a></td>
					
				<td><spring:url value="selectCoffee/${coffee.id }"
						var="findByName" /> <a href="${findByName}"
					style="text-decoration: none; color: black;">${coffee.inventory}</a>
				</td>
				
				<td><spring:url value="selectCoffee/${coffee.id }"
						var="findByName" /> <a href="${findByName}"
					style="text-decoration: none; color: black;">${coffee.register_date}</a>
				</td>
				
				<td><spring:url value="selectCoffee/${coffee.id }"
						var="findByName" /> <a href="${findByName}"
					style="text-decoration: none; color: black;">${coffee.update_date}</a>
				</td>
				
				<td><spring:url value="selectCoffee/${coffee.id }"
						var="findByName" /> <a href="${findByName}"
					style="text-decoration: none; color: black;">${coffee.price}</a>
				</td>
					
				<td><spring:url value="/deleteCoffee/${coffee.id}"
						var="deleteById" /> <a href="${deleteById}">커피삭제</a>
				</td>
				<td><input type="text" id="${status.index}" name="shopList" size = "40%"/></td>
			</tr>
			<script> shopListAPI(id, ${status.index});</script>
		</c:forEach>
	</table>

	<input type="button" value="메인으로가기" onclick="location.href='/index'">
	<input type="button" value="등록확인" onClick="history.go(0)">
</body>
</html>