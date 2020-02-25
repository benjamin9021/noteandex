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
</head>
<body>
	<div class="container">
		<div class="row">
			<button class="btn btn-default">test3</button>
		</div>
	</div>


<script type="text/javascript">
	$(document).ready(function() {
		$(".btn-default").click(function() {
			var val = $("input").val(); // val 변수에 인풋데이터의 값을 담고 
			
			$.ajax({
				type:'post',
				url: '/test/test3',
				data:{
					'title'  : val,  //title 에 val 값이 들어간다.
					"writer" : 'w1',
					'content': 'c1' 
				},
				dataType:'text',
				success: function(result) {
					alert(result);
					console.log(result);
					var obj = JSON.parse(result); //이렇게하면 자바스크립트에 접근 할 때 제이슨을 객체로 만들어 준다.
					alert(obj.title)
				}	
			});
		});
	});

</script>

</body>
</html>