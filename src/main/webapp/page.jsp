<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<head>
    <title tiles:fragment="title">Proxy Web App</title>
      <script src="https://www.google.com/jsapi"></script>
<script>
   google.load("visualization", "1", {packages:["corechart"]});
   google.setOnLoadCallback(drawChart);
   function drawChart() {
    var data = google.visualization.arrayToDataTable([
      ['Страна', 'Процент'],
      ['Китай',     78.09],
      ['Россия', 20.95],
      ['Нидерланды',    0.93],
      ['Канада', 0.03]
    ]);
    var options = {
     title: 'Статистика использования по странам',
     is3D: true,
     pieResidueSliceLabel: 'Остальные'
    };
    var chart = new google.visualization.PieChart(document.getElementById('countryStatistic'));
     chart.draw(data, options);
   }
  </script>
        <script>
         google.load("visualization", "1", {packages:["corechart"]});
         google.setOnLoadCallback(drawChart);
         function drawChart() {
          var data = google.visualization.arrayToDataTable([
           ['Ресурс', 'Количество запросов'],
           ['youtube.com', 1034504],
           ['vk.com', 5329847],
           ['popt.su', 3382442]
          ]);
          var options = {
           title: 'Наиболее посещаемые ресурсы',
           hAxis: {title: 'URL ресурса'},
           vAxis: {title: 'Количество запросов'}
          };
          var chart = new google.visualization.ColumnChart(document.getElementById('URLstatistic'));
          chart.draw(data, options);
         }
        </script>
</head>
<body>
 <style>
   .block1 {
    width: 485px;
    height: 400px;
    padding: 5px;
    float: left;
   }
   .block2 {
    width: 485px;
    height: 400px;
    padding: 5px;
    float: right;
    position: relative;
   }
  .wrapper_body {
      position: absolute;
      padding: 30px 0;
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
      width: 1000px;
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
<h1 class="center">Proxy Server Statictic</h1>
  <div class="wrapper_body">
  <div class="cbm_wrap">
  <div id="countryStatistic" class="block1"></div>
  <div id="URLstatistic" class="block2"></div>
  <br>
  <br>
    <form name="f4" th:action="@{/page}" method="get">
            <br>
            <input type="text" style="display: none;" id="findAll" name="action" value="findAllAccess"/>
            <br>
            <div class="form-actions">
                <button type="submit" class="btn" >Show all</button>
            </div>
            <br>
                <c:if test="${not empty allAccess}">
                    <ul>
                        <c:forEach var="accessValue" items="${allAccess}">
                            <li>${accessValue}</li>
                        </c:forEach>
                    </ul>
                </c:if>
        </fieldset>
    </form>
</div>
</div>
</div>
</div>
</body>
</html>