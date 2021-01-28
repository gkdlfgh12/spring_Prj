<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
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

.page-active {
	background-color: #643691;
}
</style>
        <div id="layoutError">
            <div id="layoutError_content">
                <main>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-6">
                                <div class="text-center mt-4">
                                    <h1 class="display-1">500</h1>
                                    <p>요청이 올바르지 않습니다.</p>
                                    <a href="<c:url value='/' />">
                                        <i class="fas fa-arrow-left mr-1"></i>
                                        메인 페이지로 돌아가기
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
            
        </div><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
       <jsp:include page="../include/footer.jsp" />