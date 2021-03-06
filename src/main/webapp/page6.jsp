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
          <td><a class="butt" role="button" href="http://88.151.117.6:54485/WebAppProxy-1.3.5.RELEASE/page">Общая информация</a></td>
          <td><a class="butt" role="button" href="http://88.151.117.6:54485/WebAppProxy-1.3.5.RELEASE/page1">Статистика использования прокси</a></td>
          <td><a class="butt" role="button" href="http://88.151.117.6:54485/WebAppProxy-1.3.5.RELEASE/page2">Самые популярные URL</a></td>
          <td><a class="butt" role="button" href="http://88.151.117.6:54485/WebAppProxy-1.3.5.RELEASE/page3">Самые популярные поисковики</a></td>
      </tr>
      <tr>
          <td><a class="butt" role="button" href="http://88.151.117.6:54485/WebAppProxy-1.3.5.RELEASE/page4">Среднее время посещения URL</a></td>
          <td><a class="butt" role="button" href="http://88.151.117.6:54485/WebAppProxy-1.3.5.RELEASE/page5">Статистика по клиенту</a></td>
          <td><a class="butt" role="button" href="http://88.151.117.6:54485/WebAppProxy-1.3.5.RELEASE/page6">Статистика по ресурсу</a></td>
          <td><a class="butt" role="button" href="http://88.151.117.6:54485/WebAppProxy-1.3.5.RELEASE/page7">Среднее количество передаваемых байт</a></td>
      </tr>
  </table>
    <h2>Статистика по ресурсу ${urlStatistic}</h2>
        <form name="f1000" th:action="@{/page6}" method="get">
             <fieldset>
                  <br>
                 <table bordercolor="black" border="1" align="center">
                  <tr>
                        <td align="center"> Наиболее часто использующая ресурс страна </td>
                        <td align="center"> ${findMostUrlCountry} </td>
                  </tr>
                  <tr>
                       <td align="center"> Наиболее часто использующий ресурс город </td>
                       <td align="center">${findMostUrlCity}</td>
                  </tr>
                  <tr>
                       <td align="center"> Общее количество обращений к ресурсу </td>
                       <td align="center"> ${findCountOfUrl} </td>
                  </tr>
                  <tr>
                       <td align="center"> URL с которого наиболее часто переходят на ресурс </td>
                       <td align="center"> ${findMostUrlHp} </td>
                  </tr>
                 </table>
                 <br>
                 <h3> Клиенты посещающие этот ресурс <h3>
                <c:if test="${not empty findMostUrlIp}">
                <table bordercolor="black" border="1" align="center">
                  <tr>
                      <td align="center">Клиентский IP</td>
                      <td align="center">Суммарное количество времени (в миллисекундах)</td>
                  </tr>
                   <c:forEach var="rhu" items="${findMostUrlIp}">
                   <tr>
                       <td align="center">${rhu[0]}</td>
                       <td align="center">${rhu[1]}</td>
                   </tr>
                   </c:forEach>
               </table>
               </c:if>
                 <br>
                <label for="coUrl">URL</label>
                  <input type="text" id="urlStatistic" name="urlStatistic"/>
                <br> <br>
                 <label for="dateUrlStatistic1">Время с</label>
                 <input type="text" id="dateUrlStatistic1" name="dateUrlStatistic1"/>
                 <label for="dateUrlStatistic2">Время по</label>
                 <input type="text" id="dateUrlStatistic2" name="dateUrlStatistic2"/>
                 <input type="text" style="display: none;" id="urlStat" name="action" value="urlStat"/>
                 <br><br>
                 <div class="form-actions">
                     <button type="submit" class="btn">Показать</button>
                 </div>
               </fieldset>
               </form>

</div>
</div>
</div>
</div>
</body>
</html>