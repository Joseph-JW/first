<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>



<title>게시판</title>

<link rel="stylesheet" href="../resources/board/register.css">

<script>
$(document).ready(function() {
	function cancelForm() {
		location.href = "/board/list";
	}

	$("#registerForm").submit(function(e) {
		e.preventDefault();
		cancelForm();
	});

	$(".register_submit_button[type='button']").click(function() {
		cancelForm();
	});
	
	let regex = RegExp("(.*)\.(exe|zip|alz)$");
	let maxSize = 5*1024*1024;
	function checkExtension(filename, fileSize) {
		if(fileSize >= maxSize) {
			alert("파일 사이즈 초과");
			return false;
		}
		if(regex.test(filename)) {
			alert("해당 종류의 파일은 업로드할 수 없습니다.");
			return false;
		}
		return true;
	}
	
	$("#uploadFile").on("change", function(e) {
		let formData = new FormData();
		let inputFile = $("#uploadFile");
		let files = inputFile[0].files;
		for(let i=0; i<files.length; i++) {
			if(!checkExtension(files[i].name, files[i].size)) {
				return false;
			}
			formData.append("uploadFile", files[i]);
		}
		$.ajax({
			type : 'post',
			url : '/uploadFileAjax',
			processData : false,
			contentType : false,
			data : formData,
			success : function(result) {
				console.log(result);
				showUploadResult(result);
			}
		});
	});
	
	function showUploadResult(result){}
});
</script>

<div id="contents">
	<div id="reg_1">
		<span class="font-underline">공지사항</span>
	</div>
	<div id="reg_2">
	
	</div>
	<div id="reg_3">         
		<div class="wrapper_register">
			<div class="register_head">
				<h3>게시글 작성</h3>
			</div>
			<div class="register_line"></div>
			<div class="register_body">
				<form class="register_form" method="post" action="/board/register">
					<div class="register_title">
						<input class="title_area1" maxlength="50" placeholder="제목" name="title" required="required" />
						<label>작성자 </label><input class="title_area2" maxlength="50" readonly="readonly" name="writer" value="${auth.userid }" />
					</div>
					<div class="register_written">
						<textarea class="written_area" placeholder="내용" name="content" required="required" ></textarea>
					</div>
					<div class="register_submit">
						<button class="register_submit_button" type="submit">작성</button>
						<button class="register_submit_button" type="button" onClick="cancelForm()">취소</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<div class="article-bottom">
		<div class="field1 get-th field-style">
			<label><b>첨부파일</b></label>
		</div>
		<div class="field2 get-td">
			<input type="file" name="uploadFile" id="uploadFile" class="file-input" multiple/>
		</div>
		<div class="uploadResult">
			<ul></ul>
		</div>
	</div>
</div>

<%@ include file="../include/footer.jsp" %>