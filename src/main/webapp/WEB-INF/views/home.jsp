<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="include/header.jsp" />

<jsp:include page="include/footer.jsp" />
  
<script>
const message = "${boardAccessMsg}";
if (message === "boardDeny") {
	alert("회원제 게시판입니다. 로그인 하십시오.");
}
const message1 = "${msg}";
if (message1 === "delSuc") {
	alert("탈퇴 안료");
}
</script>