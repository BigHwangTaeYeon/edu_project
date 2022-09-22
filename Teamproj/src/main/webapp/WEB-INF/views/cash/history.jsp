<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function del(f) {
		location.href='delete.do?idx='+f.idx.value;
	}
</script>
</head>
<body>
	<c:forEach var="vo" items="${ m_list }">
	<fmt:parseDate var="dateFmt" value="${vo.day}" pattern="yyyy-MM"/>
	<fmt:formatDate var="date" pattern="MM" value="${dateFmt}" />
		<c:forEach var="month" begin="1" end="12">
			<c:if test="${date == month}">
				<c:if test="${vo.income != null}">
			        <form>
				        <ul>
					       	<li>
						    	수입  내역 : ${vo.content} 금액 : ${vo.income} 날짜 : ${vo.day} 입니다.
						    	<input type="hidden" name="idx" value="${vo.idx}">
								<input type="button" value="삭제" onclick="del(this.form);">
						    </li>
					    </ul>
					</form>
				</c:if>
			</c:if>
		</c:forEach>
	</c:forEach>
	
	<hr>
	
	<c:forEach var="vo" items="${ m_list }">
	<fmt:parseDate var="dateFmt" value="${vo.day}" pattern="yyyy-MM"/>
	<fmt:formatDate var="date" pattern="MM" value="${dateFmt}" />
		<c:forEach var="month" begin="1" end="12">
			<c:if test="${date == month}">
				<c:if test="${vo.income == null}">
			        <form>
				        <ul>
					       	<li>
								지출  내역 : ${vo.content} 금액 : ${vo.expense} 날짜 : ${vo.day} 입니다.
						    	<input type="hidden" name="idx" value="${vo.idx}">
								<input type="button" value="삭제" onclick="del(this.form);">
						    </li>
					    </ul>
					</form>
				</c:if>
			</c:if>
		</c:forEach>
	</c:forEach>

		<c:set var = "total" value = "0" />
		<c:forEach var="result" items="${m_list}" varStatus="status">     
			<c:set var= "total_income" value="${total_income + result.income}"/>
			<c:set var= "total_expense" value="${total_expense + result.expense}"/>
		</c:forEach>
		
        <p class="my-header">총 수입금액: <c:out value="${total_income}"/></p>
        <p class="my-header">총 지출금액: <c:out value="${total_expense}"/></p>



</body>
</html>