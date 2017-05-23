<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<head>
    <title tiles:fragment="title">Proxy Web App</title>
      <script src="https://www.google.com/jsapi"></script>

        <script>
         google.load("visualization", "1", {packages:["corechart"]});
         google.setOnLoadCallback(drawChart1);
         function drawChart1() {
          var data = google.visualization.arrayToDataTable([
           ['Страна', 'Количество запросов']
               <c:forEach var="cCount" items="${countryCount}">
                ,['${cCount[0]}', ${cCount[1]}]
               </c:forEach>
          ]);
          var options = {
           title: 'Статистика по странам',
           hAxis: {title: 'Страна'},
           vAxis: {title: 'Количество запросов'}
          };
          var chart = new google.visualization.ColumnChart(document.getElementById('countryStatistic'));
          chart.draw(data, options);
         }
        </script>
        <script>
           google.load("visualization", "1", {packages:["corechart"]});
           google.setOnLoadCallback(drawChart1);
           function drawChart1() {
            var data = google.visualization.arrayToDataTable([
             ['Город', 'Количество запросов']
                 <c:forEach var="ciCount" items="${cityCount}">
                  ,['${ciCount[0]}', ${ciCount[1]}]
                 </c:forEach>
            ]);
            var options = {
             title: 'Статистика по городам',
             hAxis: {title: 'Город'},
             vAxis: {title: 'Количество запросов'}
            };
            var chart = new google.visualization.ColumnChart(document.getElementById('cityStatistic'));
            chart.draw(data, options);
           }
        </script>
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
  <h2>Статистика количества запросов по странам/городам</h2>
  <form name="f0" th:action="@{/page1}" method="get">
  <div id="countryStatistic" class="block1"></div>
  <div id="cityStatistic" class="block2"></div>
  <br>
  <label for="dateCountryCity1">Время с</label>
  <input type="text" id="dateCountryCity1" name="dateCountryCity1"/>
  <label for="dateCountryCity2">Время по</label>
  <input type="text" id="dateCountryCity2" name="dateCountryCity2"/>
  <input type="text" style="display: none;" id="cityAndCountry" name="action" value="cityAndCountry"/>
  <br> <br>
  <div class="form-actions">
      <button type="submit" class="btn">Показать</button>
  </div>
  </form>

</div>
</div>
</div>
</div>
</body>
</html>