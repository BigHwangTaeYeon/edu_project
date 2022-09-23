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
		function modify(f) {
			/* location.href='cash_update.do?idx='+f.idx.value; */
			f.submit();
		}
	</script>
	<script>	<%-- modify --%>
		function change(){
			document.getElementById("change_1").type="text";
			document.getElementById("change_2").type="text";
			document.getElementById("change_3").type="text";

			let x = document.getElementsByClassName("change_text_1")[0];
			let y = document.getElementsByClassName("change_text_2")[0];
			let z = document.getElementsByClassName("change_text_3")[0];
			x.innerText="";
			y.innerText="";
			z.innerText="";
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
					       		<form>
							    	수입  내역 : <span class="change_text_1">${vo.content}</span><input type="hidden" name="content" id="change_1" value="${vo.content}"> 
							    	금액 : <span class="change_text_2">${vo.income}</span><input type="hidden" name="income" id="change_2" value="${vo.income}"> 
							    	날짜 : <span class="change_text_3">${vo.day}</span><input type="hidden" name="day" id="change_3" value="${vo.day}"> 입니다.
							    	
							    	<input type="hidden" name="idx" value="${vo.idx}">
									<input onclick="change();" type="button" value="수정"></input>
									<input type="button" value="변경완료" onclick="modify(this.form);"></input>
							    	<input type="button" value="삭제" onclick="del(this.form);">
						    	</form>
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