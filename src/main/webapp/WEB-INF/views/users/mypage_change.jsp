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
<!-- 회원가입 Modal -->
<div class="container">
	
		<!-- Modal content-->
			<h4>
				<span style="color: #643691;">회원 정보 변경하기</span>
			</h4>
		
			<%-- 	<form action="<c:url value='/user/mypageChAction'/>" name="signup" id="mySignUpForm" method="post"
					style="margin-bottom: 0;"> --%>
					<table
						style="cellpadding: 0; cellspacing: 0; margin: 0 auto; width: 100%">
						<tr>
							<td style="text-align: left">
								<p><strong>아이디</strong>&nbsp;&nbsp;&nbsp;</p>
							</td>
								
							
						</tr>
						<tr>
							<td><input type="text" name="account" class="form-control tooltipstered" maxlength="14" id="myAccount"
								required="required" aria-required="true" style="margin-bottom: 25px; width: 100%; height: 40px; border: 1px solid #d9d9de"
								value="${userInfo.account}" readonly>
								</td>
							
						</tr>

						<tr>
							<td style="text-align: left">
								<p><strong>비밀번호</strong>&nbsp;&nbsp;&nbsp;<span id="pwChk1"></span></p>
							</td>
						</tr>
						<tr>
							<td><input type="password" size="14" maxlength="14" id="myPassword"
								name="myPassword" class="form-control tooltipstered" 
								required="required" aria-required="true"
								style="ime-mode: inactive; margin-bottom: 25px; height: 40px; border: 1px solid #d9d9de"
								placeholder="영문과, 특수문자를 포함한 최소 8자 최대 14자" value="">
								</td>
						</tr>
						<tr>
							
						<tr>
							<td style="text-align: left">
								<p><strong>비밀번호를 재입력</strong>&nbsp;&nbsp;&nbsp;<span id="pwChk11"></span></p>
							</td>
						</tr>
						<tr>
							<td><input type="password" size="14" maxlength="14" id="myPassword_check"
								name="myPassword_check" class="form-control tooltipstered" 
								required="required" aria-required="true"
								style="ime-mode: inactive; margin-bottom: 25px; height: 40px; border: 1px solid #d9d9de"
								placeholder="비밀번호가 일치해야합니다."></td>
						</tr>	
							
						<tr>
							<td style="text-align: left">
								<p><strong>이름</strong>&nbsp;&nbsp;&nbsp;<span id="nameChk1"></span></p>
							</td>
						</tr>
						<tr>
							<td><input type="text" name="name" id="myUser_name"
								class="form-control tooltipstered" maxlength="6"
								required="required" aria-required="true"
								style="margin-bottom: 25px; width: 100%; height: 40px; border: 1px solid #d9d9de" value="${userInfo.name }">
								</td>
						</tr>
						
						<tr>
							<td style="text-align: left">
								<p><strong>이메일</strong>&nbsp;&nbsp;&nbsp;<span id="emailChk"></span></p>
							</td>
						</tr>
						<tr>
							<td><input type="email" name="userEmail" id="myUser_email"
								class="form-control tooltipstered" 
								required="required" aria-required="true"
								style="margin-bottom: 25px; width: 100%; height: 40px; border: 1px solid #d9d9de"
								value="${userInfo.userEmail }" readonly></td>
						</tr>

						<tr>
							<td style="text-align: left">
								<p><strong>가입일 : </strong>&nbsp;&nbsp;&nbsp;<span id="regDate1">${userInfo.regDate }</span></p><br>
							</td>
						</tr>

						<tr>
							<td style="padding-top: 10px; text-align: left">
							<button class="btn" id="mypageChBtn" style="background-color: #643691; margin-top: 0; height: 40px; color: white; border: 0px solid #643691; opacity: 0.8">
							저장
							</button>
							</td>
						</tr>

					</table>
				<!-- </form> -->
</div>


<jsp:include page="../include/footer.jsp" />

<script>
	//jquery 시작
	$(function() {
		
		const getPwCheck= RegExp(/([a-zA-Z0-9].*[!,@,$,%,&,*,^,#,?,_,~])|([!,@,$,%,&,*,^,#,?,_,~].*[a-zA-Z0-9])/);
		const getName= RegExp(/^[가-힣]+$/);
		const getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
		
		let chk2 = true, chk3 = true , chk4 = true;
		let chk2_1 = 1;
		
		//1차pw 검증
		$("#myPassword").on('keyup', function() {
			chk3 = false;
			if($("#myPassword").val() === ""){
				$("#myPassword").css("background-color","pink");    
				$("#pwChk1").html('<b style="font-size:14px; color:red;"> [비밀번호는 필수 정보 입니다.]</b>');
				chk2 = false;
				
			}else if(!getPwCheck.test($("#myPassword").val())){
				$("#myPassword").css("background-color","pink");    
				$("#pwChk1").html('<b style="font-size:14px; color:red;"> [영문자, 특수문자 8-14로 작성]</b>');
				chk2 = false;
				
			}else{
				$("#myPassword").css("background-color","aqua"); 
				$("#pwChk1").html('<b style="font-size:14px; color:blue;"> [조건 충족!]</b>');
				chk2 = true;
				
				chk2_1 = 3;
			}
		});//1차pw 검증
		
		//2차pw 검증
		$("#myPassword_check").on('keyup', function() {
			
			if($("#myPassword_check").val() != $("#myPassword").val()){
				$("#myPassword_check").css("background-color","pink");
				$("#pwChk11").html('<b style="font-size:14px; color:red;"> [비밀번호 정보가 다릅니다.]</b>');
				chk3 = false;
			}else{
				$("#myPassword_check").css("background-color","aqua"); 
				$("#pwChk11").html('<b style="font-size:14px; color:blue;"> [체크 완료!]</b>');
				chk3 = true;
				chk2_1 = 3;
			}
			
		});//2차pw 끝
		
		//이름 한글 검증
		$("#myUser_name").on('keyup', function() {
		
			if($("#myUser_name").val() === ""){
				$("#myUser_name").css("background-color","pink");    
				$("#nameChk1").html('<b style="font-size:14px; color:red;"> [이름입력은 필수 정보 입니다.]</b>');
				chk4 = false;
			}else if(!getName.test($("#myUser_name").val())){
				$("#myUser_name").css("background-color","pink");    
				$("#nameChk1").html('<b style="font-size:14px; color:red;"> [이름에는 한글만 입력하십시오.]</b>');
				chk4 = false;
			}else{
				$("#myUser_name").css("background-color","aqua"); 
				$("#nameChk1").html('<b style="font-size:14px; color:blue;"> [체크 완료!]</b>');
				chk4 = true;
			}
		}); //이름 검증 끝.
		
	
		
		//변경 버튼
		$("#mypageChBtn").click(function() {
		
		if(chk2 && chk3 && chk4){	
			//아이디 정보
			const id = $('#myAccount').val();
			//패스워드 정보
			const pw = $('#myPassword').val();
			//이름 정보
			const name = $('#myUser_name').val();
			//이메일 정보
			const regDate = $('#regDate1').text();
			
			//pw값을 서버에 전송할지 말지 결정
			if(chk2_1 == 1){
				location.href="/user/mypageChAction?account="+id+"&name="+name;
			}else if(chk2_1 == 3){
				location.href="/user/mypageChAction?account="+id+"&name="+name+"&password="+pw;
			}
			
			
			
			
			
		}else {  //회원가입 입력폼 조건 충족 안될시
			alert('입력 정보를 다시 확인하세요!');
		}	
	});//signup-btn 회원가입 이벤트 처리 끝.
});
</script>


