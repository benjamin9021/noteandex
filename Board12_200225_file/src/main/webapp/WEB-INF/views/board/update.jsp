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
			<h1>게시글 수정</h1>
			<form method="post" class="form-horizontal">
			
				<input type="hidden" name="curPage" value="${curPage}">
				
				<div class= "form-group">
					<label for="bno" class="col-xs-2 control-label" >글번호</label>
					<div class="col-xs-10">
						<input readonly="readonly" value="${vo.bno}" class="form-control" name ="bno" id="bno">
					</div>
				</div>
				
				<div class= "form-group">
					<label for="writer" class="col-xs-2 control-label" >작성자</label>
					<div class="col-xs-10">
						<input value="${vo.writer}" class="form-control" name ="writer" id="writer">
					</div>
				</div>
				
				<div class= "form-group">
					<label for="title" class="col-xs-2 control-label" >제목</label>
					<div class="col-xs-10">
						<input value="${vo.title}" class="form-control" name ="title" id="title">
					</div>
				</div>
				
				
				<div class= "form-group">
					<label for="content" class="col-xs-2 control-label" >내용</label>
					<div class="col-xs-10">
						<textarea  rows="5" class="form-control" id="content" name ="content">"${vo.content}"</textarea>
					</div>
				</div>

			</form >
			
			<div class="form-group">
				<div class="col-xs-offset-2 col-xs-10">
					<button class="btn btn-primary" type="submit">수정</button>
					<button class="btn btn-warning" type="reset">초기화</button>
				</div>
			</div>
			
		</div>
	</div>


<script type="text/javascript">
	$(document).ready(function() {
		$("button[type='submit']").click(function() {
// 			$("form").attr("method","post");				//이렇게 따로 따로 지정 가능
			$("form").attr("action","/board/update");
			$("form").submit();		// 스프링은 알아서 form 데이터가 서버로 간다 다만 form 태그에 post 방식으로 만들어 줘야 함.
									// form 이 여러개라면 배열 처럼 [] 사용 해야 함.
		});
		
		
		   $("button[type='reset']").click(function(){
	            location.href = "/board/read/${vo.bno}"; // 보드 리스트로 포워딩 시킨다.
	       });
	});
</script>

</body>
</html>