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
             title: 'Среднее время посещения URL ' + document.getElementById('coAvgEl').value + ' по странам',
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
               title: 'Среденее время посещения URL ' + document.getElementById('coAvgEl').value  + ' по городам',
               hAxis: {title: 'Город'},
               vAxis: {title: 'Среднее время посещения'}
              };
              var chart = new google.visualization.ColumnChart(document.getElementById('cityAvgElStatistic'));
              chart.draw(data, options);
             }
          </script>
</head>
<body>
 <style>
   .block1 {
    width: 560px;
    height: 400px;
    padding: 5px;
    float: left;
   }
   .block2 {
    width: 560px;
    height: 400px;
    padding: 5px;
    float: right;
    position: relative;
   }
  .wrapper_body {
      position: absolute;
      padding: 3px 0;
      height: 100%;
      width: 100%;
      background: #DEF;
      background: -moz-linear-gradient(45deg, #EFF, #DEF);
      background: -ms-linear-gradient(45deg, #EFF, #DEF);
      background: -webkit-linear-gradient(45deg, #EFF, #DEF);
      background: linear-gradient(45deg, #EFF, #DEF);    min-height: 100%;
      font-size: 11px;
      font-family: 'Open Sans', sans-serif;
      color: #4A4A4A ;
      text-align: center;
  }
  .cbm_wrap  {
      background: #FFFFFF;
      background: -moz-linear-gradient(0deg, #F5F5F5 0%, #FFF 25%, #FFF 75%, #F5F5F5 100%);
      background: -ms-linear-gradient(0deg, #F5F5F5 0%, #FFF 25%, #FFF 75%, #F5F5F5 100%);
      background: -webkit-linear-gradient(0deg, #F5F5F5 0%, #FFF 25%, #FFF 75%, #F5F5F5 100%);
      background: linear-gradient(0deg, #F5F5F5 0%, #FFF 25%, #FFF 75%, #F5F5F5 100%);
      border: 1px solid #777777;
      -moz-border-radius: 6px 6px 6px 6px;
      -webkit-border-radius: 6px 6px 6px 6px;
      border-radius: 6px 6px 6px 6px;
      -moz-box-shadow: 0 0 6px rgba(0, 0, 0, 0.5);
      -webkit-box-shadow: 0 0 6px rgba(0, 0, 0, 0.5);
      box-shadow: 0 0 6px rgba(0, 0, 0, 0.5);
      margin: 30px auto;
      padding: 22px;
      position: relative;
      width: 1150px;
      min-height:390px;
  }
  .cbm_wrap :before, .cbm_wrap :after {
      background: none;
      bottom: 22px;
      -moz-box-shadow: 0 10px 12px rgba(0, 0, 0, 0.5);
      -webkit-box-shadow: 0 10px 12px rgba(0, 0, 0, 0.5);
      box-shadow: 0 10px 12px rgba(0, 0, 0, 0.5);
      content: '';
      height: 20px;
      left: 22px;
      position: absolute;
      width: 40%;
      z-index: -1;
      -moz-transform: skew(-4deg) rotate(-4deg);
      -webkit-transform: skew(-4deg) rotate(-4deg);
      transform: skew(-4deg) rotate(-4deg);
  }
  .cbm_wrap :after {
      -moz-transform: skew(4deg) rotate(4deg);
      -webkit-transform: skew(4deg) rotate(4deg);
      transform: skew(4deg) rotate(4deg);
      left: auto;
      right: 12px;
  }
  .cbm_wrap img {
      width: 100%;
      margin-top: 25px;
  }
  .cbm_wrap p{
      margin-top: 25px !important;
      text-align: justify !important;
  }
  .cbm_wrap h1{
      font-size: 30px;
      font-weight: bold;
      margin-top: 5px;
      text-shadow: 1px 1px 3px rgba(0,0,0,0.3);
  }
  .cbm_wrap a{
      text-decoration: none;
      color: #4A4A4A !important;
  }
  .cbm_wrap a:hover{
      text-decoration: underline;
      color: #6B6B6B !important ;
  }​
    .center {
      text-align: center;
      position: center;
  }
  </style>
<div tiles:fragment="content">
  <div class="wrapper_body">
  <div class="cbm_wrap">
  <h1 class="center">Proxy Server Statistic</h1>

  <h2>Общее количество подключений к proxy-серверу: ${countAll}</h2>
  <h2>Количество уникальных пользователей proxy-сервера: ${countDistinct}</h2>
  <h2>Среднее количество байт, переданное за сессию: ${avgBytes}</h2>
  <br>
  <h2>Статистика количества запросов по странам/городам</h2>
  <form name="f0" th:action="@{/page}" method="get">
  <div id="countryStatistic" class="block1"></div>
  <div id="cityStatistic" class="block2"></div>
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

  <h2>Самые популярные URL по странам/городам</h2>
  <form name="f00" th:action="@{/page}" method="get">
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

    <h2>Среднее время посещения URL по странам/городам</h2>
    <form name="f0000" th:action="@{/page}" method="get">
    <div id="countryAvgElStatistic" class="block1"></div>
    <div id="cityAvgElStatistic" class="block2"></div>
    <label for="dateCountryCityAvgEl1">Время с</label>
    <input type="text" id="dateCountryCityAvgEl1" name="dateCountryCityAvgEl1"/>
    <label for="dateCountryCityAvgEl2">Время по</label>
    <input type="text" id="dateCountryCityAvgEl2" name="dateCountryCityAvgEl2"/>
    <input type="text" style="display: none;" id="cityAndCountryAvgEl" name="action" value="cityAndCountryAvgEl"/>
    <br><br>
    <label for="coAvgEl">URL</label>
      <select  id="coAvgEl" name="coAvgEl">
          <c:forEach var="url1" items="${findAllUrl}">
            <option value="${url1}" ${url1 == selectedUrlAvgEl ? 'selected="selected"' : ''}>${url1}</option>
          </c:forEach>
      </select>
    <br> <br>
    <div class="form-actions">
        <button type="submit" class="btn">Показать</button>
    </div>
    </form>

    <br>
    <h2>Полная статистика по клиенту с IP=${rhClient}</h2>
        <form name="f100" th:action="@{/page}" method="get">
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
                 <label for="methodClientStatistic">HTTP метод</label>
                 <input type="text" id="methodClientStatistic" name="methodClientStatistic"/>
                 <input type="text" style="display: none;" id="clientStatistic" name="action" value="clientStatistic"/>
                 <br><br>
                 <div class="form-actions">
                     <button type="submit" class="btn">Показать</button>
                 </div>
               </fieldset>
                   </form>

  <br>
    <h2>10 последних запросов через Proxy-сервер</h2>
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
  <br>

     <h2>Среднее количство байт переданное клиентами</h2>
        <form name="f1" th:action="@{/page}" method="get">
             <fieldset>
           <c:if test="${not empty findAvgRhBytes}">
                <table bordercolor="black" border="1" align="center">
                  <tr>
                      <td align="center">Клиентский IP</td>
                      <td align="center">Среденее количество байт</td>
                  </tr>
                   <c:forEach var="rhu" items="${findAvgRhBytes}">
                   <tr>
                       <td align="center">${rhu[0]}</td>
                       <td align="center">${rhu[1]}</td>
                   </tr>
                   </c:forEach>
               </table>
               </c:if>
               <br>
                 <label for="countRhUrl">Количество</label>
                 <input type="text" id="countRhUrl" name="countRhUrl"/>
                 <label for="dateAvgRhBytes1">Время с</label>
                 <input type="text" id="dateAvgRhBytes1" name="dateAvgRhBytes1"/>
                 <label for="dateAvgRhBytes2">Время по</label>
                 <input type="text" id="dateAvgRhBytes2" name="dateAvgRhBytes2"/>
                 <input type="text" style="display: none;" id="findAvgRhBytes" name="action" value="findAvgRhBytes"/>
                 <br> <br>
                 <div class="form-actions">
                     <button type="submit" class="btn">Показать</button>
                 </div>
               </fieldset>
                   </form>
    <br>
</div>
</div>
</div>
</div>
</body>
</html>