<%@page import="com.fasterxml.jackson.databind.ObjectMapper"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.naver.dto.MemberDTO"%>
<%@page import="java.util.List"%>
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


<%	
// DB에서 받은 데이터를 제이슨 형태로 바꿔서 컨트롤러에 객체를 보내보자
	List<MemberDTO> list = new ArrayList<MemberDTO>();
	list.add(new MemberDTO("m001","kim",11));
	list.add(new MemberDTO("m002","lee",22));
	list.add(new MemberDTO("m003","park",33));
	ObjectMapper mapper = new ObjectMapper();
	String mlist = mapper.writeValueAsString(list); //이렇게 하면 String 형태로 데이터가 만들어진다.
	pageContext.setAttribute("mlist",mlist);	//바인딩 해줘서 EL 을 사용 해야 한다.
%>
	<div class="container">
		<div class="row">
			<input>
			<button class="btn btn-warning">test4</button>
		</div>
	</div>
<script type="text/javascript">
	$(document).ready(function() {
		$(".btn-warning").click(function() {
			var val = $("input").val(); // val 변수에 인풋데이터의 값을 담고 
			
			$.ajax({
				type:'post',
				url: '/test/test4',
				data:{
					mlist : JSON.stringify(${mlist}) //제이슨객체를 스트링으로 바꿔 준다.
				},
				dataType:'text',
				success: function(result) {
					console.log(result);
// 					받아온 값을 사용하고 싶다면
					var arr = JSON.parse(result);		//넘어온 제이슨 값을 변수에 담아 배열에 사용..
					for (var i = 0; i < arr.length; i++) {
						var obj = arr[i];
						alert(obj.id)
						alert(obj.name)
					}
				}	
			});
		});
	});
</script>

</body>
</html>