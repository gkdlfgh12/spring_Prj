<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../../include/header.jsp" />
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

<div class="container">
	<br>
	<br>
	<h4>
		<span style="color: #643691;">회원정보 변경</span> 
	</h4>

	<div>

		<%-- <form action="<c:url value='/admin/user/update'/>" name="signup"
			id="signUpForm1" method="post" style="margin-bottom: 0;"> --%>
			<table
				style="cellpadding: 0; cellspacing: 0; margin: 0 auto; width: 100%">
				<tr>
					<td style="text-align: left">
						<p>
							<strong>아이디.</strong>&nbsp;&nbsp;&nbsp;<span ></span>
						</p>
					</td>


				</tr>
				<tr>
					<td><input type="text" name="account" id="accountVal"
						class="form-control tooltipstered" maxlength="14"
						required="required" aria-required="true"
						style="margin-bottom: 25px; width: 100%; height: 40px; border: 1px solid #d9d9de"
						placeholder="숫자와 영어로 4-10자" readonly value="${user.account }"></td>

				</tr>

				<tr>
					<td style="text-align: left">
						<p>
							<strong>비밀번호 </strong>&nbsp;&nbsp;&nbsp;<span id="pwChkVal"></span>
						</p>
					</td>
				</tr>
				<tr>
					<td><input type="password" size="17" maxlength="20" id="passwordVal"
						 name="password" class="form-control tooltipstered"
						required="required" aria-required="true"
						style=" margin-bottom: 25px; height: 40px; border: 1px solid #d9d9de"
						placeholder="영문과, 특수문자를 포함한 최소 8자 최대 14자" value=""></td>
				</tr>
				
				

				<tr>
					<td style="text-align: left">
						<p>
							<strong>이름.</strong>&nbsp;&nbsp;&nbsp;<span id="nameChkVal"></span>
						</p>
					</td>
				</tr>
				<tr>
					<td><input type="text" name="name" id="nameVal"
						class="form-control tooltipstered" maxlength="10"
						required="required" aria-required="true"
						style="margin-bottom: 25px; width: 100%; height: 40px; border: 1px solid #d9d9de"
						value="${user.name }"></td>
				</tr>

				<tr>
					<td style="text-align: left">
						<p>
							<strong>이메일.</strong>&nbsp;&nbsp;&nbsp;<span id="emailChkVal1"></span>
						</p>
					</td>
				</tr>
				<tr>
					<td><input type="text" name="userEmail" id="userEmailVal"
						class="form-control tooltipstered" required="required"
						aria-required="true"
						style="margin-bottom: 25px; width: 100%; height: 40px; border: 1px solid #d9d9de"
						value="${user.userEmail }"></td>
				</tr>
				
				<tr>
					<td style="text-align: left">
						<p>
							<strong>이메일 인증</strong>&nbsp;&nbsp;&nbsp;<span></span>
						</p>
					</td>
				</tr>
				
				<tr>
					<td><select class="form-control tooltipstered" name="setAuthKey" required="required"
						aria-required="true" id="authVal"
						style="margin-bottom: 25px; width: 100%; height: 40px; border: 1px solid #d9d9de">
							
							<c:if test="${(user.setAuthKey != 'NO') && (user.setAuthKey != 'YES')}">
								<option value="YES">YES</option>
								<option value="NO" selected="selected">NO</option>
							</c:if>
							<c:if test="${user.setAuthKey == 'NO'}">
								<option value="YES">YES</option>
								<option selected="selected" value="NO">NO</option>
							</c:if>
							<c:if test="${user.setAuthKey == 'YES'}">
								<option selected="selected" value="YES">YES</option>
								<option value="NO">NO</option>
							</c:if>
							
							
					</select></td>
				</tr>

				<tr>
					<td style="text-align: left">
						<p>
							<strong>권한</strong>&nbsp;&nbsp;&nbsp;<span></span>
						</p>
					</td>
				</tr>

				<tr>
					<td><select class="form-control tooltipstered" name="userGrade" required="required"
						aria-required="true" id="gradeVal"
						style="margin-bottom: 25px; width: 100%; height: 40px; border: 1px solid #d9d9de">
							<c:if test="${user.userGrade == 'admin'}">
								<option selected="selected" value="admin">admin</option>
								<option value="default_user">default_user</option>
							</c:if>
							<c:if test="${user.userGrade == 'default_user'}">
								<option value="admin">admin</option>
								<option selected="selected" value="default_user">default_user</option>
							</c:if>
					</select></td>
				</tr>

				<tr>
					<td style="text-align: left">
						<p>
							<strong>가입일.</strong>&nbsp;&nbsp;&nbsp;<span></span>
						</p>
					</td>
				</tr>
				<tr>
					<td><input type="text" readonly class="form-control tooltipstered" required="required"
						aria-required="true"
						style="margin-bottom: 25px; width: 100%; height: 40px; border: 1px solid #d9d9de" value="${user.regDate }" ></td>
				</tr>
		
				<tr>
					<td style="width: 50%; text-align: center; colspan: 2;">
					<input type="button" id="updateBtn" value="변경 저장">
					<input type="button" id="chBtn" value="목록">
					</td>
				</tr>

			</table>
		<!-- </form> -->
	</div>
