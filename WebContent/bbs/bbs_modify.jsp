<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/include/header.jsp" %>
    
     <section>
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-md-10 col-sm-12 join-form">
                    <h2>게시판 수정<small>(디자인이궁금하세요?)</small></h2>

                    <form action="req_modify.bbs" method="post" name="content_form">
                        <div class="form-group">
                            <label>글번호</label>
                            <input type="text" class="form-control" name="bno" value="${param.bno}" readonly>
                        </div>
                        <div class="form-group">
                            <label>글쓴이</label>
                            <input type="text" class="form-control" name="writer" value="${param.writer}" placeholder="자유" readonly>
                        </div>
                        <div class="form-group">
                            <label>제목</label>&nbsp;<span id="checkTitle"></span>
                            <input type="text" class="form-control" name="title" value="${param.title}"  placeholder="자유">
                        </div>
                        <div class="form-group">
                            <label>내용</label>&nbsp;<span id="checkContent"></span>
                            <textarea class="form-control" name="content" rows="5" style="resize: none;">${param.content}</textarea>
                        </div>

                        <!--구현로직: 버튼은 온클릭을 사용하던 자바스크립트를 이용해야 합니다-->
                        <div class="form-group">
                            <button type="button" class="btn btn-success" onclick="location.href='list.bbs'">목록</button>
                            <button type="button" class="btn btn-info" onclick="checkclick();">수정</button>
                            <button type="button" class="btn btn-default" onclick="location.href='delete.bbs?bno=${param.bno}'">삭제</button>
                        </div>

                    </form>
                </div>
            </div>
        </div>
        </section>
        
<script type="text/javascript">
	function checkclick(){
		
		var flag = true;
		
		if(document.content_form.title.value == ''){
			document.getElementById('checkTitle').innerHTML='(제목은 필수입력입니다.)';
			document.getElementById('checkTitle').style.color='red';
			flag = false;
		}
		if(document.content_form.content.value.length > 1000){
			document.getElementById('checkContent').innerHTML='(최대가능한 글자수는 1000자입니다.)';
			document.getElementById('checkContent').style.color='red';
			flag = false;
		}
		
		if(flag){
			document.content_form.submit();
		}
		
	}

</script>
<%@ include file="/include/footer.jsp" %>


