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
	<p style="font-size: 50px; color: white; background-color: green; width: 65%;">Ä¿ÇÇ¸¦	µî·ÏÇØº¾½Ã´Ù</p>
	<label for="demo_name">Ä¿ÇÇÀÌ¸§</label>
	<input type="text" name="demo_name" id="demo_name" />
	<label for="demo_inventory">Àç°í</label>
	<input type="number" name="demo_inventory" id="demo_inventory" />
	<label for="demo_price">Ä¿ÇÇ°¡°Ý</label>
	<input type="number" name="demo_price" id="demo_price" />
	<input type="button" name="postData" id="postData" value="Ä¿ÇÇµî·Ï" onclick="postDataFromAPI()" />
	<input type="button" value="¸ÞÀÎÀ¸·Î°¡±â" onclick="location.href='/index'">
	
	<script>
	//Àç°í°ª ¿¹¿ÜÃ³¸®
 	demo_inventory.oninput = function(){
		if(this.value <0){
			alert("ÀÔ·ÂÇÒ¼ö¾ø´Â °ªÀÔ´Ï´Ù");
			window.location.reload();
		}
	} 
	
	//°¡°Ý ¿¹¿ÜÃ³¸®
	 demo_price.oninput = function(){
		if(this.value <0 ){
			alert("ÀÔ·ÂÇÒ¼ö¾ø´Â °ªÀÔ´Ï´Ù");
			window.location.reload();
		}
	}

		//coffeeÅ×ÀÌºí¿¡ °ª³Ö±â 
		function postDataFromAPI() {
			if($("#demo_price").val()=="")
				alert("°ªÀ» ³ÖÀ¸¼¼¿ä");
			else if($("#demo_inventory").val()=="")
				alert("°ªÀ» ³ÖÀ¸¼¼¿ä");
			else if($("#demo_name").val()=="")
				alert("°ªÀ» ³ÖÀ¸¼¼¿ä");
			else if($("#demo_name").val().indexOf("/") != -1){
			      alert("ÀÔ·ÂÇÒ¼ö¾ø´Â °ªÀÔ´Ï´Ù");
			      window.location.reload(true);
			   }else if($("#demo_name").val().indexOf("@") != -1){
			      alert("ÀÔ·ÂÇÒ¼ö¾ø´Â °ªÀÔ´Ï´Ù");
			      window.location.reload(true);
			   }else if($("#demo_name").val().indexOf("<") != -1){
			      alert("ÀÔ·ÂÇÒ¼ö¾ø´Â °ªÀÔ´Ï´Ù");
			      window.location.reload(true);
			   }else if($("#demo_name").val().indexOf(">") != -1){
			      alert("ÀÔ·ÂÇÒ¼ö¾ø´Â °ªÀÔ´Ï´Ù");
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
					alert("µî·Ï¿Ï·á!");
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

		//µî·Ï ÈÄ redirect ¼³Á¤
		function redirect() {
			window.location = "/findall"
		}
	</script>
</body>
</html>