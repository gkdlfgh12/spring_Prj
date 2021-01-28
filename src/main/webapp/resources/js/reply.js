/**
 *  게시판 댓글 처리를 위한 객체 선언
 */

//댓글 js 모듈이 시작되고 있다.

var replyService = (
	function(){
		
		//댓글 작성 함수
		function add(reply, callback){
			//alert("댓글 쓰기 처리 진행 ....."+reply);	
			$.ajax({
				type : 'post',  
				url : '/ajax/replyWrite.do', 
				data : reply,  
				contentType : "application/json; charset=utf-8",
				error : function(xhr, status, er){  
					alert(status)
					alert(er);
				},
				success : function(result, status, xhr){ 
					if(callback){ //내용이 있으면 true
						callback()
					}
					//alert(result);
					//alert(status);
				}
			});
		}
		
		//댓글 수정 함수
		function update(reply, callback){
			$.ajax({
				type : 'patch',  
				url : '/ajax/replyUpdate.do', 
				data : reply, 
				contentType : "application/json; charset=utf-8", 
				error : function(xhr, status, er){ 
					//alert(status)
					//alert(er);
					console.log("실패");
				},
				success : function(result, status, xhr){ 
					if(callback){ 
						callback()
					}
					//alert(result);
					//alert(status);
				}
			});
		}
		
		
		//댓글 삭제 함수
		function replyDel(reply, callback){
			//alert("댓글 삭제 처리 진행 ....." + reply);	
			//server에 데이터를 넘겨서 처리 - 브라우저의 url은 바꾸지 않는다.
			$.ajax({
				type : 'delete',  
				url : '/ajax/replyDelete.do', //서버로 보내기 위한 url
				data: reply,
				contentType : "application/json; charset=utf-8",
				error : function(){  //실패시 호출될 함수
					console.log("오류");
				},
				success : function(){ //성공시 호출될 함수
				
					if(callback){ //내용이 있으면 true
						callback()
					}
					
				}
			});
		}
		
		
		//댓글 읽어오기
		function list(pageInfo, callback){
			//alert("댓글 리스트 처리 ....."+JSON.stringify(pageInfo));	
			//server에 데이터를 넘겨서 처리 - 브라우저의 url은 바꾸지 않는다. - 이것이 AJAX이다.
			$.ajax({
				type : 'get',  
				url : '/ajax/replyList.do', //서버로 보내기 위한 url
				data : pageInfo,  //서버로 보내지는 데이터
				contentType : "application/json; charset=utf-8", //서버로 보내지는 데이터의 형식- 헤더 셋팅
				dataType : "json",//받는 데이터 형식도 지정해야함  -json
				error : function(xhr, status, er){  //실패시 호출될 함수
					//alert(status)
					alert("실패?");
				},
				success : function(result, status, xhr){ //성공시 호출될 함수
				//ReplyController의 리턴값 첫번 째는 result로 반환
				//ReplyController의 리턴값 두번 째는 status로 반환
					if(callback){ //내용이 있으면 true
						callback(result)  //이걸로 list를 뿌린다.
					}
					//alert("성공?");
					//alert(result);
					//alert(status);
				}
			});
		}
		
		return {
			list:list,  //앞이 키, 뒤가 값 또는 메서드를 담을수 있다.
			add:add,
			update:update,
			replyDel:replyDel
			}
	}
)();

