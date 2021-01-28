<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../../include/header.jsp" />
  <style>
  
  
	header.masthead {
		display: none;
	}
	.page-active{
		background-color: #643691;
	}
  
  </style>

 <br>
 <div class="container">
        <h1>회원 관리</h1>
	<table class="table">
		<thead>
			<tr>
				<th>id</th>
				<th>이름</th>
				<th>비밀번호</th>
				<th>이메일</th>
				<th>이메일 인증 여부</th>
				<th>유저 권한</th>
				<th>가입일</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="users" items="${list}">
				<tr class="userInfo">
					<td><a
						href="<c:url value='/admin/user/content?account=${users.account }&page=${uservo.page}&keyword=${uservo.keyword}&condition=${uservo.condition}'/>">${users.account }
					</a></td>
					<td>${users.name }</td>
					<td>******</td>
					<td>${users.userEmail }"</td>
					<td>${users.setAuthKey}</td>
					<td>${users.userGrade}</td>
					<td>${users.regDate }</td>

				</tr>
			</c:forEach>
		</tbody>
	</table>

	<!-- 페이징 처리 부분  -->
	<ul class="pagination justify-content-center">
		<c:if test="${upc.prev}">
			<li class="page-item"><a class="page-link"
				href="<c:url value='/admin/user?page=${upc.beginPage - 1 }&countPerPage=${upc.paging.countPerPage}&keyword=${uservo.keyword}&condition=${uservo.condition}' />"
				style="background-color: #643691; margin-top: 0; height: 40px; color: white; border: 0px solid #f78f24; opacity: 0.8">이전</a>
			</li>
		</c:if>
		<c:forEach var="i" begin="${upc.beginPage }" end="${upc.endPage }">
			<li class="page-item"><a
				href="<c:url value='/admin/user?page=${i}&countPerPage=${upc.paging.countPerPage}&keyword=${uservo.keyword}&condition=${uservo.condition}' />"
				class="page-link ${(upc.paging.page == i) ? 'page-active' : '' }"
				id="pageBTN"
				style="margin-top: 0; height: 40px; color: pink; border: 1px solid #643691;">${i }</a>
			</li>
		</c:forEach>
		<c:if test="${upc.next}">
			<li class="page-item"><a class="page-link"
				href="<c:url value='/admin/user?page=${upc.endPage + 1 }&countPerPage=${upc.paging.countPerPage}&keyword=${uservo.keyword}&condition=${uservo.condition}' />"
				style="background-color: #643691; margin-top: 0; height: 40px; color: white; border: 0px solid #f78f24; opacity: 0.8">다음</a>
			</li>
		</c:if>
	</ul>

	<!-- 검색 버튼 -->
			<div class="row">
				<div class="col-sm-2"></div>
	                  <div class="form-group col-sm-2">
	                      <select id="condition" class="form-control" name="condition">                            	
	                          <option value="id">아이디</option>
	                          <option value="name">이름</option>
	                          <option value="email">이메일</option>
	                          <option value="grade">권한</option>
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
				<div class="col-sm-2"></div>
			</div>


</div>  
<jsp:include page="../../include/footer.jsp" />

<script>
	//jquery 시작
	$(function name() {
		
		//검색 버튼 클릭
		$("#searchBtn").click(function() {
			
			var condition = $("#condition").val();
			var keyword = $("#keywordInput").val();
			location.href="/admin/user?keyword="+keyword
			+"&condition="+condition;
		});
		
		//엔터키 입력시 이벤트 발생
		$("#keywordInput").keydown(function(key) {
			
			if(key.keyCode == 13){ 
				$("#searchBtn").click();
			}
			
		});
	});
</script>