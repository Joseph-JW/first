<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>


<title>게시글 확인</title>

<link rel="stylesheet" href="../resources/board/get.css">
<script src="../resources/js/replyService.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"> -->

 
<script type="text/javascript">
$(function() {
	const operForm = $("#operForm");
	$("#list_btn").on("click", function(e) {
		operForm.find("#bno").remove();
		operForm.attr("action","/board/list");
		operForm.submit();
	});
	$("#modify_btn").on("click", function(e) {
		operForm.attr("action","/board/modify").submit();
	});
	
	$("#addReplyBtn").on("click", function() {
		$("#reply").val("");
		$("#modalModBtn").hide();
		$("#modalRegisterBtn").show();
		$("#modalCloseBtn").show();
		$(".modal").modal("show");
	});

// modal
	$("#modalCloseBtn").on("click", function() {
		$(".modal").modal("hide");
	});
		
		var isLoggedIn = ${not empty auth};
		
		$("#modalRegisterBtn").on("click", function() {
			if (isLoggedIn) {
		    let reply = {
		   		reply: $("#reply").val(),
		     	replyer: $("#replyer").val(),
		      	bno: '<c:out value="${board.bno}" />'
		    };
		    ReplyService.add(
		      	reply,
		      	function(result) {
		        	alert(result);
		        	$(".modal").modal("hide");
		        	//getReplyList();
		        	getReplyListWithPaging(pageNum);
		      	},
		      	function(error) {
		        	alert(error);
		      	}
		    );
		  	} else {
			    alert('로그인 후 가능합니다.');
		  	}
	});
	
	getReplyList()
	function getReplyList() {
		ReplyService.getList({
			bno : '<c:out value="${board.bno}" />'},
			function(list) {
				console.log("list " + list);
				showReplyList(list);
			},
			function(error) {
				alert(error);
		})	
	}
	
	// reply list with paging
	let pageNum = 1;
	let replyPageFooter = $(".panel-footer");
	
	getReplyListWithPaging(pageNum);
	function getReplyListWithPaging(pageNum) {
		ReplyService.getReplyListWithPaging({
			bno : '<c:out value="${board.bno}" />',
			page : pageNum},
			function(replyCnt, list) {
				console.log("list with P : " + list);
				showReplyList(list);
				showReplyPaging(replyCnt);
			},
			function (error) {
				alert(error);
			}
		)
	};
	
	function showReplyPaging(replyCnt) {
		let endNum = Math.ceil(pageNum / 10.0) * 10;
		let startNum = endNum - 9;
		let prev = startNum != 1;
		let next = false;
		let str = "";
		if (endNum * 10 >= replyCnt) {
			endNum = Math.ceil(replyCnt / 10.0);
		}
		if (endNum * 10 < replyCnt) {
			next = true;
		}
		
		str += "<ul class='pagination'>";
		if (prev) {
			str += "<li class='paginate_button'><a href='" + (startNum-1) + "'>Previous</a></li>";
		}
		for (let i=startNum; i<=endNum; i++) {
			let active = pageNum == i? "active_list" : "";
			str += "<li class='paginate_button " + active + " '><a href='" + i + "'>" + i + "</a></li>";	
		}
		if (next) {
			str += "<li class='paginate_button'><a href='" + (startNum+1) + "'>Next</a></li>";
		}
		str += "</ul></div>";
		console.log(str);
		replyPageFooter.html(str);
	}
	
	//paging
	replyPageFooter.on("click","li a", function(e) {
		e.preventDefault();
		console.log("page click");
		let targetPageNum = $(this).attr("href");
		console.log("targetPageNum : " + targetPageNum);
		pageNum = targetPageNum;
		getReplyListWithPaging(pageNum);
	});
	
	
	function showReplyList(list) {
		let str = "";
		let replyUL = $(".reply");
		if(list == null || list.length == 0) {
			replyUL.html(str);
			return;
		}
		
		for(var i=0, len=list.length || 0; i<len; i++) {
			str += "<li>";
			str += "	<div>";
			str += "		<div class='header'><strong class='primary-font'>" + list[i].replyer + "</strong>";
			str += "			<small class='pull-right text-muted'>" + ReplyService.displayTime(list[i].regdate) + "</small>";
			str += "		</div>";
			str += "		<div data-rno='" + list[i].rno + "'data-replyer='" + list[i].replyer + "'>";
			str += "			<strong id='modify' class='primary-font'>" + list[i].reply + "</strong>";
			if("${auth.userid}" === list[i].replyer) {
				str += "		<button id='remove' type='button' class='close' data-rno='" + list[i].rno + "'>";
				str += "			<span>x</span></button>";
			}
			str += "		</div>";
			str += "	</div>";
			str += "</li>";
		}
		replyUL.html(str);
	}

	$(".reply").on("click", "li #modify", function(e) {
		let replyer = $(this).parent().closest('div').data("replyer");
		let rno = $(this).parent().closest('div').data("rno");
		let auth = "${auth.userid}";
		if (auth !== replyer) {
			return;
		}
		
		ReplyService.get(rno, function(reply) {
			$("#reply").val(reply.reply);
			$("#replyer").val(reply.replyer);
			$(".modal").data("rno", reply.rno);
			$("#modalModBtn").show();
			$("#modalRegisterBtn").hide();
			$(".modal").modal("show");
		});
	});
	
	$("#modalModBtn").on("click", function(e) {
		let reply = {
				reply : $("#reply").val(),
				rno : $(".modal").data("rno")
		};
		ReplyService.update(
			reply,
			function(result) {
				alert(result);
				$(".modal").modal("hide");
				//getReplyList();
				getReplyListWithPaging(pageNum);
			},
			function (error) {
				alert(error);
			}
		);
	});
	
	$(".reply").on("click", "li #remove", function(e) {
		let replyer = $(this).parent().closest('div').data("replyer");
		let rno = $(this).parent().closest('div').data("rno");
		let auth = "${auth.userid}";
		if (auth !== replyer) {
			return;
		}
		
		alert('remove ' + rno);
		ReplyService.remove(
				rno,
				function(result) {
					alert(result);
					//getReplyList();
					getReplyListWithPaging(pageNum);
				},
				function(error) {
					alert(error)
		});	
	});
	
});	//close


