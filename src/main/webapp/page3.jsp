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
             ['Поисковая система', 'Количество переходов']
                 <c:forEach var="coHP" items="${countryHP}">
                  ,['${coHP[0]}', ${coHP[1]}]
                 </c:forEach>
            ]);
            var options = {
             title: 'Самые популярные поисковые системы по стране ' + document.getElementById('countryCoHP').value,
             hAxis: {title: 'Поисковая система'},
             vAxis: {title: 'Количество запросов'}
            };
            var chart = new google.visualization.ColumnChart(document.getElementById('countryHPStatistic'));
            chart.draw(data, options);
           }
           </script>
           <script>
             google.load("visualization", "1", {packages:["corechart"]});
             google.setOnLoadCallback(drawChart1);
             function drawChart1() {
              var data = google.visualization.arrayToDataTable([
               ['Поисковая система', 'Количество переходов']
                   <c:forEach var="ciHP" items="${cityHP}">
                    ,['${ciHP[0]}', ${ciHP[1]}]
                   </c:forEach>
              ]);
              var options = {
               title: 'Самые популярные поисковые системы по городу ' + document.getElementById('cityCoHP').value,
               hAxis: {title: 'Поисковая система'},
               vAxis: {title: 'Количество запросов'}
              };
              var chart = new google.visualization.ColumnChart(document.getElementById('cityHPStatistic'));
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
     <a href="/page">Общая информация</a>
     <a href="/page1">Статистика использования прокси</a>
       <a href="/page2">Самые популярные URL</a>
       <a href="/page3">Самые популярные поисковики</a>
       <a href="/page4">Среднее время посещения URL</a>
       <a href="/page5">1</a>
       <a href="/page6">1</a>
       <a href="/page7">1</a>
   <br>
    <h2>Самые популярные поисковики по странам/городам</h2>
    <form name="f000" th:action="@{/page}" method="get">
    <div id="countryHPStatistic" class="block1"></div>
    <div id="cityHPStatistic" class="block2"></div>
    <label for="dateCountryCityHP1">Время с</label>
    <input type="text" id="dateCountryCityHP1" name="dateCountryCityHP1"/>
    <label for="dateCountryCityHP2">Время по</label>
    <input type="text" id="dateCountryCityHP2" name="dateCountryCityHP2"/>
    <input type="text" style="display: none;" id="cityAndCountryHP" name="action" value="cityAndCountryHP"/>
    <label for="countryCoHP">Страна</label>
      <select  id="countryCoHP" name="countryCoHP">
          <c:forEach var="fac" items="${findAllCountry}">
            <option value="${fac}" ${fac == selectedFacHP ? 'selected="selected"' : ''}>${fac}</option>
          </c:forEach>
      </select>
      <label for="cityCoHP">Город</label>
      <select id="cityCoHP"  name="cityCoHP">
          <c:forEach var="faci" items="${findAllCity}">
            <option value="${faci}" ${faci == selectedFaciHP ? 'selected="selected"' : ''}>${faci}</option>
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