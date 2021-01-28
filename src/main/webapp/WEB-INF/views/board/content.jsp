<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../include/header.jsp" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- 댓글 모듈 등록 -->
<script src="/js/reply.js"></script>

<style>
header.masthead {
	display: none;
}
.page-active{
	background-color: #643691;
}
</style>
<br />
<br />
<div class="container">
	<input type="hidden" id="replynum" value="${replynum}">
	<div class="row">
		<div class="col-lg-10">
			<div class="card">
				<div class="card-header text-white"
					style="background-color: #643691;" >번호<div id="no">${article.boardNo}</div>
				</div>
				<div class="card-body">


					<div class="form-group">
						<label>작성자</label> <input type="text" class="form-control"
							name='writer' value="${article.writer}" readonly>
					</div>

					<div class="form-group">
						<label>제목</label> <input type="text" class="form-control"
							name='title' value="${article.title}" readonly>
					</div>

					<div class="form-group">
						<label>내용</label>
						<textarea class="form-control" rows="5" name='content' readonly>${article.content}</textarea>
					</div>

					<form id="formObj" role="form"
						action="<c:url value='/board/delete/' />" method="post">
						<input type="hidden" id="userGrade" value="${login.userGrade}">
						<input type="hidden" id="account" value="${login.account}">
						<input type="hidden" name="boardNo" value="${article.boardNo}">
						<input type="hidden" name="page" id="page" value="${page.page }" /> <input
							type="hidden" name="countPerPage" id="countPerPage" value="${page.countPerPage }" />
						<input type="hidden" name="keyword" id="keyword" value="${se.keyword }" /> <input
							type="hidden" name="condition" id="condition" value="${se.condition }" /> <input
							type="button" value="목록" class="btn" id="list-btn"
							style="background-color: #643691; margin-top: 0; height: 40px; color: white; border: 0px solid #388E3C; opacity: 0.8">&nbsp;&nbsp;
					<c:if test="${login.account == article.writer || login.userGrade == 'admin'}">
						<input type="button" value="수정" class="btn" id="modBtn"
							style="background-color: orange; margin-top: 0; height: 40px; color: white; border: 0px solid #388E3C; opacity: 0.8">&nbsp;&nbsp;

						<input type="submit" value="삭제" class="btn"
							onclick="return confirm('정말로 삭제하시겠습니까?')"
							style="background-color: red; margin-top: 0; height: 40px; color: white; border: 0px solid #388E3C; opacity: 0.8">&nbsp;&nbsp;
					</c:if>
					</form>

				</div>
			</div>
		</div>
	</div>
	<!-- 댓글 처리 --><br><br>
	<c:if test="${login != null}">
	<button type="button" class="btn btn-defalut" data-toggle="modal" id="replyWriteBtn"
		data-target="#myModal">댓글 달기</button>
	</c:if>
		<div id="replyPaging">
			<div>
				
			</div>
		</div>
	</div>

<!-- 댓글 리스트 -->
<div class="container">
<div class="row">
	<div class="col-lg-10">
		<div class="card">
			<div id="replyListDiv" class="list-group">
				<ul class="list-group">
					
				</ul>
			</div>
		</div>
	</div>

		
	</div>
</div>
<br>
<br>




<!-- 모달 창, 처음에는 안보이고 이벤트 발생시 나타남-->
<div id="myModal" class="modal fade" role="dialog">
	<div class="modal-dialog">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
			<!-- 댓글 달기를 클릭하면 "댓글 쓰기"로 댓글 수정을 클릭하면 "댓글 수정"으로 제목 변경 -->
				<h4 class="modal-title">댓글 입력</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<div class="modal-body">
				<p>
				<form id="replyWriteForm">
					<!-- 댓글 수정시 댓글번호가 필요하다. -->
					<input type="hidden" id="rno"/>
					<div class="form-group">
						<label for="content">내용</label>
						<textarea class="form-control" rows="5" id="content"></textarea>
					</div>

					<div class="form-group">
						<label for="writer">작성자</label> 
						<input type="text" class="form-control" id="writer" value="${login.account}" readonly>
					</div>
				</form>
				</p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" id="replyWriteProccessBtn">입력</button>
				<button type="button" class="btn btn-default" id="replyUpdateProccessBtn">수정</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>


<jsp:include page="../include/footer.jsp" />

