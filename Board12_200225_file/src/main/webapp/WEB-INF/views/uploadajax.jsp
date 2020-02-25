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

<style type="text/css">
	
	.fileDrop{
		width: 100%;
		height: 200px;
		border: 1px dotted red;
	}
</style>

</head>
<body>
	<div class="container">
		<div class="row">
			<div class="fileDrop"></div>
			<div class="uploadedlist"></div>
		</div>	<!-- 	class = row -->
	</div>		<!-- 	class = container -->

<!-- 	기존 파일 드래그 했을 때 켜지는 기능이 아닌 업로드를 할것이기에 기존 filedrop 기능을 막는 작업을 할것 이다. -->

	<script type="text/javascript">
		$(document).ready(function() {
			$(".fileDrop").on("dragenter dragover", function(event) {
				event.preventDefault();  
// 				preventDefault -> event 발생을 막아라
			});
// 			동적으로 만들어진 태그에 이벤트를 걸어줄 때 on 을 주로 사용.

			$(".fileDrop").on("drop", function(event) {
				event.preventDefault();  	//드랍 기능을 막았다.
				
				var files = event.originalEvent.dataTransfer.files;
			//  event.originalEvent.dataTransfer.files; -> 한개의 파일을  드래그 했을 때 파일들의 정보를 받아온다..
			// 여러개의 파일은 알아서 하기	
				var file = files[0];  //우리는 하나만 가져오기에 0을 넣었다 여러개 넣을 때는 배열이 올라갈 것.
				var formData = new FormData();	// 객체 생성 폼태그의 역할을 한다.
					formData.append("file" , file);	//파일을 file 이란 이름으로 추가 했다 . ajax를 이용해서 업로드 할것이다.
					$.ajax({
						type: "post",
						url : "/uploadajax",
						data : formData,
						dataType: "text",
						processData : false,	//파일업로드시 ajax 에는 processData 를 추가 해야함.. 기본값은 true
						contentType : false,	//파일업로드시 ajax 에는 contentType 를 추가 해야함.. 기본값은 true multipart/form-data 로들어가기에 false
						success: function(data) {
							console.log(data)
						}
					});
			}); 
		});
	
	</script>


</body>
</html>