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
    <h2>Статистика по клиенту с IP=${rhClient}</h2>
        <form name="f100" th:action="@{/page5}" method="get">
             <fieldset>
                  <br>
                 <table bordercolor="black" border="1" align="center">
                  <tr>
                        <td align="center"> Страна клиента </td>
                        <td align="center"> ${findClientCountry} </td>
                  </tr>
                  <tr>
                       <td align="center"> Город клиента </td>
                       <td align="center">${findClientCity}</td>
                  </tr>
                  <tr>
                       <td align="center"> Суммарное время пользования прокси </td>
                       <td align="center"> ${findClientSumElapse} </td>
                  </tr>
                  <tr>
                       <td align="center"> Суммарное переданное количесво байт </td>
                       <td align="center"> ${findClientSumBytes} </td>
                  </tr>
                  <tr>
                       <td align="center"> Наиболее часто передаваемый тип данных </td>
                       <td align="center"> ${findClientMostType} </td>
                  </tr>
                  <tr>
                       <td align="center"> Наиболее часто используемая поисковая система </td>
                       <td align="center"> ${findClientMostHP} </td>
                  </tr>
                 </table>
                 <br>
                <h3> Наиболее посещаемые клиентом ресурсы <h3>
                <c:if test="${not empty findClientUrlSumEl}">
                <table bordercolor="black" border="1" align="center">
                  <tr>
                      <td align="center">URL</td>
                      <td align="center">Суммарное количество времени (в миллисекундах)</td>
                      <td align="center">Количество обращений к URL</td>
                  </tr>
                   <c:forEach var="rhu" items="${findClientUrlSumEl}">
                   <tr>
                       <td align="center">${rhu[0]}</td>
                       <td align="center">${rhu[1]}</td>
                       <td align="center">${rhu[2]}</td>
                   </tr>
                   </c:forEach>
               </table>
               </c:if>
                 <br>
             <label for="rhClientStatistic">Клиентский IP</label>
               <select  id="rhClientStatistic" name="rhClientStatistic">
                   <c:forEach var="rhCS" items="${findAllClients}">
                     <option value="${rhCS}" ${rhCS == selectedRhCS ? 'selected="selected"' : ''}>${rhCS}</option>
                   </c:forEach>
               </select>
                 <label for="dateClientStatistic1">Время с</label>
                 <input type="text" id="dateClientStatistic1" name="dateClientStatistic1"/>
                 <label for="dateClientStatistic2">Время по</label>
                 <input type="text" id="dateClientStatistic2" name="dateClientStatistic2"/>
                 <input type="text" style="display: none;" id="clientStatistic" name="action" value="clientStatistic"/>
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