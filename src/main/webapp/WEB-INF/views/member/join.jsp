<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ include file="../includes/header.jsp"%>
<div class="row">
  <div class="col-lg-12">
	<h1 class="page-header">회원 가입</h1>
  </div><!-- /.col-lg-12 -->
</div><!-- /.row -->
<div class="row">
  <div class="col-lg-12">
	<div class="panel panel-default">
	  <div class="panel-heading">회원 가입</div><!-- /.panel-heading -->
	  <div class="panel-body">
		<form role="form" action="/member/join" method="post">
		  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		  <div class="form-group">
		    <label>아이디</label><br>
		    <input style="width: 79%" placeholder="userid" id="userid" name="userid" type="text" autofocus>
		    <button style="width: 20%" type="button" class="btn btn-default">중복확인</button>
		  </div>
		  <div class="form-group">
		  <label>암 &nbsp; 호</label>
		    <input class="form-control" placeholder="Password" name="userpw" type="password">
		  </div>
		  <div class="form-group">
		    <label>이 &nbsp; 름</label>
		    <input class="form-control" placeholder="홍길동" name="username" type="text">
		  </div>
		  <button type="submit" class="btn btn-default">Join</button>
		  <button type="reset" class="btn btn-default">Reset</button>
		</form>
	  </div><!-- end panel-body -->
	</div><!-- end panel-body -->
  </div><!-- end panel -->
</div><!-- /.row -->
<script>
$(document).ready(function(e){
	var flag = false;	// 아이디 중복체크 성공여부
	
  var formObj = $("form[role='form']");
  var csrfHeaderName ="${_csrf.headerName}"; 
  var csrfTokenValue ="${_csrf.token}";
  //Ajax spring security header...
  // 공통으로 등록을 해 놓으면 Ajax 전송이 이루어질 때, CSRF 정보가 포함이 되어 전송된다.
  $(document).ajaxSend(function(e, xhr, options) { 
      xhr.setRequestHeader(csrfHeaderName, csrfTokenValue); 
  }); 
  
  $("button[type='submit']").on("click", function(e){
    e.preventDefault();
    if(flag == false) {
    	alert("아이디 중복 확인을 해 주세요.")
    } else {
    	console.log("submit clicked");
        formObj.submit();
    }
  });
  $("button[type='button']").on("click", function(e){    
	e.preventDefault();
	console.log("idCheck clicked");
	var userid = $("#userid").val();
	var data = { userid: userid };
	$.ajax({
		type: 'post',
		url: '/member/idCheck',
		data: data,
		success: function(result, status, xhr) {
			console.log(result);
			if(result == "using") {
				alert("사용중인 아이디 입니다.");
				flag = false;
			} else {
				alert("사용 가능한 아이디 입니다.");
				flag = true;
			}
		},
		error: function(xhr, status, er) {
			console.log(er);
		}
	});
  });
});
</script>
<%@ include file="../includes/footer.jsp" %>