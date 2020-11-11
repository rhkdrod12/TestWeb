<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<%@ include file="/include/header.jsp" %>
 
 
<!--게시판만 적용되는 css-->            
<style>

    .table-striped > tbody > tr {
        background-color: rgba(255, 255, 255)
    }
    .row h2 {
        color: aliceblue;
        
    }
    .pagination-sm {
        margin: 0;
    }
    
</style>   
   
    <section>
        
        <div class="container">
            <div class="row">
                
                <h2>게시판 목록</h2>
                
                <select onchange="location.href='list.bbs?page=${pageVo.page}&contentAmount=' + this.value">
					<option value="10"  ${pageVo.contentAmount eq 10?'selected':'' }>10개씩 보기</option>
					<option value="20"  ${pageVo.contentAmount eq 20?'selected':'' }>20개씩 보기</option>
					<option value="50"  ${pageVo.contentAmount eq 50?'selected':'' }>50개씩 보기</option>
					<option value="100" ${pageVo.contentAmount eq 100?'selected':'' }>100개씩 보기</option>
				</select>
				
                <table class="table table-striped" style="text-align: center; border: 2px solid #737373">
                    <thead>
                        <tr>
                            <th style="background-color: #9DCAFF; text-align: center;">번호</th>
                            <th style="background-color: #9DCAFF; text-align: center;">제목</th>
                            <th style="background-color: #9DCAFF; text-align: center;">작성자</th>
                            <th style="background-color: #9DCAFF; text-align: center;">작성일</th>
                        </tr>
                    </thead>
                    
                    <tbody>
                    	<c:choose>
                    		<c:when test="${boardList.size() > 0}">
                    			<c:forEach var="item" items="${boardList}">
		                    	<tr>
		                    		<td>${item.bno}</td>
		                            <td><a href="/TestWeb/bbs/content.bbs?bno=${item.bno}">${item.title}</a></td>
		                            <td>${item.writer}</td>
		                            <td><fmt:formatDate value="${item.regdate}" pattern="yyyy-MM-dd hh:mm"/></td>
		                        </tr>
                    			</c:forEach>
                    		</c:when>
                    		<c:otherwise>
                    			<tr>
                    				<td colspan="4">-공 백-</td>
                    			</tr>
                    		</c:otherwise>
                    	</c:choose>                    	
                    </tbody>
                </table>

                <div class="text-center">
                    <ul class="pagination pagination-sm">
                        <c:if test="${pageVo.prev}"><li><a href="list.bbs?page=${pageVo.start-1}&contentAmount=${pageVo.contentAmount}">이전</a></li></c:if>
                        <c:forEach var="pageNum" begin="${pageVo.start}" end="${pageVo.end}">
                        	<li class="${pageNum eq pageVo.page?'active':''}"><a href="list.bbs?page=${pageNum}&contentAmount=${pageVo.contentAmount}">${pageNum}</a></li>
                        </c:forEach>
                        <c:if test="${pageVo.next}"><li><a href="list.bbs?page=${pageVo.end+1}&contentAmount=${pageVo.contentAmount}">다음</a></li></c:if>
                    </ul>
                    <button class="btn btn-info pull-right" onclick="location.href='write.bbs'">글쓰기</button>
                </div>
                
            </div>
        </div>
    </section>
        
 <%@ include file="/include/footer.jsp" %>


