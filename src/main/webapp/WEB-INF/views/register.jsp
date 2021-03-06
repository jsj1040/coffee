<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="ISO-8859-1" />
<title>register coffee</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-1.12.1.js"></script>
</head>
<body>
	<p style="font-size: 50px; color: white; background-color: green; width: 65%;">커피를	등록해봅시다</p>
	<label for="demo_name">커피이름</label>
	<input type="text" name="demo_name" id="demo_name" />
	<label for="demo_inventory">재고</label>
	<input type="number" name="demo_inventory" id="demo_inventory" />
	<label for="demo_price">커피가격</label>
	<input type="number" name="demo_price" id="demo_price" />
	<input type="button" name="postData" id="postData" value="커피등록" onclick="postDataFromAPI()" />
	<input type="button" value="메인으로가기" onclick="location.href='/index'">
	
	<script>
	//재고값 예외처리
 	demo_inventory.oninput = function(){
		if(this.value <0){
			alert("입력할수없는 값입니다");
			window.location.reload();
		}
	} 
	
	//가격 예외처리
	 demo_price.oninput = function(){
		if(this.value <0 ){
			alert("입력할수없는 값입니다");
			window.location.reload();
		}
	}

		//coffee테이블에 값넣기 
		function postDataFromAPI() {
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
			var modelObj = {
				inventory : $("#demo_inventory").val(),
				name : $("#demo_name").val(),
				price : $("#demo_price").val()
			};

			$.ajax({
				type : "POST",
				url : "/postdata",
				headers : {
					"Content-Type" : "application/json"
				},
				data : JSON.stringify(modelObj),
				success : function(data) {
					totalFromAPI(data);
					alert("등록완료!");
					window.location.reload();
				},
				error : function(jqXHR, textStatus, errorThrown) {
				
					
				}
			});
		}
		}

		//total API
		function totalFromAPI(id) {

			var totalObj = {
					id:id,
				name : $("#demo_name").val()
			};
			console.log("post data:" + totalObj);

			$.ajax({
				type : "POST",
				url : "/totaldata",
				headers : {
					"Content-Type" : "application/json"
				},
				data : JSON.stringify(totalObj),
				success : function(data) {
					console.log("POST API RESPONSE::" + data);
				},
				error : function(jqXHR, textStatus, errorThrown) {
				}
			});
		}

		//등록 후 redirect 설정
		function redirect() {
			window.location = "/findall"
		}
	</script>
</body>
</html>