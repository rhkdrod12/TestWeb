<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ include file="/include/header.jsp" %>
    <!--글쓰기만 적용되는 css-->   
    <style>
        .table-striped {
            text-align: center; 
            border: 2px solid #737373; 
        }

        .table-striped>tbody>tr {
            background-color: #f9f9f9
        }
    </style>

    <section>
        <div class="container" style="margin-top: 5%;">
            <div class="row">
                <form action="req_write.bbs" method="post" name="content_form">
                    <table class="table table-striped" >
                        <thead>
                            <tr>
                                <th colspan="2" style="background-color: #9DCAFF; text-align: center;">게시판 글쓰기</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td><input type="text" class="form-control" placeholder="작성자" name="writer" value="${user.id}" readonly maxlength="50"></td>
                            </tr>
                            <tr>
                                <td align="left"><span id ="checkTitle"></span><input type="text" class="form-control" placeholder="글 제목" name="title" maxlength="50"></td>
                            </tr>
                            <tr>
                                <td align="left"><span id ="checkContent"></span><textarea rows="15" class="form-control" placeholder="1000 글자 이하" name="content" maxlength="1000" ></textarea></td>
                            </tr>
                        </tbody>
                    </table>
                    
                    <input type="button" class="btn btn-primary pull-left" value="목록" onclick="location.href='list.bbs'">
                    <input type="button" class="btn btn-primary pull-right" value="글쓰기" onclick="checkclick();">
                </form>
            </div>
        </div>
    </section>
    
<script type="text/javascript">
	function checkclick(){
		
		var flag = false;
		
		if(document.content_form.title.value == ''){
			document.getElementById('checkTitle').innerHTML='(제목은 필수입력입니다.)';
			document.getElementById('checkTitle').style.color='red';
			flag = false;
		}else{
			document.getElementById('checkTitle').innerHTML='';
			flag = true;
		}
		if(document.content_form.content.value.length > 1000){
			document.getElementById('checkContent').innerHTML='(최대가능한 글자수는 1000자입니다.)';
			document.getElementById('checkContent').style.color='red';
			flag = false;
		}else{
			document.getElementById('checkContent').innerHTML='';
		}
		if(flag){
			document.content_form.submit();
		}
		
	}

</script>

<%@ include file="/include/footer.jsp" %>