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
             ['Страна', 'Среденее время посещения URL']
                 <c:forEach var="coAvgEl" items="${countryAvgEl}">
                  ,['${coAvgEl[0]}', ${coAvgEl[1]}]
                 </c:forEach>
            ]);
            var options = {
             title: 'Среднее время посещения URL ' + '${coAvgEl}' + ' по странам',
             hAxis: {title: 'Страна'},
             vAxis: {title: 'Среднее время посещения'}
            };
            var chart = new google.visualization.ColumnChart(document.getElementById('countryAvgElStatistic'));
            chart.draw(data, options);
           }
           </script>
           <script>
             google.load("visualization", "1", {packages:["corechart"]});
             google.setOnLoadCallback(drawChart1);
             function drawChart1() {
              var data = google.visualization.arrayToDataTable([
               ['Город', 'Среденее время посещения URL']
                   <c:forEach var="ciAvgEl" items="${cityAvgEl}">
                    ,['${ciAvgEl[0]}', ${ciAvgEl[1]}]
                   </c:forEach>
              ]);
              var options = {
               title: 'Среденее время посещения URL ' + '${coAvgEl}'  + ' по городам',
               hAxis: {title: 'Город'},
               vAxis: {title: 'Среднее время посещения'}
              };
              var chart = new google.visualization.ColumnChart(document.getElementById('cityAvgElStatistic'));
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
    <h2>Среднее время посещения URL по странам/городам</h2>
    <form name="f0000" th:action="@{/page4}" method="get">
    <div id="countryAvgElStatistic" class="block1"></div>
    <div id="cityAvgElStatistic" class="block2"></div>
    <label for="dateCountryCityAvgEl1">Время с</label>
    <input type="text" id="dateCountryCityAvgEl1" name="dateCountryCityAvgEl1"/>
    <label for="dateCountryCityAvgEl2">Время по</label>
    <input type="text" id="dateCountryCityAvgEl2" name="dateCountryCityAvgEl2"/>
    <input type="text" style="display: none;" id="cityAndCountryAvgEl" name="action" value="cityAndCountryAvgEl"/>
    <br><br>
    <label for="coAvgEl">URL</label>
         <input type="text" id="coAvgEl" name="coAvgEl"/>
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