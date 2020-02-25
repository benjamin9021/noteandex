<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
         <h1>글 자세히 보기</h1>
         
         <div class="form-group">
            <label for="title">제목</label>
            <input id="title" name="title" value="${vo.title}" readonly class="form-control">
         </div>
         <div class="form-group">
            <label for="writer">작성자</label>
            <input id="writer" name="writer" value="${vo.writer}" readonly class="form-control">
         </div>
         <div class="form-group">
            <label for="content">내용</label>
            <textarea id="content" name="content" rows="5" readonly class="form-control">${vo.content}</textarea> <!-- textarea는 한줄에다가 다 넣어야함, 종료태그를 엔터쳐서 그사이에 넣으면 시작이 띄워져서 나옴 -->
         </div>
      </div> <!-- class = row -->
      
      <div class="row">
         <form>
            <input type="hidden" name="bno" value="${vo.bno}"> <!-- 폼태그를 사용하여 데이터를 보내줌 -->
            <!-- 나중에 현재페이지 값을 여기에 넣어줘서 목록버튼을 눌렀을때 1페이지가 아닌 현재 페이지로 가도록 설정해줌 -->
            <input type="hidden" name="curPage" value="${curPage}"}>
            <!-- read에서 목록 눌렀을때 curPage로 가도록 curPage 데이터를 보내줌 -->
         </form>
         <div class="form-group">
            <button class="btn btn-info" id="reply_form">댓글</button>
            <button class="btn btn-success">수정</button>
            <button class="btn btn-danger">삭제</button>
            <button class="btn btn-primary">목록</button>
         </div>
      </div> <!-- class = row -->
      
      <!-- collapse:열렸다가 닫혔다가함(댓글버튼을 누르면 여기가 열렸다가 닫혔다가 하게하기) -->
      <div class="row">
         <div class="collapse" id="myCollapsible">
            <div class="form-group">
               <label for="replyer">작성자</label>
               <input class="form-control" id="replyer" name="replyer">
            </div>
            <div class="form-group">
               <label for="replytext">내용</label>
               <input class="form-control" id="replytext" name="replytext">
            </div>
            
            <!-- 이 버튼은 실제 누르면 DB로 댓글이 입력되는 버튼, 위에있는 댓글버튼은 열렸다가 닫혔다가 하게하는 버튼임 -->
            <div class="form-group">
               <button class="btn btn-warning" id="insertReply">댓글 등록</button>
               <button class="btn btn-default">댓글 취소</button>
            </div>
            
         </div>
      </div><!-- class = row -->
      
      <!-- 댓글 보여주는곳 -->
      <div class="row">
         <div id="replies">
         
      <%-- 밑에 getList함수에 썼기때문에 지우면됨, jsp주석 사용하면 소스에 안나옴
            <div class="panel panel-info">
               <div class="panel-heading">
                  <span>rno: 1, 작성자: 홍길동</span>
                  <span class="pull-right">2020-02-21 09:23</span>
               </div>
               <div class="panel-body" data-rno=""> <!-- data-rno: 사용자 속성, 수정이나 삭제할때 rno 데이터 가져가기  -->
                  <p>댓글 내용 들어가는곳</p>
                  <button class="btn btn-link btn-update">수정</button> <!-- btn-update는 클래스명(여기 부분이 여러번 반복되는데 id가 중복되면 안되기 때문에 클래스이용) -->
                  <button class="btn btn-link btn-delete">삭제</button>
               </div>
            </div>
       --%>
             
         </div>
      </div> <!-- class = row -->
      
      <!-- 수정, 모달창 사용 위의 수정버튼(class가 btn-update인것)을 클릭하면 모달창이 켜짐, 모달창은 정적으로 만든것임 -->
      <div class="row">
         <div id="myModal" class="modal">
            <div class="modal-dialog">
               <div class="modal-header">
                  <button data-dismiss="modal" class="close">&times;</button> <!-- 모달 없애는 버튼(class="close"), 사용자 속성 이용 -->
                  <p id="modal_rno">11</p>
               </div>
               
               <div class="modal-body">
                  <input id="modal_replytext" class="form-control">
               </div>
               
               <div class="modal-footer">
                  <button class="btn btn-warning btn-xs" id="modal_update" data-dismiss="modal">수정</button> <!-- data-dismiss="modal"때문에 여기의 수정, 취소 버튼을 클릭하면 모달창이 없어짐 -->
                  <button class="btn btn-warning btn-xs" id="modal_close" data-dismiss="modal">취소</button> <!-- 취소버튼을 눌러을때 다른 작업은 필요없음(취소버튼 누르면 모달창이 꺼짐)  -->
               </div>
            </div>
         </div>
      </div> <!-- class = row -->
      
   </div> <!-- class = container -->

