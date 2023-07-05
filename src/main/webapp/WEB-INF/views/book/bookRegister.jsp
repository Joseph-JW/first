<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>


<title>도서등록</title>

<link rel="stylesheet" href="../resources/book/bookRegister.css">


 
<script type="text/javascript">


$(document).ready(function() {
	
	function cancelForm() {
		location.href = "/book/list";
	}
	/*
	$(".register_form").submit(function(e) {
		e.preventDefault();
	});

	$(".register_submit_button[type='button']").click(function() {
		cancelForm();
	});
	  */
	/* 
	document.getElementById("publication").addEventListener("change", function() {
        var publicationInput = document.getElementById("publication");
        var publicationDate = new Date(publicationInput.value);
        var formattedDate = publicationDate.toISOString().split("T")[0];
        document.getElementById("publicationdate").value = formattedDate;
    });
	 */


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
	
	function showUploadResult(result){
		if(!result || result.length == 0) { return;}
		let uploadUL = $(".uploadResult ul");
		let str = "";
		$(result).each(function (i, obj) {
			if(obj.image) {
				let fileCallPath = encodeURIComponent(obj.uploadpath + "\\s_" + obj.uuid + "_" + obj.filename);
				str +="<li data-path='" + obj.uploadpath + "'";
				str +="		data-uuid='" + obj.uuid + "' data-filename='" + obj.filename + "' data-type='" + obj.image + "'>";
				str +="		<div>";
				str +="			<span> " + obj.filename + "</span>";
				str +="			<button type='button' data-file=\'" + fileCallPath + "\' ";
				str +="				data-type='image' class='btn btn-warning btn-circle'><i class='fa fa-times'>x</i></button><br>";
				str +="			<img src='/display?filename=" + fileCallPath +"'>";
				str +="		</div>";
				str +="</li>";
			} else {
				let fileCallPath = encodeURIComponent(obj.uploadpath + "\\" + obj.uuid + "_" + obj.filename);
				str +="<li data-path='" + obj.uploadpath + "'";
				str +="		data-uuid='" + obj.uuid + "' data-filename='" + obj.filename + "' data-type='" + obj.image + "'>";
				str +="		<div>";
				str +="			<span> " + obj.filename + "</span>";
				str +="			<button type='button' data-file=\'" + fileCallPath + "\' ";
				str +="				data-type='file' class='btn btn-warning btn-circle'><i class='fa fa-times'>x</i></button><br>";
				str +="			<img src='/resources/images/attach.png'>";
				str +="		</div>";
				str +="</li>";
			}
		});
		uploadUL.append(str);
	}
	
	$(".uploadResult").on("click", "li button", function(e) {
		console.log("delete file");
		let targetFile = $(this).data("file");
		let type = $(this).data("type");
		let targetLi = $(this).parent().closest("li");
		let attach = {
				filename : targetFile,
				type : type
		};
		$.ajax({
			type : 'delete',
			url : '/deleteFile',
			data : JSON.stringify(attach),
			contentType : "application/json; charset=utf-8",
			success : function(result) {
				alert(result);
				targetLi.remove();
			}
		})
	});
	
	$("button[type='submit']").on("click", function(e) {
		e.preventDefault();
		let formObj = $(".register_form");
		let str = "";
		$(".uploadResult ul li").each(function(i, listItem) {
			let liObj = $(listItem);
			console.log("-------------------------------------");
			console.log(liObj.data("filename"));
			str += "<input type='hidden' name='attachList[" + i + "].filename' value='" + liObj.data("filename") + "'>";
			str += "<input type='hidden' name='attachList[" + i + "].uuid' value='" + liObj.data("uuid") + "'>";
			str += "<input type='hidden' name='attachList[" + i + "].uploadpath' value='" + liObj.data("path") + "'>";
			str += "<input type='hidden' name='attachList[" + i + "].filetype' value='" + liObj.data("type") + "'>";
		});
		console.log(str);
		formObj.append(str).submit();
	})
	
});	/* close */



</script>

<div id="contents">
	<div id="book_regi_1">
	    <span class="font-underline">도서 등록</span>
	</div>
	<div id="book_regi_2">
	
	</div>
	<div id="book_regi_3">
		<div class="wrapper_register">
			<div class="register_title">
				 <h2>도서 등록</h2>
            </div>
            <div class="regi_line"></div>
			<form class="register_form" method="post" action="/book/register">
				<input type='hidden' name='pageNum' value='<c:out value="${criteria.pageNum}" />'>
				<input type='hidden' name='amount' value='<c:out value="${criteria.amount}" />'>

	            <div id="bookImg">
	                <div class="bookImg_top">
	                	<div class="uploadResult">
							<ul></ul>
						</div>
	                </div>
	                <div class="bookImg_bottom">
	                	
						<div class="field1 get-th field-style">
							<label><b>첨부이미지</b></label>
						</div>
						<div class="field2 get-td">
							<input type="file" name="uploadFile" id="uploadFile" class="file-input" multiple/>
						</div>
					</div>
	            </div>
	            <div class="book_infom">
	                <ul>
	                    <li>[도서]
	                      <input class="title_area1" maxlength="50" placeholder="도서명" name="booktitle" required="required" />
	                    </li>
	                    <li>저자
	                        <input class="title_area1" maxlength="50" placeholder="저자" name="bookwriter" required="required" />
	                    </li>
	                    <li>출판사
	                        <input class="title_area1" maxlength="50" placeholder="출판사" name="publication" required="required" />
	                    </li>
	                    <li>출판일
	                        <input type="date" class="title_area1" id="publication" name="publicationdate" required="required">
	                    	<!-- <input type="hidden"  id="publicationdate"/> -->
	                    </li>
	                    <li>장르
	                    	<select class="title_area1" id="genre" name="genre" required="required">
								<option value="novel">소설</option>
								<option value="non-fiction">비픽션</option>
								<option value="thriller">스릴러</option>
								<option value="science-fiction">공상 과학</option>
								<option value="history">역사</option>
								<option value="self-help">자기계발</option>
								<option value="romance">로맨스</option>
								<option value="fantasy">판타지</option>
								<option value="mystery">추리</option>
								<option value="poetry">시</option>
							</select>
	                    </li>
	                    <li>소장도서관
	                        <select name="possession" id="possession" class="title_area1" required="required">
	                            <option value="">선택하세요</option>
	                            <option value="동부도서관">동부도서관</option>
	                            <option value="서부도서관">서부도서관</option>
	                            <option value="남부도서관">남부도서관</option>
	                            <option value="북부도서관">북부도서관</option>
	                            <option value="중부도서관">중부도서관</option>
	                        </select>
	                    </li>
	
	                    <li>대출가능여부
	                        <input type="radio" name="available" class="available" value="0">
	                            <label for="available">불가능</label> 
	                        <input type="radio" name="available" class="available" value="1"> 
	                            <label for="available">가능</label> 
	                    </li>
	                </ul>
	            </div>
	            <div class="register_submit">
	                <button class="register_submit_button" type="submit">작성</button>
	                <button class="register_submit_button" type="button" onclick="cancelForm()">취소</button>
	            </div>
				
			</form>
			
		</div>
	</div>


	<div id="book_regi_4">
		
	</div>
</div>
<%@ include file="../include/footer.jsp" %>