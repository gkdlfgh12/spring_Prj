<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../include/header.jsp" />
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
		
				<h4>
					<span style="color: #643691;">회원 정보</span>
				</h4><br><br>
		
				<table
						style="cellpadding: 0; cellspacing: 0; margin: 0 auto; width: 100%">
						<tr>
							<td style="text-align: left">
								<p><strong>ID : </strong>&nbsp;&nbsp;&nbsp;<span id="account">${userInfo.account }</span></p><br>
							</td>
						</tr>
					
						<tr>
							<td style="text-align: left">
								<p><strong>PASSWORD : </strong>&nbsp;&nbsp;&nbsp;<span>*******</span></p><br>
							</td>
						</tr>
						
						<tr>
							<td style="text-align: left">
								<p><strong>이름 : </strong>&nbsp;&nbsp;&nbsp;<span>${userInfo.name }</span></p><br>
							</td>
						</tr>
						
						<tr>
							<td style="text-align: left">
								<p><strong>E-Mail : </strong>&nbsp;&nbsp;&nbsp;<span>${userInfo.userEmail }</span></p><br>
							</td>
						</tr>
						
						<tr>
							<td style="text-align: left">
								<p><strong>가입일 : </strong>&nbsp;&nbsp;&nbsp;<span>${userInfo.regDate }</span></p><br>
							</td>
						</tr>

						<tr>
							<td style="padding-top: 10px; text-align: left">
							<button class="btn" id="mypageCh" style="background-color: #643691; margin-top: 0; height: 40px; color: white; border: 0px solid #643691; opacity: 0.8">
							변경하기
							</button>
							<button class="btn" id="withdrawalBtn" style="background-color: #643691; margin-top: 0; height: 40px; color: white; border: 0px solid #643691; opacity: 0.8">
							탈퇴
							</button>
							</td>
						</tr>
						
						

					</table>
			</div>


<jsp:include page="../include/footer.jsp" />

<script>
	//jquery 시작
	$(function() {
		
		//회원정보 페이지로 이동
		$("#mypageCh").click(function() {
			
			var account =$("#account").text();
			location.href='/user/mypageChForm?account='+account;
		
		});
		
		//회원탈퇴
		$("#withdrawalBtn").click(function() {
			
			var con= confirm("정말 회원 탈퇴하시겠습니까?");
			if(con){
				var account =$("#account").text();
				location.href='/user/memWithdrawal?account='+account;
			}
			
		});
		
		
	});
</script>








