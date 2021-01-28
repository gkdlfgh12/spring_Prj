<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- 로그인 Modal-->
<div class="modal fade" id="log-in">
	<div class="modal-dialog">
		<div class="modal-content">

			<!-- Modal Header -->
			<div class="modal-header">
				<h4 class="modal-title">
					<span style="color: #643691;">MU</span> 로그인
				</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>

			<!-- Modal body -->
			<div class="modal-body">

				<form action="#" name="izone-sign-in" method="post" id="signInForm"
					style="margin-bottom: 0;">
					<table style="cellpadding: 0; cellspacing: 0; margin: 0 auto; width: 100%">
						<tr>
							<td style="text-align: left">
								<p><strong>아이디를 입력해주세요.</strong>&nbsp;&nbsp;&nbsp;<span id="idCheck"></span></p>
							</td>
						</tr>
						<tr>
							<td><input type="text" name="userId" id="signInId"
								class="form-control tooltipstered" maxlength="14"
								required="required" aria-required="true"
								style="margin-bottom: 25px; width: 100%; height: 40px; border: 1px solid #d9d9de"
								placeholder="최대 14자"></td>
						</tr>
						<tr>
							<td style="text-align: left">
								<p><strong>비밀번호를 입력해주세요.</strong>&nbsp;&nbsp;&nbsp;<span id="pwCheck"></span></p>
							</td>
						</tr>
						<tr>
							<td><input type="password" size="14" maxlength="14" id="signInPw"
								name="userPw" class="form-control tooltipstered" 
								required="required" aria-required="true"
								style="ime-mode: inactive; margin-bottom: 25px; height: 40px; border: 1px solid #d9d9de"
								placeholder="최소 8자 최대 14자"></td>
						</tr>
						
						<!-- 자동 로그인 체크박스 -->
						<tr>
							<td>
								<input type="checkbox" id="auto-login" name="autoLogin"> 자동 로그인
							</td>
						</tr>
						
						<tr>
							<td>
								<a href="#" data-toggle="modal" data-target="#idModal" >ID/PW</a>찾기
							</td>
						</tr>
						
						<tr>
							<td style="padding-top: 10px; text-align: center">
								<p><strong>로그인하셔서 MU회원이 되어보세요~~!</strong></p>
							</td>
						</tr>
					
						<tr>
							<td style="width: 100%; text-align: center; colspan: 2;"><input
								type="button" value="로그인" class="btn form-control tooltipstered" id="signIn-btn"
								style="background-color: #643691; margin-top: 0; height: 40px; color: white; border: 0px solid #f78f24; opacity: 0.8">
							</td>
						</tr>
						<tr>
							<td
								style="width: 100%; text-align: center; colspan: 2; margin-top: 24px; padding-top: 12px; border-top: 1px solid #ececec">

								<a class="btn form-control tooltipstered" data-toggle="modal"
								href="#sign-up"
								style="cursor: pointer; margin-top: 0; height: 40px; color: white; background-color: orange; border: 0px solid #388E3C; opacity: 0.8">
									회원가입</a>
							</td>
						</tr>

					</table>
				</form>
			</div>
		</div>
	</div>
</div>

<!-- id/pw 찾기 모달 -->
<div id="idModal" class="modal fade" role="dialog">
	<div class="modal-dialog modal-lg">
		<!-- Modal content-->
		<div class="modal-content">
			<div id="layoutAuthentication">
				<div class="card shadow-lg border-0 rounded-lg mt-5">

					<div class="card-body">
						<div class="card-header">
							<h3 class="text-center font-weight-light my-4">아이디 찾기</h3>
						</div>
						<div class="small mb-3 text-muted">회원가입때 생성한 이메일과 이름을 입력시면
							해당 이메일로 아이디가 전송 됩니다.</div>
						<form>

							<div class="form-group">
								<label class="small mb-1" for="inputEmailAddress">Email : </label> 
								<input class="form-control py-4" id="searchEmail" type="email" aria-describedby="emailHelp" placeholder="이메일 입력" /> 
								<label class="small mb-1" for="inputEmailAddress">이름 : </label> 
								<input class="form-control py-4" id="searchName" type="text" aria-describedby="emailHelp" placeholder="이름 입력" />
							</div>
							<div class="form-group d-flex align-items-center justify-content-between mt-4 mb-0">
								<button type="button" class="btn btn-default" id="idfind">아이디 찾기</button>
							</div>
						</form>
					</div>
					<div class="card-body">
						<div class="card-header">
							<h3 class="text-center font-weight-light my-4">비밀번호 찾기</h3>
						</div>
						<div class="small mb-3 text-muted">회원가입때 생성한 이메일과 아이디를 입력시면
							해당 이메일로 임시 비밀번호가 전송 됩니다.</div>
						<form>
							<div class="form-group">
								<label class="small mb-1" for="inputEmailAddress">Email : </label> 
								<input class="form-control py-4" id="searchEmail2" type="email" aria-describedby="emailHelp" placeholder="이메일 입력" /> 
								<label class="small mb-1" for="inputEmailAddress">아이디 : </label> 
								<input class="form-control py-4" id="searchId" type="text" aria-describedby="emailHelp" placeholder="아이디 입력" />
							</div>
							<div class="form-group d-flex align-items-center justify-content-between mt-4 mb-0">
								<button type="button" class="btn btn-default" id="pwfind">임시 비밀번호 전송</button>
							</div>
						</form>
					</div>
					<div class="card-footer text-center">
						
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