</div>
<jsp:include page="../../include/footer.jsp" />

<script>
$(function() {
	$("#chBtn").click(function() {
		location.href="/admin/user?page=${uservo.page}&keyword=${uservo.keyword}&condition=${uservo.condition}";
	});
	
	
	
	const getPwCheck= RegExp(/([a-zA-Z0-9].*[!,@,$,%,&,*,^,#,?,_,~])|([!,@,$,%,&,*,^,#,?,_,~].*[a-zA-Z0-9])/);
	const getName= RegExp(/^[가-힣]+$/);
	const getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
	
	let chk1 = true, chk2 = true , chk3 = true; 
	let chk1_1 = 1;
	//1차pw 검증
	$("#passwordVal").on('keyup', function() {
	
		if($("#passwordVal").val() === ""){
			$("#passwordVal").css("background-color","pink");    
			$("#pwChkVal").html('<b style="font-size:14px; color:red;"> [비밀번호는 필수 정보 입니다.]</b>');
			chk1 = false;
			
		}else if(!getPwCheck.test($("#passwordVal").val())){
			$("#passwordVal").css("background-color","pink");    
			$("#pwChkVal").html('<b style="font-size:14px; color:red;"> [영문자, 특수문자 8-14로 작성]</b>');
			chk1 = false;
			
		}else{
			$("#passwordVal").css("background-color","aqua"); 
			$("#pwChkVal").html('<b style="font-size:14px; color:blue;"> [조건 충족!]</b>');
			chk1 = true;
			chk1_1 = 3;
			
		}
	});//1차pw 검증
		
	//이름 한글 검증
	$("#nameVal").on('keyup', function() {
	
		if($("#nameVal").val() === ""){
			$("#nameVal").css("background-color","pink");    
			$("#nameChkVal").html('<b style="font-size:14px; color:red;"> [이름입력은 필수 정보 입니다.]</b>');
			chk2 = false;
		}else if(!getName.test($("#nameVal").val())){
			$("#nameVal").css("background-color","pink");    
			$("#nameChkVal").html('<b style="font-size:14px; color:red;"> [이름에는 한글만 입력하십시오.]</b>');
			chk2 = false;
		}else{
			$("#nameVal").css("background-color","aqua"); 
			$("#nameChkVal").html('<b style="font-size:14px; color:blue;"> [체크 완료!]</b>');
			chk2 = true;
		}
	}); //이름 검증 끝.
	
	//이메일 검증 시작
	$("#userEmailVal").on('keyup', function() {
		if($("#userEmailVal").val() === ""){
			$("#userEmailVal").css("background-color","pink");
			$("#emailChkVal1").html('<b style="font-size:14px; color:red;"> [이메일 입력은 필수 정보 입니다.]</b>');
			console.log("첫 번째");
			chk3 = false;
		}else if(!getMail.test($("#userEmailVal").val())){
			$("#userEmailVal").css("background-color","pink");
			$("#emailChkVal1").html('<b style="font-size:14px; color:red;"> [이메일 입력 조건에 맞지 않습니다.]</b>');
			console.log("두번째");
			chk3 = false;
		}else{
			
			const userEmail = $(this).val();
			console.log("3번째");
			$.ajax({
				type:"post",
				url:"/user/emailCheck",
				data:userEmail,
				dataType:"text",
				headers:{ "Content-Type" : "application/json" },
				success: function(result) {
					if(result==="OK"){
						$("#userEmailVal").css("background-color", "aqua");
						$("#emailChkVal1").html('<b style="font-size:14px; color:green;">[이메일 사용이 가능합니다!]</b>');
						chk5 = true;
					}else{
						$("#userEmailVal").css("background-color", "pink");
						$("#emailChkVal1").html('<b style="font-size:14px; color:red;">[해당 이메일을 사용할수 없습니다.]</b>');
						chk5 = false;
					}
				},
				error: function() {
					console.log(id);
					console.log("통신 실패");
				}
			});
		}
	
	});	
	
	//유저정보 jquery로 변경
	$("#updateBtn").click(function() {
		if(chk1 && chk2 && chk3){
			var account = $("#accountVal").val();
			var password = $("#passwordVal").val();
			var name = $("#nameVal").val();
			var userEmail = $("#userEmailVal").val();
			var auth = $("#authVal").val();
			var grade = $("#gradeVal").val();
			
			if(chk1_1 == 1){
				//pw값을 제외하고 보낸다.
				location.href="/admin/user/update?account="+account+"&name="+name+"&userEmail="+userEmail+"&setAuthKey="+auth+"&userGrade="+grade;
				
			}else if(chk1_1 == 3){
				//pw값을 보낸다
				location.href="/admin/user/update?account="+account+"&password="+password+"&name="+name+"&userEmail="+userEmail+"&setAuthKey="+auth+"&userGrade="+grade;
			}
			
		}else{
			
			alert("입력값을 다시 확인해주세요.");
		}
		
	});
});
	

</script>















