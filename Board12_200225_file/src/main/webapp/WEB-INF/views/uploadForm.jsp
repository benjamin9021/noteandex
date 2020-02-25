<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


<style type ="text/css">
	iframe{
	width: 0px;
	height: 0px;
	border: 0px;
	}

</style>


</head>
<body>


	<div class="container">
		<div class="row">
			<form id="form" enctype="multipart/form-data" action="uploadForm" method="post" target="test">  
							<!-- 			ㅇㅕ기서 target 값은 iframe 이랑같이  -->
				<input type ="file" name="file">
				<input name="title">
				<input type="submit">
			</form>
		</div>
	</div>
	
<!-- iframe 을 이용하여 ajax 처럼 화면이 깜박이지 않고 비동기 통신 비슷하게 해보자.	 -->
	<iframe name="test">
	
	</iframe>


<script type="text/javascript">
	function addFilePath(result) {
		alert(result);
		document.getElementById("form").reset();
	}
</script>

</body>
</html>