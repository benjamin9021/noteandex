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
			<input class="form-control">
			<button class="btn btn-default">rest1</button>
		</div>
	</div>

<script type="text/javascript">
	$(document).ready(function() {
		$(".btn-default").click(function() {
			var val = $("input").val(); // val 변수에 인풋데이터의 값을 담고 
			
			$.ajax({
				type :'post',
				url  : '/rest1',
				headers:{			// rest 사용하면 헤더스 사용..
					'Content-Type' : 'application/Json',
					'X-HTTP-Method-Override' : 'POST'	// 얘는 type 과 같게 사용..
				},
				data : JSON.stringify({
					test1:val
				}),
				dataType:'text',
				success: function(result) {
					console.log(result);
				}	
			});
		});
	});
</script>

</body>
</html>