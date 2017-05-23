<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<head>
    <title tiles:fragment="title">Proxy Web App</title>
          <link type="text/css" href="css/main.css" rel="stylesheet" />
</head>
<body>

<div tiles:fragment="content">
  <div class="wrapper_body">
  <div class="cbm_wrap">
  <h1 class="center">Proxy Server Statistic</h1>
  <table  align="center">
      <tr>
          <td><a class="butt" role="button" href="/page">Общая информация</a></td>
          <td><a class="butt" role="button" href="/page1">Статистика использования прокси</a></td>
          <td><a class="butt" role="button" href="/page2">Самые популярные URL</a></td>
          <td><a class="butt" role="button" href="/page3">Самые популярные поисковики</a></td>
      </tr>
      <tr>
          <td><a class="butt" role="button" href="/page4">Среднее время посещения URL</a></td>
          <td><a class="butt" role="button" href="/page5">Статистика по клиенту</a></td>
          <td><a class="butt" role="button" href="/page6">Статистика по ресурсу</a></td>
          <td><a class="butt" role="button" href="/page7">Среднее количество передаваемых байт</a></td>
      </tr>
  </table>
  <h2>Общее количество подключений к proxy-серверу: ${countAll}</h2>
  <h2>Количество уникальных пользователей proxy-сервера: ${countDistinct}</h2>
  <h2>Среднее количество байт, переданное за сессию: ${avgBytes}</h2>
  <br>
    <h2>10 последних запросов через Proxy-сервер</h2>
      <input type="text" style="display: none;" id="allStat" name="action" value="cityAndCountry"/>
       <c:if test="${not empty remotehostUrl}">
            <table bordercolor="black" border="1" align="center">
              <tr>
                  <td align="center">Клиентский IP</td>
                  <td align="center">URL ресурса</td>
              </tr>
               <c:forEach var="rhu" items="${remotehostUrl}">
               <tr>
                   <td align="center">${rhu[0]}</td>
                   <td align="center">${rhu[1]}</td>
               </tr>
               </c:forEach>
           </table>
           </c:if>
  <br>  <br>
</div>
</div>
</div>
</div>
</body>
</html>