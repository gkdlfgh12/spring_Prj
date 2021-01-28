<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../include/header.jsp" %>
<style>
header.masthead {
	background-image: url('/img/player/mu.jpg');
}	
.intro-table {
	background-color:#FFFFFF;
	width: 100%;
	border: 2px solid #23C293;
}
.intro-tr {
	width: 100%;
	border: .8px solid gray;	
}
td > span {
	padding: 1px 3px;
}
</style>
<!-- Member Grid -->
<div class="container">
  <section class="bg-light" id="portfolio" style="padding-top: 90px; padding-bottom: 0;">
    <div class="container">
      
	  
      <div class="row">
        <div class="col-md-4 col-sm-6 portfolio-item">
          <a class="portfolio-link" data-toggle="modal">
            <div class="portfolio-hover">
              <div class="portfolio-hover-content">
              </div>
            </div>
            <img class="img-thumbnail img-fluid" src="<c:url value='/img/player/am.PNG'/>" alt="">
          </a>
          <div class="portfolio-caption">
            <h4>마시알</h4>
            <p class="text-muted">공격수</p>
          </div>
        </div>
        <div class="col-md-4 col-sm-6 portfolio-item">
          <a class="portfolio-link" data-toggle="modal">            
          <div class="portfolio-hover">
              <div class="portfolio-hover-content">
              </div>
           </div>
            <img class="img-thumbnail img-fluid" src="<c:url value='/img/player/dh.PNG'/>" alt="">
          </a>
          <div class="portfolio-caption">
            <h4>데 헤아</h4>
            <p class="text-muted">골키퍼</p>
          </div>
        </div>
        <div class="col-md-4 col-sm-6 portfolio-item">
          <a class="portfolio-link" data-toggle="modal" href="#KangHyeWon">   
            <div class="portfolio-hover">
              <div class="portfolio-hover-content">
              </div>
            </div>         
            <img class="img-thumbnail img-fluid" src="<c:url value='/img/player/eb.PNG'/>" alt="">
          </a>
          <div class="portfolio-caption">
            <h4>에릭 바이</h4>
            <p class="text-muted">수비수</p>
          </div>
        </div>
        <div class="col-md-4 col-sm-6 portfolio-item">
          <a class="portfolio-link" data-toggle="modal" href="#ChoiYeNa">  
            <div class="portfolio-hover">
              <div class="portfolio-hover-content">
              </div>
            </div>          
            <img class="img-thumbnail img-fluid" src="<c:url value='/img/player/hm.PNG'/>" alt="">
          </a>
          <div class="portfolio-caption">
            <h4>후안 마타</h4>
            <p class="text-muted">미드필더</p>
          </div>
        </div>
        <div class="col-md-4 col-sm-6 portfolio-item">
          <a class="portfolio-link" data-toggle="modal" href="#LeeChaeYeon"> 
            <div class="portfolio-hover">
              <div class="portfolio-hover-content">
              </div>
            </div>           
            <img class="img-thumbnail img-fluid" src="<c:url value='/img/player/mg.PNG'/>" alt="">
          </a>
          <div class="portfolio-caption">
            <h4>메과이어</h4>
            <p class="text-muted">수비수</p>
          </div>
        </div>
        <div class="col-md-4 col-sm-6 portfolio-item">
          <a class="portfolio-link" data-toggle="modal" href="#KimChaeWon">     
            <div class="portfolio-hover">
              <div class="portfolio-hover-content">
              </div>
            </div>      
            <img class="img-thumbnail img-fluid" src="<c:url value='/img/player/mr.PNG'/>" alt="">
          </a>
          <div class="portfolio-caption">
            <h4>래시포드</h4>
            <p class="text-muted">공격수</p>
          </div>
        </div>
        <div class="col-md-4 col-sm-6 portfolio-item">
          <a class="portfolio-link" data-toggle="modal" href="#KimMinJu"> 
            <div class="portfolio-hover">
              <div class="portfolio-hover-content">
              </div>
            </div>           
            <img class="img-thumbnail img-fluid" src="<c:url value='/img/player/nm.PNG'/>" alt="">
          </a>
          <div class="portfolio-caption">
            <h4>마티치</h4>
            <p class="text-muted">미드필더</p>
          </div>
        </div>
        <div class="col-md-4 col-sm-6 portfolio-item">
          <a class="portfolio-link" data-toggle="modal" href="#nako">   
            <div class="portfolio-hover">
              <div class="portfolio-hover-content">
              </div>
            </div>         
            <img class="img-thumbnail img-fluid" src="<c:url value='/img/player/pp.PNG'/>" alt="">
          </a>
          <div class="portfolio-caption">
            <h4>폴 포크바</h4>
            <p class="text-muted">미드필더</p>
          </div>
        </div>
        <div class="col-md-4 col-sm-6 portfolio-item">
          <a class="portfolio-link" data-toggle="modal" href="#hitomi">
            <div class="portfolio-hover">
              <div class="portfolio-hover-content">
              </div>
            </div>            
            <img class="img-thumbnail img-fluid" src="<c:url value='/img/player/rd.PNG'/>" alt="">
          </a>
          <div class="portfolio-caption">
            <h4>린델로프</h4>
            <p class="text-muted">수비수</p>
          </div>
        </div>
        <div class="col-md-4 col-sm-6 portfolio-item">
          <a class="portfolio-link" data-toggle="modal" href="#ChoYuRi">  
            <div class="portfolio-hover">
              <div class="portfolio-hover-content">
              </div>
            </div>          
            <img class="img-thumbnail img-fluid" src="<c:url value='/img/player/sm.PNG'/>" alt="">
          </a>
          <div class="portfolio-caption">
            <h4>맥토미니</h4>
            <p class="text-muted">미드필더</p>
          </div>
        </div>
        <div class="col-md-4 col-sm-6 portfolio-item">
          <a class="portfolio-link" data-toggle="modal" href="#AhnYuJin">
            <div class="portfolio-hover">
              <div class="portfolio-hover-content">
              </div>
            </div>            
            <img class="img-thumbnail img-fluid" src="<c:url value='/img/player/wb.PNG'/>" alt="">
          </a>
          <div class="portfolio-caption">
            <h4>완 비사카</h4>
            <p class="text-muted">수비수</p>
          </div>
        </div>
        <div class="col-md-4 col-sm-6 portfolio-item">
          <a class="portfolio-link" data-toggle="modal" href="#JangWonYoung"> 
            <div class="portfolio-hover">
              <div class="portfolio-hover-content">
              </div>
            </div>           
            <img class="img-thumbnail img-fluid" src="<c:url value='/img/player/dj.PNG'/>" alt="">
          </a>
          <div class="portfolio-caption">
            <h4>제임스</h4>
            <p class="text-muted">미드필더</p>
          </div>
        </div>
      </div>
    </div>
  </section>

</div> 

<%@ include file="../include/footer.jsp" %>