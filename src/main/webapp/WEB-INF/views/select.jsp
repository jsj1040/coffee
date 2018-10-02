
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-1.12.1.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<p style="font-size: 50px; color: white; background-color: green; width: 65%;">커피상세정보입니다</p>
	<table>
		<thead>
			<tr>
				<th></th>
				<th>이름</th>
				<th>재고</th>
				<th>등록일</th>
				<th>수정일</th>
				<th>가격</th>
				<th>총판매량</th>
				<th>총수입</th>
				<th>수정</th>
			</tr>
		</thead>
		<tr>
			<td><input type="hidden" name="demo_id" id="demo_id" value="${name.id}" /></td>
			<td><input type="text" name="demo_name" id="demo_name" value="${name.name}" /></td>
			<td><input type="number" name="demo_inventory" id="demo_inventory" value="${name.inventory}" /></td>
			<td>${name.register_date}</td>
			<td>${name.update_date}</td>
			<td><input type="number" name="demo_price" id="demo_price" value="${name.price}" /></td>
			<td>${tname.total_sale}</td>
			<td>${tname.total_income}</td>
			<td><input type="button" name="updateData" id="updateData" value="커피수정" onclick="updateDataFromAPI()" /></td>
		</tr>		
	</table>
	
	<script>
	//재고수정값 예외처리
	demo_inventory.oninput = function(){
		if(this.value <0){
			alert("입력할수없는 값입니다");
			window.location.reload();
		}
	}
	
	//가격수정 값예외처리
	 demo_price.oninput = function(){
		if(this.value <0){
			alert("입력할수없는 값입니다");
			window.location.reload();
		}
	}
	
	</script>
	
	<div style="clear:both;">
	<input type="button" value="커피목록가기" onclick="location.href='/findall'">
	</div>
	<script>
		function updateDataFromAPI() {
			if($("#demo_price").val()=="")
				alert("값을 넣으세요");
			else if($("#demo_inventory").val()=="")
				alert("값을 넣으세요");
			else if($("#demo_name").val()=="")
				alert("값을 넣으세요");
			else if($("#demo_name").val().indexOf("/") != -1){
			      alert("입력할수없는 값입니다");
			      window.location.reload(true);
			   }else if($("#demo_name").val().indexOf("@") != -1){
			      alert("입력할수없는 값입니다");
			      window.location.reload(true);
			   }else if($("#demo_name").val().indexOf("<") != -1){
			      alert("입력할수없는 값입니다");
			      window.location.reload(true);
			   }else if($("#demo_name").val().indexOf(">") != -1){
			      alert("입력할수없는 값입니다");
			      window.location.reload(true);
			   }
			else{
				
			var c_id = $("#demo_id").val();
			var updateObj = {
				id : c_id,
				name : $("#demo_name").val(),
				inventory : $("#demo_inventory").val(),
				price : $("#demo_price").val()
			};
			console.log("post data:" + updateObj);
			$.ajax({
				type : "POST",
				url : "/updatedata/" + c_id,
				headers : {
					"Content-Type" : "application/json"
				},
				data : JSON.stringify(updateObj),
				success : function(data) {
					console.log("POST API RESPONSE::" + data);
				},
				error : function(jqXHR, textStatus, errorThrown) {
					console.log("error");
				}
			
			});
		}
		}
		</script>

	<div style="float: left; size: 60px; height: 50%; border: #ff0000 1px; background: green; color: white;">
		<table>
				<tbody>
				<tr>
					<td>shop이름</td>
				</tr>
                <tr>
                	<td><input type = "text" id = "shopName" value = "" readonly="readonly" size="60px"/></td>
                </tr>
				<tr>						
					<td>
						SHOP총판매량
					</td>
                <tr>
                <td>
						<input type = "text" id = "shopTotalSale" value = "" readonly="readonly" size="60px"/>
                </tr>
                <tr>						
					<td>
						SHOP총판매액
					</td>
                <tr>
                <td>
						<input type = "text" id = "shopTotalMoney" value = "" readonly="readonly" size="60px"/>
                </tr>
                
                <tr>						
					<td>
						SHOP등록일
					</td>
                <tr>
                <td>
						<input type = "text" id = "shopRegDate" value = "" readonly="readonly" size="60px"/>
                </tr>
                <tr>						
					<td>
						SHOP수정일
					</td>
                <tr>
                <td>
						<input type = "text" id = "shopModDate" value = "" readonly="readonly" size="60px"/>
                </tr>
			</tbody>			
		</table>	
	</div>
	
		<script>
		function shopSelectAPI() {
			var shopName = "";	
			var shopTotalSale="";
			var shopTotalMoney="";
			var shopRegDate="";
			var shopModDate="";
			var shopArray="";
			
			var s_id = $("#demo_id").val();
			var newURL = "http://9.240.101.220:8090/getShopListByCoffee/"+s_id;
			
			$.ajax({
						type : "GET",
						url : newURL,
						crossOrigin : true,
						async:false,
						//data : JSON.stringify(newURL),
						success : function(data) {
							var txt ='';
							for (var i = 0; i < data.length; i++) {									
 									shopName += data[i].name+ ",";
									shopTotalSale+=data[i].totalSale+",";
									shopTotalMoney+=data[i].totalMoney+",";
									shopRegDate+=data[i].regDate+",";
									shopModDate+=data[i].modDate+","; 
								}		
								
								document.getElementById("shopName").value = shopName;
								document.getElementById("shopTotalSale").value = shopTotalSale;
								document.getElementById("shopTotalMoney").value = shopTotalMoney;
								document.getElementById("shopRegDate").value = shopRegDate;
								document.getElementById("shopModDate").value = shopModDate; 
																																		
						},
						error : function(jqXHR, textStatus,	errorThrown) {
							console.log("error");
						}
					});
		}
		shopSelectAPI();
		
		function redirect() {
			window.location = "/findall"
		}
		
	</script>
</body>
</html>