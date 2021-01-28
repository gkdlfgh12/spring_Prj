<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>MU</title>

  <!-- Bootstrap core CSS -->
  <link rel="stylesheet" href="<c:url value='/vendor/bootstrap/css/bootstrap.min.css'/>">

  <!-- Custom fonts for this template -->
  <link rel="stylesheet" type="text/css" href="<c:url value='/vendor/fontawesome-free/css/all.min.css'/>" >
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
  <link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
  <link href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
  <link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700' rel='stylesheet' type='text/css'>

  <!-- Custom styles for this template -->
  <link rel="stylesheet" href="<c:url value='/css/agency.min.css'/>" >
  
  <!-- Bootstrap core JavaScript -->
  <script src="<c:url value='/vendor/jquery/jquery.min.js'/>"></script>
  <script src="<c:url value='/vendor/bootstrap/js/bootstrap.bundle.min.js'/>"></script>
	
  <!-- Plugin JavaScript -->
  <script src="<c:url value='/vendor/jquery-easing/jquery.easing.min.js'/>"></script>
  <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>

  
<style>

.music-menu {
	background-color: #F15F5F;
	border: 1px solid #fffe2e;
	
}
.music-tap {
	color: white;
}
.music-tap:hover {
    background-color: #F15F5F;
    color: #F7FE2E;
    text-shadow: 5px 2px 2px black;
}

.dropdown:hover > .dropdown-menu { 
    display: block;  
}
</style>


</head>

<body id="page-top">

  <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
    <div class="container">
      <a class="navbar-brand" href="/">
      	MU Cafe<%-- <img class="img-fluid" src="<c:url value='/img/mark.png'/>" alt="" style="width:130px; height:70px;" /> --%>
      </a>
      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive">
        메뉴
        <i class="fas fa-bars"></i>
      </button>
      
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav text-uppercase ml-auto">
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="/">HOME</a>
          </li>
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="<c:url value='/introduce'/>">선수단</a>
          </li>
         
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="<c:url value='/off/load' />">cafe 찾아오는 길</a>
          </li>
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="<c:url value='/board/list' />">회원제 게시판</a>
          </li>
          <c:if test="${login == null}" >
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" data-toggle="modal" data-target="#log-in">LOGIN</a>
          </li>
          </c:if>
         <c:if test="${login.userGrade == 'default_user'}" >
          <li class="nav-item">
       	   	<a class="nav-link js-scroll-trigger" href="/user/mypage?account=${login.account}">MYPAGE</a>
          </li>
          <li class="nav-item">
        	<a class="nav-link js-scroll-trigger" href="/user/logout" onclick="return confirm('진짜로 로그아웃 하는거에요?')">LOGOUT</a>
          </li>
          </c:if>
          
          <c:if test="${login.userGrade == 'admin'}" >
          	<li class="nav-item">
       	   	<a class="nav-link js-scroll-trigger" href="/admin/user">회원관리</a>
          </li>
          <li class="nav-item">
        	<a class="nav-link js-scroll-trigger" href="/user/logout" onclick="return confirm('진짜로 로그아웃 하는거에요?')">LOGOUT</a>
          </li>
          </c:if>
        </ul>
        
      </div>
    </div>
    <c:if test="${login != null}">
    <div class="nav-item">
       <a class="btn btn-chu text-uppercase js-scroll-trigger" href="#">${login.name}님 입장</a>
    </div>
    </c:if>
    <c:if test="${login == null}">
    <div class="nav-item">
       <a class="btn btn-chu text-uppercase js-scroll-trigger" href="#">비로그인</a>
    </div>
    </c:if>
  </nav>
  <br><br><br>

  <!-- Header -->
  <header class="masthead">
		<div class="container">
			<div class="intro-text">
				
				<button class="btn btn-chu btn-xl text-uppercase js-scroll-trigger"
					>MU</button>
				
				<%-- <c:if test="${login != null}">
					<a class="btn btn-chu btn-xl text-uppercase js-scroll-trigger"
						href="#">${login.name}님 안녕~</a>
				</c:if> --%>
			</div>
		</div>
	</header>


<%@ include file="../users/login_modal.jsp" %>  
  