<!-- 회원가입 Modal -->
<div class="modal fade" id="sign-up" role="dialog">
	<div class="modal-dialog">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">
					<span style="color: #643691;">MU</span> 회원 가입
				</h4>
				<button type="button" class="close" data-dismiss="modal">×</button>

			</div>

			<div class="modal-body">

				<form action="<c:url value='/user/register'/>" name="signup" id="signUpForm" method="post"
					style="margin-bottom: 0;">
					<table
						style="cellpadding: 0; cellspacing: 0; margin: 0 auto; width: 100%">
						<tr>
							<td style="text-align: left">
								<p><strong>아이디를 입력해주세요.</strong>&nbsp;&nbsp;&nbsp;<span id="idChk"></span></p>
							</td>
								
							
						</tr>
						<tr>
							<td><input type="text" name="userId" id="user_id"
								class="form-control tooltipstered" maxlength="14"
								required="required" aria-required="true"
								style="margin-bottom: 25px; width: 100%; height: 40px; border: 1px solid #d9d9de"
								placeholder="숫자와 영어로 4-10자">
								</td>
							
						</tr>

						<tr>
							<td style="text-align: left">
								<p><strong>비밀번호를 입력해주세요.</strong>&nbsp;&nbsp;&nbsp;<span id="pwChk"></span></p>
							</td>
						</tr>
						<tr>
							<td><input type="password" size="14" maxlength="14" id="password"
								name="userPw" class="form-control tooltipstered" 
								required="required" aria-required="true"
								style="ime-mode: inactive; margin-bottom: 25px; height: 40px; border: 1px solid #d9d9de"
								placeholder="영문과, 특수문자를 포함한 최소 8자 최대 14자"></td>
						</tr>
						<tr>
							<td style="text-align: left">
								<p><strong>비밀번호를 재확인해주세요.</strong>&nbsp;&nbsp;&nbsp;<span id="pwChk2"></span></p>
							</td>
						</tr>
						<tr>
							<td><input type="password" size="14" maxlength="14" id="password_check"
								name="pw_check" class="form-control tooltipstered" 
								required="required" aria-required="true"
								style="ime-mode: inactive; margin-bottom: 25px; height: 40px; border: 1px solid #d9d9de"
								placeholder="비밀번호가 일치해야합니다."></td>
						</tr>

						<tr>
							<td style="text-align: left">
								<p><strong>이름을 입력해주세요.</strong>&nbsp;&nbsp;&nbsp;<span id="nameChk"></span></p>
							</td>
						</tr>
						<tr>
							<td><input type="text" name="userName" id="user_name"
								class="form-control tooltipstered" maxlength="6"
								required="required" aria-required="true"
								style="margin-bottom: 25px; width: 100%; height: 40px; border: 1px solid #d9d9de"
								placeholder="한글로 최대 6자"></td>
						</tr>
						
						<tr>
							<td style="text-align: left">
								<p><strong>이메일을 입력해주세요.</strong>&nbsp;&nbsp;&nbsp;<span id="emailChk"></span></p>
							</td>
						</tr>
						<tr>
							<td><input type="email" name="userEmail" id="user_email"
								class="form-control tooltipstered" 
								required="required" aria-required="true"
								style="margin-bottom: 25px; width: 100%; height: 40px; border: 1px solid #d9d9de"
								placeholder="ex) ManU@produce.com"></td>
						</tr>

						<tr>
							<td style="padding-top: 10px; text-align: center">
								<p><strong>회원가입하셔서 MU회원이 되어보세요~~!</strong></p>
							</td>
						</tr>
						<tr>
							<td style="width: 100%; text-align: center; colspan: 2;"><input
								type="button" value="회원가입" 
								class="btn form-control tooltipstered" id="signup-btn"
								style="background-color: #643691; margin-top: 0; height: 40px; color: white; border: 0px solid #388E3C; opacity: 0.8">
							</td>
						</tr>

					</table>
				</form>
			</div>
		</div>
	</div>
