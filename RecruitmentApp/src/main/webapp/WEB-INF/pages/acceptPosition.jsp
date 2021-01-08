<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:pageTemplate pageTitle="Positions">
    <h1>Positions</h1>
    <form method="POST" action="${pageContext.request.contextPath}/PositionsDG"> 
        <div class="row">

            <div class="col-md">
                Nume pozitie
            </div>
            <div class="col-md">
                Numar pers.
            </div>
            <div class="col-md">
                Pos. opener
            </div>
            <div class="col-md">
                Departament
            </div>

            <div class="col-md">
                Stare
            </div>

            <div class="col-md">

            </div>

            <div class="col-md">

            </div>

        </div>     

        <c:forEach var="positions" items="${positions}" varStatus="status">
            <div class="row">

                <div class="col-md">
                    ${positions.nume}
                </div>
                <div class="col-md">
                    ${positions.nrPersoane}
                </div>
                <div class="col-md">
                    ${positions.posOpener}
                </div>
                <div class="col-md">
                    ${positions.departament}
                </div>
                <div class="col-md">
                    ${positions.stare}
                </div>
                <div class="col-md">
                    <a class="btn btn-secondary" href="${pageContext.request.contextPath}/AcceptPosition?id=${positions.id}" role="button">Accept</a>
                </div>
                <div class="col-md">
                    <a class="btn btn-secondary" href="${pageContext.request.contextPath}/DeclinePosition?id=${positions.id}" role="button">Decline</a>
                </div>
            </div>
        </c:forEach>
    </form>
</t:pageTemplate>