</script>

<div id="contents">
	<div id="note_1">
	    <span class="font-underline">공지사항</span>
	</div>
	<div id="note_2">
	
	</div>
	<div id="note_3">
		<table class="info_table">
			<thead>
				<tr class="info_title">
		    		<th align="left" style="padding-left: 30px" colspan="4">
		   			<c:out value="${board.title }" />
					</th>
				</tr>
			    <tr class="info_list">
					<th>작성자</th>
					<td align="center"><c:out value="${board.writer }" /></td>
					<th align="right" style="padding-left: 100px">작성일</th>
					<td style="padding-right:30px">
				        <c:choose>
							<c:when test="${board.regdate} == ${board.updatedate}">
								<fmt:formatDate pattern="YY-MM-dd hh:mm" value="${board.regdate }"/>
							</c:when>
							<c:otherwise>
								<fmt:formatDate pattern="YY-MM-dd hh:mm" value="${board.updatedate }"/>
							</c:otherwise>
						</c:choose>
					</td>
				</tr>
			</thead>
			<tbody>
				<tr class="info_contents">
		      		<td colspan="4">
		      		<div style="padding: 0 30px;">
						<c:out value="${board.content}" />
					</div>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	<div class="read_bottom">
		<button class="read_button" id="list_btn">목록</button>
		<c:if test="${auth.userid eq board.writer}">
			<button class="read_button" id='modify_btn'>글수정</button>
		</c:if>
		<c:if test="${not empty auth}">
				<button id="addReplyBtn" class="btn btn-primary btn-xs pull-right">댓글</button>
		</c:if>
		<form id='operForm' action="/board/modify" method="get">
			<input type='hidden' id='bno' name='bno' value='<c:out value="${board.bno}"/>'>
			<input type='hidden' name='pageNum' value='<c:out value="${criteria.pageNum}"/>'>
			<input type='hidden' name='amount' value='<c:out value="${criteria.amount}"/>'>
		</form>
	</div>
	<div id="note_4">
		<div id="reply_box">
		<div id="reply_title">
			<h2>댓글 목록</h2>
		</div>
		<div class="reply_list">
			<ul class="reply"></ul>
			<div class="panel-footer"></div>
		</div>
		
		<!-- Modal -->
		<div class="modal fade" tabindex="-1" role="dialog" style="display: none;">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title">댓글 달기</h4>
						<button type="button" class="close" data-dismiss="modal" aria-label="close">
							<span aria-hidden="true">&times;</span>					
						</button>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label>아이디</label>
							<input class="form-control" id="replyer" name="replyer" value="${auth.userid}" readonly="readonly">					
						</div>
						<div class="form-group">
							<label>내  용</label>
							<input class="form-control" id="reply" name="reply">
						</div>
					</div>
					<div class="modal-footer">
						<button id="modalModBtn" type="button" class="btn btn-warning">댓글 수정</button>
						<button id="modalRegisterBtn" type="button" class="btn btn-primary">댓글 추가</button>
						<button id="modalCloseBtn" type="button" class="btn btn-info">취소</button>
					</div>
				</div>
			</div>
		</div>
		</div>
	<!-- /Modal -->	
	</div>
</div>
<%@ include file="../include/footer.jsp" %>