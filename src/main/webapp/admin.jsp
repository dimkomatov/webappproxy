<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%><html xmlns:th="http://www.thymeleaf.org" xmlns:tiles="http://www.thymeleaf.org">
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<head>
    <title tiles:fragment="title">Администрирование</title>
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
    min-height:400px;
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
    margin-top: 5px;
}
.cbm_wrap p{
    margin-top: 5px !important;
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
          <div class="center ">
<div tiles:fragment="content">
    <form name="f5" th:action="@{/admin}" method="post">
        <fieldset>
            <label for="personName">Имя</label>
            <input type="text" id="personName" name="personName"/>
            <label for="address">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Адрес</label>
            <input type="text" id="address" name="address"/>
            <br>
            <br>
            <label for="personMiddleName">Отчество&nbsp;</label>
            <input type="text" id="personMiddleName" name="personMiddleName"/>
             <label for="phone">Номер телефона</label>
             <input type="text" id="phone" name="phone"/>
             <br>
             <br>
            <label for="personSurName">Фамилия&nbsp;</label>
            <input type="text" id="personSurName" name="personSurName"/>
            <label for="birthdate">Дата рождения</label>
            <input type="text" id="birthdate" name="birthdate"/>
            <input type="text" style="display: none;" id="addPerson" name="action" value="addPerson"/>
            <br>
            <br>
            <div class="form-actions">
                <button type="submit" class="btn">Добавить избирателя</button>
            </div>
                <c:if test="${not empty addedPerson}">
                    <ul>
                        <c:forEach var="personValue" items="${addedPerson}">
                            <li>${personValue}</li>
                        </c:forEach>
                    </ul>
                </c:if>
        </fieldset>
    </form>



    <form name="f6" th:action="@{/admin}" method="post">
        <fieldset>
            <label for="description">Название выборов</label>
            <input type="text" id="description" name="description"/>
            <br>
            <br>
            <label for="addressVote">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Адрес</label>
            <input type="text" id="addressVote" name="addressVote"/>
            <br>
            <br>
            <label for="voteDate">Дата голосования</label>
            <input type="text" id="voteDate" name="voteDate"/>
            <input type="text" style="display: none;" id="addVote" name="action" value="addVote"/>
            <br>
            <br>
            <div class="form-actions">
                <button type="submit" class="btn">Добавить выборы</button>
            </div>
                <c:if test="${not empty addedVote}">
                    <ul>
                        <c:forEach var="personValue" items="${addedVote}">
                            <li>${personValue}</li>
                        </c:forEach>
                    </ul>
                </c:if>
        </fieldset>
    </form>


    <form name="f7" th:action="@{/admin}" method="post">
        <fieldset>
            <form:select name="voteId" path="votes">
                <form:option value="0" label="Выборы"/>
                <form:options items="${voteList}" />
            </form:select>
            <br>
            <br>
            <form:select name="personId"  path="people">
                <form:option value="0" label="Избиратели"/>
                <form:options items="${personList}" />
            </form:select>
            <br>
            <br>
            <form:select name="voted"  path="personVote">
                <form:option value="false" label="Голосовал"/>
                <form:option value="true" label="Не голосовал"/>
            </form:select>
            <br>

            <input type="text" style="display: none;" id="showByVote" name="action" value="addPersonVote"/>
            <br>

            <div class="form-actions">
                <button type="submit" class="btn" >Добавить факт голосования/право голоса</button>
            </div>
                <c:if test="${not empty addedPersonVote}">
                    <ul>
                        <c:forEach var="personValue" items="${addedPersonVote}">
                            <li>${personValue}</li>
                        </c:forEach>
                    </ul>
                </c:if>
        </fieldset>
    </form>


    <form name="f8" th:action="@{/admin}" method="post">
        <fieldset>
            <form:select name="voteId" path="votess">
                <form:option value="0" label="Выборы"/>
                <form:options items="${voteList}" />
            </form:select>
            <br>
            <br>
            <input type="text" style="display: none;" id="deleteVote" name="action" value="deleteVote"/>
            <br>
            <div class="form-actions">
                <button type="submit" class="btn" >Удалить выборы</button>
            </div>
                <c:if test="${not empty deletedVote}">
                    <ul>
                        <c:forEach var="personValue" items="${deletedVote}">
                            <li>${personValue}</li>
                        </c:forEach>
                    </ul>
                </c:if>
        </fieldset>
    </form>


    <form name="f9" th:action="@{/admin}" method="post">
        <fieldset>
            <form:select name="personId" path="peoplee">
                <form:option value="0" label="Избиратели"/>
                <form:options items="${personList}" />
            </form:select>
            <br>

            <input type="text" style="display: none;" id="deletePerson" name="action" value="deletePerson"/>
            <br>
            <div class="form-actions">
                <button type="submit" class="btn" >Удалить выборы</button>
            </div>
                <c:if test="${not empty deletedPerson}">
                    <ul>
                        <c:forEach var="personValue" items="${deletedPerson}">
                            <li>${personValue}</li>
                        </c:forEach>
                    </ul>
                </c:if>
        </fieldset>
    </form>


    <form name="f10" th:action="@{/admin}" method="post">
        <fieldset>
            <form:select name="personVoteIds" path="personVotes">
                <form:option value="0" label="Избиратели на выборах"/>
                <form:options items="${personVoteList}" />
            </form:select>
            <br>
            <input type="text" style="display: none;" id="deletePersonVote" name="action" value="deletePersonVote"/>
            <br>
            <div class="form-actions">
                <button type="submit" class="btn" >Удалить факт голосования/право голоса</button>
            </div>
                <c:if test="${not empty deletedPersonVote}">
                    <ul>
                        <c:forEach var="personValue" items="${deletedPersonVote}">
                            <li>${personValue}</li>
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