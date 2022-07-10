<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Table</title>
</head>
<body>
<table>
    <tr>
        <th>X</th>
        <th>Y</th>
        <th>R</th>
        <th>Результат</th>
        <th>Время запроса</th>
        <th>Время выполнения</th>
    </tr>
    <c:forEach items="${ChartList}" var="i">
    <tr>
<%--        <th>${i.x}</th>--%>
<%--        <th>${i.y}</th>--%>
        <th><fmt:formatNumber type="number" minFractionDigits="1" maxFractionDigits="3" value="${i.getX()}"/></th>
        <th><fmt:formatNumber type="number" minFractionDigits="1" maxFractionDigits="3" value="${i.y}"/></th>
        <th>${i.r}</th>
        <th>${i.result}</th>
        <th>${i.callTime}</th>
        <th>${i.calcTime} мс</th>
    </tr>
    </c:forEach>
</table>
<form action="${pageContext.request.contextPath}/">
    <input type="submit" value="Вернуться">
</form>
</body>
</html>
