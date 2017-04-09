<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%><html xmlns:th="http://www.thymeleaf.org" xmlns:tiles="http://www.thymeleaf.org">
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<head>
    <title tiles:fragment="title">Выборы</title>
</head>
<body>
<style>
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
  }
</style>


<div class="wrapper_body">
     <div class="cbm_wrap ">
<div tiles:fragment="content">

    <form name="f2" th:action="@{/page}" method="post">
        <fieldset>
            <input type="text" style="display: none;" id="mlSt" name="action" value="findMlSt"/>
            <br>
            <div class="form-actions">
                <button type="submit" class="btn" >Показать самого старшего и самого младшего гражданина</button>
            </div>
                <c:if test="${not empty mlSt}">
                    <ul>
                        <c:forEach var="mlStValue" items="${mlSt}">
                            <li>${mlStValue}</li>
                        </c:forEach>
                    </ul>
                </c:if>
        </fieldset>
    </form>

    <form name="f4" th:action="@{/page}" method="post">
        <fieldset>
            <form:select name="voteId"  path="votes">
                <form:option value="0" label="Выбор"/>
                <form:options items="${voteList}" />
            </form:select>
            <br>
            <input type="text" style="display: none;" id="showByVote" name="action" value="getByVote"/>
            <br>
            <div class="form-actions">
                <button type="submit" class="btn" >Показать имеющих право голоса по адресу и дате выборов</button>
            </div>

                <c:if test="${not empty peopleByVote}">
                    <ul>
                        <c:forEach var="personValue" items="${peopleByVote}">
                            <li>${personValue}</li>
                        </c:forEach>
                    </ul>
                </c:if>
        </fieldset>
    </form>



    <form name="f5" th:action="@{/page}" method="post">
        <fieldset>
            <label for="voteDateTime">Дата выборов  </label>
            <input type="text" id="voteDateTime" name="voteDateTime"/>
            <br>
            <input type="text" style="display: none;" id="showByDate" name="action" value="getByDate"/>
            <br>
            <div class="form-actions">
                <button type="submit" class="btn">Показать имеющих право голоса по дате выборов</button>
            </div>
                <c:if test="${not empty peopleByDate}">
                    <ul>
                        <c:forEach var="personValue" items="${peopleByDate}">
                            <li>${personValue}</li>
                        </c:forEach>
                    </ul>
                </c:if>
        </fieldset>
    </form>

    <form name="f" th:action="@{/page}" method="post">
        <fieldset>
            <input type="text" style="display: none;" id="showNameSakes" name="action" value="findNamesakes"/>
            <br>
            <div class="form-actions">
                <button type="submit" class="btn" >Показать однофамильцев</button>
            </div>
                <c:if test="${not empty lists}">
                    <ul>
                        <c:forEach var="listValue" items="${lists}">
                            <li>${listValue}</li>
                        </c:forEach>
                    </ul>
                </c:if>
        </fieldset>
    </form>

    <form name="f2" th:action="@{/page}" method="post">
        <fieldset>
            <input type="text" style="display: none;" id="showVoted" name="action" value="findVoted"/>
            <br>
            <div class="form-actions">
                <button type="submit" class="btn" >Показать принимавших участие в выборах</button>
            </div>
                <c:if test="${not empty voted}">
                    <ul>
                        <c:forEach var="votedValue" items="${voted}">
                            <li>${votedValue}</li>
                        </c:forEach>
                    </ul>
                </c:if>
        </fieldset>
    </form>

    <form name="f3" th:action="@{/page}" method="post">
        <fieldset>
            <input type="text" style="display: none;" id="showUnVoted" name="action" value="findUnVoted"/>
            <br>
            <div class="form-actions">
                <button type="submit" class="btn" >Показать не принимавших участие в выборах</button>
            </div>
                <c:if test="${not empty unvoted}">
                    <ul>
                        <c:forEach var="unvotedValue" items="${unvoted}">
                            <li>${unvotedValue}</li>
                        </c:forEach>
                    </ul>
                </c:if>
        </fieldset>
    </form>




    <form name="f5" th:action="@{/page}" method="post">
        <fieldset>
            <label for="voteAddress">Адрес выборов  </label>
            <input type="text" id="voteAddress" name="voteAddress"/>
            <br>
            <input type="text" style="display: none;" id="showByAddress" name="action" value="getByAddress"/>
            <br>
            <div class="form-actions">
                <button type="submit" class="btn">Показать имеющих право голоса по адресу на текущую дату</button>
            </div>
                <c:if test="${not empty peopleByAddress}">
                    <ul>
                        <c:forEach var="personValue" items="${peopleByAddress}">
                            <li>${personValue}</li>
                        </c:forEach>
                    </ul>
                </c:if>
        </fieldset>
    </form>

</div>
</div>
</div>
</body>
</html>