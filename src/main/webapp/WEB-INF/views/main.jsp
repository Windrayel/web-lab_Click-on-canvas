<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Lab1</title>
    <style>
        body {
            background-color: azure;
        }
        div header {
            border-radius: 3px;
            padding: 10px;
            text-align: center;
            background-color: aquamarine;
            color: black;
            font-family: fantasy;
        }
        canvas {
            margin-top:20px;
            display: block;
            margin-left: auto;
            margin-right: auto;
            border: 1px solid black;
        }
        form div {
            text-align: center;
        }
        form .X, .Y, .R, .error {
            margin-top: 20px;
            padding: 1px 10px 10px 10px;
        }
        .X {
            background-color: cyan;
            border-radius: 5px;
        }
        .X input{
            border-style: initial;
        }
        .Y {
            background-color: chartreuse;
            border-radius: 10px;
        }
        .R {
            background-color: cadetblue;
            border-radius: 20px;
        }
        .error{
            background-color: red;
        }
        #error {
            display: none;
        }
        table, th, td {
            border: 1px solid black;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
    </style>
    <script src="<c:url value="/resources/js/button_pressing.js" />"></script>
    <script src="<c:url value="/resources/js/validation.js" />"></script>

</head>
<body>
<div>
    <header >
        Романов Константин<br>
        Группа P33202<br>
        Вариант 2931
    </header>
</div>
<div>
    <canvas width="400" height="400" id="canvas" ></canvas>
    <script src="<c:url value="/resources/js/graph.js"/>"></script>
</div>
<div>
    <form:form method="POST" action="${pageContext.request.contextPath}/addPoint" name="info">
        <div class="X" id="X">
            <p>Выберите значение X:</p>
            <input type="button" onclick="pressEffect('b-2')" id="b-2" name="X" value=-2>
            <input type="button" onclick="pressEffect('b-1.5')" id="b-1.5" name="X" value=-1.5>
            <input type="button" onclick="pressEffect('b-1')" id="b-1" name="X" value=-1>
            <input type="button" onclick="pressEffect('b-0.5')" id="b-0.5" name="X" value=-0.5>
            <input type="button" onclick="pressEffect('b0')" id="b0" name="X" value=0>
            <input type="button" onclick="pressEffect('b0.5')" id="b0.5" name="X" value=0.5>
            <input type="button" onclick="pressEffect('b1')" id="b1" name="X" value=1>
            <input type="button" onclick="pressEffect('b1.5')" id="b1.5" name="X" value=1.5>
            <input type="button" onclick="pressEffect('b2')" id="b2" name="X" value=2>
            <input type="hidden" id="hiddenButton" name="X" value="-500">
        </div>
        <div class="Y">
            <p>Введите значение Y:</p>
            <input type="text" id="y" name="Y" placeholder="(-5,3)" oninput="showError()" onchange="showError()">
            <label for="y">Y</label>
        </div>
        <div class="R">
            <p>Выберите значение радиуса R:</p>
            <input type="radio" onclick="enableDots(1); showError()" id="br1" name="R" value=1>
            <label for="br1">1</label>
            <input type="radio" onclick="enableDots(2); showError()" id="br2" name="R" value=2>
            <label for="br2">2</label>
            <input type="radio" onclick="enableDots(3); showError()" id="br3" name="R" value=3>
            <label for="br3">3</label>
            <input type="radio" onclick="enableDots(4); showError()" id="br4" name="R" value=4>
            <label for="br4">4</label>
            <input type="radio" onclick="enableDots(5); showError()" id="br5" name="R" value=5>
            <label for="br5">5</label>
            <input type="hidden" id="hiddenButtonR" name="R">
        </div>

        <p id="out"></p>

        <div class="error" id="error">
            Значение X, Y или R отсутствует или не соответствует формату
        </div>
        <div>
            <input type="submit" id="submit" value="Отправить" disabled>
        </div>
    </form:form>
</div>
<div class="results">
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
                <script>drawDot(${i.x}, ${i.y}, ${i.r})</script>
<%--                <th>${i.getX()}</th>--%>
<%--                <th>${i.y}</th>--%>
                <th><fmt:formatNumber type="number" minFractionDigits="1" maxFractionDigits="3" value="${i.getX()}"/></th>
                <th><fmt:formatNumber type="number" minFractionDigits="1" maxFractionDigits="3" value="${i.y}"/></th>
                <th>${i.r}</th>
                <th>${i.result}</th>
                <th>${i.callTime}</th>
                <th>${i.calcTime} мс</th>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>