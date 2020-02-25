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
			<div class = "jumbotron">
				<h1>글 쓰 기</h1>
			</div>
			<form method="post">
			
				<div class= "form-group">
					<label for="title">제목</label>
					<input required="required" class="form-control" name ="title" id="title">
				</div>
				<div class="form-group">
					<label for="writer">작성자</label>
					<input required="required" class="form-control" name ="writer">
				</div>
				<div class="form-group">
					<label for="content">내용</label>
					<textarea required="required" rows="5" class="form-control" id="content" name ="content"></textarea>
				</div>
				
			</form >
			
			<div class="form-group">
				<button class="btn btn-primary" type="submit">등록</button>
				<button class="btn btn-warning" type="reset">초기화</button>
			</div>
		</div>
	</div>


<script type="text/javascript">
	$(document).ready(function() {
		$("button[type='submit']").click(function() {
// 			$("form").attr("method","post");				//이렇게 따로 따로 지정 가능
// 			$("form").attr("action","/board/insert");
			$("form").submit();		// 스프링은 알아서 form 데이터가 서버로 간다 다만 form 태그에 post 방식으로 만들어 줘야 함.
									// form 이 여러개라면 배열 처럼 [] 사용 해야 함.
		});
		
		   $("button[type='reset']").click(function(){
	            location.href = "/board/list"; // 보드 리스트로 포워딩 시킨다.
	       });
	});
</script>




</body>
</html>