<script>
	const message = "${msg}";
	if (message === "modSuccess") {
		alert("수정이 완료되었습니다.");
	}

	//제이쿼리의 시작
	$(function() {

		//댓글 리스트는 이벤트가 없더라도 무조건 뿌려야한다.
		
		var replynum = $("#replynum").val();
		var page=$("#page").val();
		var countPerPage=$("#countPerPage").val();
		var condition=$("#condition").val();
		var keyword=$("#keyword").val();
		const account=$("#account").val();
		const userGrade=$("#userGrade").val();
		
		console.log("replynum :  "+replynum);
		getList(replynum);
		
		//댓글 리스트를 가져오는 함수 선언 - 호출을 해야 실행된다.
		function getList(replynum) {
			
			if(!replynum) replynum = 1;
			
			pageInfo = {};
			pageInfo.page = replynum;
			pageInfo.no = $("#no").text();
			
			//ajax 처리 호출
			replyService.list(pageInfo, function(result){
				
				var startNum = result.rpc.beginPage;
				var endNum = result.rpc.endPage;
				var boardNo = $("#no").text();
				var prev = result.rpc.prev;
				var next = result.rpc.next;
				
				var pageSrc = "<ul class='pagination pull-right'>";
				
				console.log(startNum+" "+endNum);
				
				if(prev){
					pageSrc += "<li class='page-item'><a href='"+boardNo+"?replynum="+i+"&page="+page +"&countPerPage="+countPerPage+"&keyword="+keyword+"&condition="+condition+"'>"+[이전]+"</a></li>";
				}
				
				for(var i=startNum; i<=endNum; i++){
					pageSrc += "<li class='page-item'>";
					pageSrc += "<a class='page-link' href='"+boardNo+"?replynum="+i+"&page="+page +"&countPerPage="+countPerPage+"&keyword="+keyword+"&condition="+condition+"'>" + i + "</a>";
					pageSrc += "</li>";
				} 
				if(next){
					pageSrc += "<li class='page-item'><a href='"+boardNo+"?replynum="+i+"&page="+page +"&countPerPage="+countPerPage+"&keyword="+keyword+"&condition="+condition+"'>"+[다음]+"</a></li>";
				}
				
				pageSrc += "</ul>"
				$("#replyPaging > div").append(pageSrc);
				//alert("리스트 가져오기 성공")
				//alert(JSON.stringify(result.rpc));
				
				//데이터를 표시할 예제 div > ul를 댓글 검색이 성공하면 없앤다.
				
				//데이터가 많으므로 반복문 처리 - json으로 된 값을 each문으로 
				 $(result.list).each(function(idx, vo){
					 
					 var reBool;
					 //댓글 작성자와 로그인한 유저 비교 후 수정, 삭제 버튼 부여
					 if(account == vo.writer || userGrade == 'admin'){
						 reBool=true;
						 console.log("true");
					 }else{
						 reBool=false;
					 }
					 
					
					if(reBool){						
						var src = ""; 
						src += "<li class='list-group-item rowData'>"
						src += " [번호 <span class='rno'>"+ vo.rno+"</span>]. [내용] "
							+  "<span class='content'>"+vo.content+"</span>"
						src += "<span class='badge' style='background: none;'>" ;			
						src += "<button class='replyUpdateBtn btn btn-default' style='background-color: #A0A0A0;'>수정</button>";
						src += "<button class='replyDeleteBtn btn btn-default' style='background-color: #A0A0A0;'>삭제</button>";
						src += "</span>";
						src += "<br />[작성자]  ";
						src += "<span class='writer'>"+vo.writer+"</span>   ("+vo.writeDate+") ";
						src += "</li>";
					}else{
						var src = ""; 
						src += "<li class='list-group-item rowData'>"
						src += " [번호 <span class='rno'>"+ vo.rno+"</span>]. [내용] "
							+  "<span class='content'>"+vo.content+"</span>"
						src += "<span class='badge' style='background: none;'>" ;
						src += "</span>";
						src += "<br />[작성자]  ";
						src += "<span class='writer'>"+vo.writer+"</span>   ("+vo.writeDate+") ";
						src += "</li>";
					}
					//작성이 된 li태그를 replyListDiv안에 ul 태그에 추가시킨다.
					$("#replyListDiv > ul").append(src);
				 });
				
			});
			
		}
		
		
//////////////////////////////////////////////////////////////////////////////////////////////////////
		
		const formElement = $("#formObj");

		//목록버튼 클릭 이벤트 처리
		$("#list-btn")
				.click(
						function() {
							console.log("목록 버튼이 클릭됨!");
							location.href = "/board/list?page=${page.page}&countPerPage=${page.countPerPage}&keyword=${se.keyword}&condition=${se.condition}";
						});

		//수정 버튼 클릭 이벤트
		const modifyBtn = $("#modBtn");
		modifyBtn.click(function() {
			console.log("수정 버튼이 클릭됨!");
			formElement.attr("action", "/board/modify");
			formElement.attr("method", "get");
			formElement.submit();
		});

		
//////////////////댓글 수정////////////////////////////////////////////////////////////////////////////////////
		
		//댓글 수정 모달창 여는 이벤트
		$("#replyListDiv").on("click",".replyUpdateBtn", function() {
			
			//alert("댓글 수정 버튼 클릭됨.");
			$("#myModal").find(".modal-title").text("댓글 수정");
			
			//수정 데이터 셋팅
			var rowData = $(this).closest(".rowData");
			$("#rno").val(rowData.find(".rno").text());
			$("#content").val(rowData.find(".content").text());
			$("#writer").val(rowData.find(".writer").text());
			
			$("#replyWriteProccessBtn").hide();
			$("#replyUpdateProccessBtn").show();
			//모달창 보이기
			$("#myModal").modal("show");
			
		});
		
		
		//댓글 수정처리 이벤트
		 $("#replyUpdateProccessBtn").click(function() {
			
			var reply = {};
			reply.rno = $("#rno").val();
			reply.content = $("#content").val();
			reply.writer = $("#writer").val();
			//reply.replyPage = $("#replyPage").text();
			
			replyService.update(JSON.stringify(reply), 
					function() { 
					//모달창 입력란을 비운다.
					$("#content").val("");
					$("#writer").val("");
					$("#myModal").modal("hide");  //입력 성공후 모달 자동 닫기
					alert("수정 완료");
					
					//댓글을 달린후 리스트를 다시 뿌린다.
					$("#replyListDiv > ul").empty();
					$("#replyPaging > div").empty();
					getList(replynum);
				});
			

		});
		
		
		
		/////////////////////댓글 작성//////////////////////////////////////////////////////
		
		//댓글 달기 모달창 여는 이벤트
		$("#replyWriteBtn").click(function() {
			
			$("#myModal").find(".modal-title").text("댓글 쓰기");
		
			//수정 데이터 비우기
			var rowData = $(this).closest(".rowData");
			$("#rno").val("");
			$("#content").val("");
			$("#writer").val("${login.account}");
		
			$("#replyWriteProccessBtn").show();
			$("#replyUpdateProccessBtn").hide();
			
		});
		
		
		
		//댓글 작성처리 이벤트
		 $("#replyWriteProccessBtn").click(function() {
			var reply = {};
			reply.no = $("#no").text();
			reply.content = $("#content").val();
			reply.writer = $("#writer").val();
			//alert(reply.no);
			//alert(JSON.stringify(reply));
			
			replyService.add(JSON.stringify(reply), 
					function() {  //ajax 댓글 입력 성공시 실행될 함수
					//모달창 입력란을 비운다.
					$("#content").val("");
					$("#writer").val("");
					$("#myModal").modal("hide");  //입력 성공후 모달 자동 닫기
					alert('댓글 쓰기 완료');
					//댓글을 달린 후 기존 화면에 있는 댓글 리스트를 삭제후 댓글 리스트를 다시 뿌린다.
					$("#replyListDiv > ul").empty();
					$("#replyPaging > div").empty();
					getList(replynum);
				});

		});

////////////////////////////////////////댓글 삭제//////////////////////////////////////////////////////

		//댓글 삭제 시작
		$("#replyListDiv").on("click", ".replyDeleteBtn", function(){
			
			var rowData = $(this).closest(".rowData");
			var reply = {};
			
			reply.rno = rowData.find(".rno").text();
			//댓글 번호 확인
			//alert(reply.rno);
			replyService.replyDel(JSON.stringify(reply), function() {
				alert("삭제 완료");
				$("#replyListDiv > ul").empty();
				$("#replyPaging > div").empty();
				getList(replynum);
			});
			
			
		});  //댓글 끝



	}); //제이쿼리의 끝
</script>