</div>

<script>

	//jqery 시작 
	$(function() {
		
		//정규 표현식 함수
		const getIdCheck= RegExp(/^[a-zA-Z0-9]{4,14}$/);
		const getPwCheck= RegExp(/([a-zA-Z0-9].*[!,@,$,%,&,*,^,#,?,_,~])|([!,@,$,%,&,*,^,#,?,_,~].*[a-zA-Z0-9])/);
		const getName= RegExp(/^[가-힣]+$/);
		const getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
		
		let chk1 = false, chk2 = false, chk3 = false, chk4 = false, chk5 = false;
		
		$("#user_id").on('keyup', function() {
			
			if($("#user_id").val() === ""){
				$("#user_id").css("background-color","pink");
				$("#idChk").html('<b style="font-size:14px; color:red;">[영문자, 숫자 4-14자로 작성]</b>');
				chk1 = false;
			}else if(!getIdCheck.test($("#user_id").val())){
				$("#user_id").css("background-color","pink");     //빈 공간일시 user_id인 태그에
				$("#idChk").html('<b style="font-size:14px; color:red;"> [영문자, 숫자 4-14자로 작성]</b>')
				chk1 = false;
			}
			//id중복 확인 비동기 처리
			else{
				//id중복 확인 통신을 위해서 id값을 가져오기.
				const id = $(this).val();
				console.log(id);
				
				//클라이언트에서 서버와 통신하는 ajax함수 (비동기 통신)
				//ajax의 시작
				$.ajax({
					
					type:"post",
					url:"/user/idCheck",
					data:id,
					dataType:"text",
					headers:{ "Content-Type" : "application/json" },
					success: function(result) {
						if(result==="OK"){
							$("#user_id").css("background-color", "aqua");
							$("#idChk").html('<b style="font-size:14px; color:green;">[아이디 사용이 가능합니다!]</b>');
							chk1 = true;
						}else{
							$("#user_id").css("background-color", "pink");
							$("#idChk").html('<b style="font-size:14px; color:red;">[아이디가 중복되었습니다!]</b>');
							chk1 = false;
						}
					},
					error: function() {
						console.log(id);
						console.log("통신 실패");
					}
					
				});//ajax의 끝
			}
			
		});// id 검증 끝
		
		//1차pw 검증
		$("#password").on('keyup', function() {
			
			if($("#password").val() === ""){
				$("#password").css("background-color","pink");    
				$("#pwChk").html('<b style="font-size:14px; color:red;"> [비밀번호는 필수 정보 입니다.]</b>');
				chk2 = false;
			}else if(!getPwCheck.test($("#password").val())){
				$("#password").css("background-color","pink");    
				$("#pwChk").html('<b style="font-size:14px; color:red;"> [영문자, 특수문자 8-14로 작성]</b>');
				chk2 = false;
			}else{
				$("#password").css("background-color","aqua"); 
				$("#pwChk").html('<b style="font-size:14px; color:blue;"> [조건 충족!]</b>');
				chk2 = true;
			}
		});//1차pw 검증
		
		//2차pw 검증
		$("#password_check").on('keyup', function() {
			
			if($("#password_check").val() != $("#password").val()){
				$("#password_check").css("background-color","pink");
				$("#pwChk2").html('<b style="font-size:14px; color:red;"> [비밀번호 정보가 다릅니다.]</b>');
				chk3 = false;
			}else{
				$("#password_check").css("background-color","aqua"); 
				$("#pwChk2").html('<b style="font-size:14px; color:blue;"> [체크 완료!]</b>');
				chk3 = true;
			}
			
		});//2차pw 끝
		
		//이름 한글 검증
		$("#user_name").on('keyup', function() {
			if($("#user_name").val() === ""){
				$("#user_name").css("background-color","pink");    
				$("#nameChk").html('<b style="font-size:14px; color:red;"> [이름입력은 필수 정보 입니다.]</b>');
				chk4 = false;
			}else if(!getName.test($("#user_name").val())){
				$("#user_name").css("background-color","pink");    
				$("#nameChk").html('<b style="font-size:14px; color:red;"> [이름에는 한글만 입력하십시오.]</b>');
				chk4 = false;
			}else{
				$("#user_name").css("background-color","aqua"); 
				$("#nameChk").html('<b style="font-size:14px; color:blue;"> [체크 완료!]</b>');
				chk4 = true;
			}
		}); //이름 검증 끝.
		
		
		//이메일 검증 시작
		$("#user_email").on('keyup', function() {
			if($("#user_email").val() === ""){
				$("#user_email").css("background-color","pink");
				$("#emailChk").html('<b style="font-size:14px; color:red;"> [이메일 입력은 필수 정보 입니다.]</b>');
			
				chk5 = false;
			}else if(!getMail.test($("#user_email").val())){
				$("#user_email").css("background-color","pink");
				$("#emailChk").html('<b style="font-size:14px; color:red;"> [이메일 입력 조건에 맞지 않습니다.]</b>');
			
				chk5 = false;
			}else{
				
				const userEmail = $(this).val();
			
				$.ajax({
					type:"post",
					url:"/user/emailCheck",
					data:userEmail,
					dataType:"text",
					headers:{ "Content-Type" : "application/json" },
					success: function(result) {
						if(result==="OK"){
							$("#user_email").css("background-color", "aqua");
							$("#emailChk").html('<b style="font-size:14px; color:green;">[이메일 사용이 가능합니다!]</b>');
							chk5 = true;
						}else{
							$("#user_email").css("background-color","pink");
							$("#emailChk").html('<b style="font-size:14px; color:red;">[해당 이메일을 사용할수 없습니다.]</b>');
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
		
		//회원가입 버튼
		$("#signup-btn").click(function() {
		if(chk1 && chk2 && chk3 && chk4 && chk5){	
			//아이디 정보
			const id = $('#user_id').val();
			//패스워드 정보
			const pw = $('#password').val();
			//이름 정보
			const name = $('#user_name').val();
			//이메일 정보
			const email = $("#user_email").val();
			
			const user = {
				account : id,
				password : pw,
				name : name,
				userEmail : email
			};
			
			//ajax 비동기 통신
			$.ajax({
				type:"post",
				url:"/user/register",
				headers:{
					"Content-type" : "application/json"
				},
				dataType:"text",
				data:JSON.stringify(user),
				success: function(result) {
					console.log("통신 성공!: " + result);
					if(result === "joinSuccess") {
						
						alert("회원 가입에 성공했습니다! 입력하신 이메일에서 이메일 인증을 하십시오");
						location.href="/";
					} else {
						alert("회원 가입에 실패했습니다.");
					}
				},
				error: function() {
					console.log("통신 실패!");
				}
			}); //ajax
			
		}else {  //회원가입 입력폼 조건 충족 안될시 요기로 온다잉!
			alert('입력 정보를 다시 확인하세요!');
		}	
	});//signup-btn 회원가입 이벤트 처리 끝.
		
		////////////////////////////////////////////////////////////// 회원가입 관련 끝
		
	//로그인 검증
	
	//ID 입력값 검증
	$('#signInId').on('keyup', function() {
		if($("#signInId").val() === "") {
			$("#signInId").css("background-color", "pink");
			$("#idCheck").html('<b style="font-size:14px; color:red;">[아이디는 필수 정보에요!]</b>');
			chk1 = false;
		}
		//아이디 유효성 검사
		else if(!getIdCheck.test($("#signInId").val())) {
			$("#signInId").css("background-color", "pink");
			$("#idCheck").html('<b style="font-size:14px; color:red;">[영문자, 숫자 4-14자로 작성!!]</b>');
			chk1 = false;
		} else {
			$("#signInId").css("background-color", "aqua");
			$("#idCheck").html('<b style="font-size:14px; color:green;">[id 입력 완료!]</b>');
			chk1 = true;
		}
		
	}); //ID 입력값 검증 끝.
	
	//패스워드 입력값 검증.
	$('#signInPw').on('keyup', function() {
		//비밀번호 공백 확인
		if($("#signInPw").val() === ""){
		    $('#signInPw').css("background-color", "pink");
			$('#pwCheck').html('<b style="font-size:14px;color:red;">[패스워드는 필수!]</b>');
			chk2 = false;
		}		         
		//비밀번호 유효성검사
		else if(!getPwCheck.test($("#signInPw").val()) || $("#signInPw").val().length < 8){
		    $('#signInPw').css("background-color", "pink");
			$('#pwCheck').html('<b style="font-size:14px;color:red;">[영문자, 특수문자 8-14로 작성]</b>');
			chk2 = false;
		} else {
			$('#signInPw').css("background-color", "aqua");
			$('#pwCheck').html('<b style="font-size:14px;color:green;">[참 잘했어요]</b>');
			chk2 = true;
		}	
	}); //패스워드 검증 끝.
		
	//로그인 버튼을 클릭 이벤트
	$("#signIn-btn").click(function() {
		
		if(chk1 && chk2){
			
			const id = $('#signInId').val();
			const pw = $('#signInPw').val();
			
			//자동 로그인 체크
			const autoLogin = $("#auto-login").is(":checked");
			
			const userInfo = {
					account : id,
					password : pw,
					autoLogin : autoLogin
			};
			
			$.ajax({
				type:"post",
				url:"/user/loginCheck",
				headers:{ "Content-Type" : "application/json" },
				dataType:"text",
				data: JSON.stringify(userInfo),
				success: function(data) {
					console.log("result: " + data);
					if(data === "idFail") {
						$('#signInId').css("background-color", "pink");
						$('#idCheck').html('<b style="font-size:14px; color:red;">[회원가입 먼저 하세요!]</b>');
						$('#signInPw').val("");
						$('#signInId').focus(); //커서를 이동시키고, 스크롤도 해당 위치로 이동시키는 메서드.
						chk2 = false;
					} else if(data === "pwFail") {
						$('#signInPw').css("background-color", "pink");
						$('#pwCheck').html('<b style="font-size:14px; color:red;">[비밀번호가 틀렸습니다!]</b>');
						$('#signInPw').val("");
						$('#signInPw').focus(); //커서를 이동시키고, 스크롤도 해당 위치로 이동시키는 메서드.
						chk2 = false;
					} else if(data === "EmailCheckPls"){
						alert("이메일 인증이 필요합니다. 입력하신 이메일에서 인증을 하십시오.");
						self.location = "/";
					} else if(data === "loginSuccess") {
						self.location = "/";
					}
					
				},
				error: function() {
					alert("아이디 또는 비밀번호가 올바르지 않습니다.");
				}
			});//ajax 끝
			
		}else{
			alert("입력 정보를 다시 확인하세요!");
		}
	}); // 로그인 버튼 클릭 이벤트 끝.
		
		
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	
	
	
	//id 찾기
	$("#idfind").click(function() {
		const name = $("#searchName").val();
		const userEmail = $("#searchEmail").val();
		
		const userInfo = {
			name:name,
			userEmail:userEmail
		};
		
		$.ajax({
			type:"post",
			url:"/user/idfind",
			headers:{ "Content-Type" : "application/json" },
			dataType:"text",
			data: JSON.stringify(userInfo),
			success: function(result) {
				if(result == "same"){
					alert("이메일로 아이디를 전송했습니다.");
				}else if(result == "differnt"){
					alert("입력하신 내용이 일치하지 않습니다.");
				}
				$("#searchName").val("");
				$("#searchEmail").val("");
			},
			error: function() {
				alert("일치하는 정보가 없습니다.");
				$("#searchName").val("");
				$("#searchEmail").val("");
			}
		});
	});
	
	//pw찾기 
	$("#pwfind").click(function() {
		
		const account = $("#searchId").val();
		const userEmail = $("#searchEmail2").val();
		
		const userInfo = {
				account:account,
				userEmail:userEmail
			};
		
		$.ajax({
			type:"post",
			url:"/user/pwfind",
			headers:{ "Content-Type" : "application/json" },
			dataType:"text",
			data: JSON.stringify(userInfo),
			success: function(result) {
				if(result == "same"){
					alert("이메일로 임시 비밀번호를 전송했습니다.");
				}else if(result == "differnt"){
					alert("입력하신 내용이 일치하지 않습니다.");
				}
				$("#searchId").val("");
				$("#searchEmail2").val("");
			},
			error: function() {
				alert("일치하는 정보가 없습니다.");
				$("#searchId").val("");
				$("#searchEmail2").val("");
			}
		});
	});
	
	
});//jqery 끝

</script>









