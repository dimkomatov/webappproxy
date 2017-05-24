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
             ['URL', 'Количество запросов']
                 <c:forEach var="coUrl" items="${countryUrl}">
                  ,['${coUrl[0]}', ${coUrl[1]}]
                 </c:forEach>
            ]);
            var options = {
             title: 'Самые популярные URL по стране ' + document.getElementById('countryCoUrl').value,
             hAxis: {title: 'URL'},
             vAxis: {title: 'Количество запросов'}
            };
            var chart = new google.visualization.ColumnChart(document.getElementById('countryUrlStatistic'));
            chart.draw(data, options);
           }
           </script>
           <script>
             google.load("visualization", "1", {packages:["corechart"]});
             google.setOnLoadCallback(drawChart1);
             function drawChart1() {
              var data = google.visualization.arrayToDataTable([
               ['URL', 'Количество запросов']
                   <c:forEach var="ciUrl" items="${cityUrl}">
                    ,['${ciUrl[0]}', ${ciUrl[1]}]
                   </c:forEach>
              ]);
              var options = {
               title: 'Самые популярные URL по городу ' + document.getElementById('cityCoUrl').value,
               hAxis: {title: 'URL'},
               vAxis: {title: 'Количество запросов'}
              };
              var chart = new google.visualization.ColumnChart(document.getElementById('cityUrlStatistic'));
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
  <h2>Самые популярные URL по странам/городам</h2>
  <form name="f00" th:action="@{/page2}" method="get">
  <div id="countryUrlStatistic" class="block1"></div>
  <div id="cityUrlStatistic" class="block2"></div>
  <label for="dateCountryCityUrl1">Время с</label>
  <input type="text" id="dateCountryCityUrl1" name="dateCountryCityUrl1"/>
  <label for="dateCountryCityUrl2">Время по</label>
  <input type="text" id="dateCountryCityUrl2" name="dateCountryCityUrl2"/>
  <input type="text" style="display: none;" id="cityAndCountryUrl" name="action" value="cityAndCountryUrl"/>
  <label for="countryCoUrl">Страна</label>
    <select  id="countryCoUrl" name="countryCoUrl">
        <c:forEach var="fac" items="${findAllCountry}">
          <option value="${fac}" ${fac == selectedFacUrl ? 'selected="selected"' : ''}>${fac}</option>
        </c:forEach>
    </select>
    <label for="cityCoUrl">Город</label>
    <select id="cityCoUrl"  name="cityCoUrl">
        <c:forEach var="faci" items="${findAllCity}">
          <option value="${faci}" ${faci == selectedFaciUrl ? 'selected="selected"' : ''}>${faci}</option>
        </c:forEach>
    </select>
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