<script type="text/javascript">
   var bno = ${vo.bno};
   
   $(document).ready(function() {
      
      //목록
      $(".btn-primary").click(function(){
         location.assign("/board/listpage?curPage=${curPage}"); //폼태그 사용안하고 location 메서드 사용, list를 listpage로 바꿔주고 curPage 데이터를 가지고감
      });
      
      
      //수정
      $(".btn-success").click(function(){
         $("form").attr("method", "get");
         $("form").attr("action", "/board/update");
         $("form").submit();
      });
      
      
      //삭제
      $(".btn-danger").click(function(){
         $("form").attr("method", "post");
         $("form").attr("action", "/board/delete/${vo.bno}/${curPage}");
         $("form").submit();
      });

      //댓글버튼 클릭하면 댓글 입력창이 나타남
      $("#reply_form").click(function() {
         $("#myCollapsible").collapse("toggle");
      });
      
      
      
      //댓글등록을 누르면 댓글이 등록됨
      $("#insertReply").click(function() {
         var replyer = $("#replyer").val();
         var replytext = $("#replytext").val();
         
         $.ajax({
            type : 'post',
            url : '/replies',
            headers : {
               'Content-Type' : 'application/json',
               'X-HTTP-Method-Override' : 'post'
            },
            data : JSON.stringify({
               replyer : replyer,
               replytext : replytext,
               bno : bno
            }),
            dataType :'text',
            success : function(result) {
               alert("insert success");
               $("#replyer").val(''); //val 안이 비어있으면 가져오는거고, val 안에 값을 넣으면 값을 넣어주는것임, ''는 아무것도 안넣어줌
               $("#replytext").val('');
               getList(bno); // 댓글 입력한 후에 새로고침 없이 입력한 댓글 보이게 하기위해 getList 다시 호출
            }
         });
      });
      
      
      
      getList(bno); //메서드 호출
      

      
      //댓글 삭제 동적으로 생성된 '삭제'버튼을 누르면 삭제가 되도록 on()이용
      $("#replies").on("click", ".btn-delete", function() {   
         //그냥 이대로 삭제하면 클래스가 btn-delete인 것들(댓글들 모두)이 모두 삭제됨, 따라서 $(this)를 써줌 - 내가 방금 클릭한 것만 삭제됨
         //.parent().attr: rno값을 가져오기위한 코드 (button의 부모(parent)태그-div class="panel-body"인것)
         var rno = $(this).parent().attr("data-rno"); //attr의 파라미터가 하나면 저 속성의 값을 넘겨라, 두개면 이 속성에 이 값을 넣어라
         
         $.ajax({   //실제 삭제 작업
            type: 'delete',
            url : '/replies/' + rno,   //@PathVariable 쓰려면 url 뒤에도 /를 추가해줘야함 /replies/ 이런식으루
            headers : {
               'Content-Type' : 'application/json',
               'X-HTTP-Method-Override' : 'delete'
            },
            /* data :JSON.stringify({ url에서 + rno해서 rno를 보냈기 때문에 data 보낼 필요가 없다
               rno : rno
            }), */
            dataType : 'text',
            success : function(result) {
               alert(result);
               getList(bno); //데이터 갱신
            }
         })
      });
      
      
      
      // 댓글 수정, 모달창 이용
      $("#replies").on("click", ".btn-update", function() {
         $("#myModal").modal("show");
         var rno = $(this).parent().attr("data-rno"); // 주석처리된 수정버튼 위에있는 div태그에(class="panel-body") rno 값이 있음, this = #myModal
         var replytext = $(this).prev("p").text(); // 주석처리된 수정버튼 앞에있는 p태그에(댓글 입력하는곳) replytext 값이 있음
         
         $("#modal_rno").text(rno); //text()괄호가 비어있으면 값을 가져오는거고 text(rno) 이렇게 해주면 text에 rno값을 넣어주는것임
         $("#modal_replytext").val(replytext);
         
         $("#modal_update").click(function() {   //모달창은 정적으로 만들었기 때문에 .on()이 아닌(동적으로 만든 것일때 사용) .click을 써도 된다
            
            var rno = $("#modal_rno").text();
            var replytext = $("#modal_replytext").val();
            
            $.ajax({
               
               type : "put",
               url : '/replies',
               headers : {
                  'Content-Type' : 'application/json',
                  'X-HTTP-Method-Override' : 'put'
               },
               
               data : JSON.stringify({ 
                  rno : rno,
                  replytext : replytext
               }),
               dataType : 'text',
               success : function(data) {
                  alert(data);
                  getList(bno);
               }
               
            });
            
         });
         
      });
      
      
   }); //$(document).ready 종료지점
   
   
   
   
   function getList(bno) { //댓글 가져오는 함수 만들기
      //select 할때는 $.getJSON 사용, select 아닐때는 (cud작업) ajax 사용
      $.getJSON("/replies/"+bno, function(data) {
         var str ="";
         for(var i=0; i<data.length; i++) {
            var obj = data[i];
            //이 밑에는 엔터치면 안됨, 위에 있는 panel-info 안의 내용을 복사해서 한줄로 만듬, 그리고 실제 데이터로 바꿔줌
            str += '<div class="panel panel-info"><div class="panel-heading"><span>rno: '+obj.rno+', 작성자: '+obj.replyer+'</span><span class="pull-right">'+obj.updatedate+'</span></div><div class="panel-body" data-rno="'+obj.rno+'"><p>'+obj.replytext+'</p><button class="btn btn-link btn-update">수정</button><button class="btn btn-link btn-delete">삭제</button></div></div>';
         }
         $("#replies").html(str);
         //console.log(data);   data의 형태를 보려고 찍음(list형태임), 실제로도 개발할때는 data의 형태를 계속 확인하면서 해야함, 그것을 가공하고 변환하면서 사용해야함
      });
   }
</script>

</body>
</html>








