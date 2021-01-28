<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="../include/header.jsp" />
<style>
header.masthead {
	
	display: none;
}	
.btn-orange {
	background-color: orange;
	color: white;
}
.btn-izone {
	background-color: #643691;
	color: white;
}
.page-active{
	background-color: #643691;
}
</style>

<br><br> 
 
    <!-- Begin Page Content -->
	

	<div class="container">
		<div class="row">
			<div class="col-lg-2">
			</div>
			<div class="col-lg12">
				<div class="panel-body">
				<h2 class="page-header"><span style="color: #643691;">MU</span> 자유 게시판
					<span id="count-per-page" style="float: right;">
	                     <input class="btn btn-izone" type="button" value="10">  
	                     <input class="btn btn-izone" type="button" value="20">   
	                     <input class="btn btn-izone" type="button" value="30">
                     </span>
					
				</h2>
					<table class="table table-bordered table-hover">
						<thead>
							<tr style="background-color: #643691; margin-top: 0; height: 40px; color: white; border: 0px solid #f78f24; opacity: 0.8">
								<th>#번호</th>
								<th>작성자</th>
								<th>제목</th>
								<th>작성일</th>
								<th>조회수</th>
							</tr>
						</thead>

						<!-- 게시물이 들어갈 공간 -->
						<c:forEach var="b" items="${articles}">
							<tr style="color: #643691;">
								<td>${b.boardNo}</td>
								<td>${b.writer}</td>

								<td><a style="margin-top: 0; height: 40px; color: orange;" href="<c:url value='/board/content/${b.boardNo}?page=${pc.paging.page }&countPerPage=${pc.paging.countPerPage}&keyword=${se.keyword}&condition=${se.condition}' />">
										${b.title}
									</a>&nbsp;
								<!-- new 마크 입력 -->
								<c:if test="${b.newMark}">
									<span class="badge badge-pill badge-danger">new</span>
								</c:if>
								</td>

								<td>
								<fmt:formatDate value="${b.regDate}" pattern="yyyy년 MM월 dd일 HH:mm:ss"/> 
								</td>
								<td>${b.viewCnt}</td>
							</tr>
						</c:forEach>
					</table>
					
					<!-- 페이징 처리 부분  -->
					<ul class="pagination justify-content-center">
                       	<c:if test="${pc.prev}">
	                       	<li class="page-item">
								<a class="page-link" href="<c:url value='/board/list?page=${pc.beginPage - 1 }&countPerPage=${pc.paging.countPerPage}&keyword=${se.keyword}&condition=${se.condition}' />" 
								style="background-color: #643691; margin-top: 0; height: 40px; color: white; border: 0px solid #f78f24; opacity: 0.8">이전</a>
							</li>
						</c:if>
						<c:forEach var="i" begin="${pc.beginPage }" end="${pc.endPage }">
							<li class="page-item">
							   <a href="<c:url value='/board/list?page=${i}&countPerPage=${pc.paging.countPerPage}&keyword=${se.keyword}&condition=${se.condition}' />" class="page-link ${(pc.paging.page == i) ? 'page-active' : '' }" id="pageBTN" style="margin-top: 0; height: 40px; color: pink; border: 1px solid #643691;">${i }</a>
							</li>
					   	</c:forEach>
					   	<c:if test="${pc.next}">
						    <li class="page-item">
						      <a class="page-link" href="<c:url value='/board/list?page=${pc.endPage + 1 }&countPerPage=${pc.paging.countPerPage}&keyword=${se.keyword}&condition=${se.condition}' />" 
						      style="background-color: #643691; margin-top: 0; height: 40px; color: white; border: 0px solid #f78f24; opacity: 0.8">다음</a>
						    </li>
					    </c:if>
				    </ul>
					<!-- 페이징 처리 끝 -->
					</div>
				</div>
			</div>
					<!-- 검색 버튼 -->
					<div class="row">
						<div class="col-sm-2"></div>
	                    <div class="form-group col-sm-2">
	                        <select id="condition" class="form-control" name="condition">                            	
	                            <option value="title">제목</option>
	                            <option value="content">내용</option>
	                            <option value="writer">작성자</option>
	                            <option value="titleContent">제목+내용</option>
	                        </select>
	                    </div>
	                    <div class="form-group col-sm-4">
	                        <div class="input-group">
	                            <input type="text" class="form-control" name="keyword" id="keywordInput" placeholder="검색어">
	                            <span class="input-group-btn">
	                                <input type="button" value="검색" class="btn btn-izone btn-flat" id="searchBtn">                                       
	                            </span>
	                        </div>
	                    </div>
	                    <div class="col-sm-2">
	                  		<a href="<c:url value='/board/write' />" class="btn btn-izone float-right">글쓰기</a>
						</div>
						<div class="col-sm-2"></div>
					</div>
					
		
	</div>
	
	<script>
		//글쓰기 완료 시 띄울 알림창 처리.
		const result = "${msg}";
		if(result === "regSuccess") {
			alert("게시글 등록이 완료되었습니다.");
		} else if(result === "delSuccess") {
			alert("게시글 삭제가 완료되었습니다.");
		}
		
		//start jQuery
		$(function() {
			//countPerPage 늘리기
			$("#count-per-page .btn-izone").click(function() {
				
				let count=$(this).val();
				location.href="/board/list?page=${pc.paging.page}&countPerPage="+count+"&keyword=${se.keyword}"+"&condition=${se.condition}";
			});
			
			//검색
			$("#searchBtn").click(function() {
				
				const keyword = $("#keywordInput").val();
				const condition = $("#condition option:selected").val();
				
				location.href="/board/list?keyword="+keyword
									+"&condition="+condition;
				
				
			});// 검색 끝
			
			//엔터키 입력시 이벤트 발생
			$("#keywordInput").keydown(function(key) {
				
				//키의 값의 아스키코드 13번이랑 갖으면 true
				if(key.keyCode == 13){  
					$("#searchBtn").click();
				}
				
			});
			
		});//end jQuery
	</script>
	
	
<jsp:include page="../include/footer.jsp" />




















