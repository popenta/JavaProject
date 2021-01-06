<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:pageTemplate pageTitle="Candidates">
    <h1>Candidates</h1>
    <form method="POST" action="${pageContext.request.contextPath}/Candidates">
        <c:forEach var="candidates" items="${candidates}" varStatus="status">

            <div class="row">
                <c:if test="${pageContext.request.isUserInRole('DirectorGeneralRol') || pageContext.request.isUserInRole('DirectorHrRol') || pageContext.request.isUserInRole('RecruiterRol')}">
                    <div class="col-md">
                        <input type="checkbox" name="candidate_ids" value="${candidates.id}"/>
                    </div>
                </c:if>
                <div class="col-md">
                    ${candidates.nume}
                </div>
                <div class="col-md">
                    ${candidates.prenume}
                </div>
                <div class="col-md">
                    ${candidates.email}
                </div>
                <div class="col-md">
                    ${candidates.telefon}
                </div>
                <div class="col-md">
                    <a href="${candidates.cv}" target="_blank">CV</a> 
                </div>
                <div class="col-md">
                    ${candidates.data}
                </div>
                <div class="col-md">
                    ${candidates.comentariu}
                </div>
                <c:if test="${pageContext.request.isUserInRole('DirectorGeneralRol') || pageContext.request.isUserInRole('DirectorHrRol') || pageContext.request.isUserInRole('RecruiterRol')}">
                    <div class="col-md-2">
                        <a class="btn btn-secondary" href="${pageContext.request.contextPath}/EditCandidate?id=${candidates.id}" role="button">Edit Candidate</a>
                </div>
                </c:if>

            </div>
        </c:forEach>
        <c:if test="${pageContext.request.isUserInRole('DirectorGeneralRol') || pageContext.request.isUserInRole('DirectorHrRol') || pageContext.request.isUserInRole('RecruiterRol')}">
            <a class="btn btn-primary" href="${pageContext.request.contextPath}/AddCandidate" role="button">Add candidate</a>
            <button class="btn btn-danger" type="submit">Delete selected candidates</button>
        </c:if>
    </form>

</t:pageTemplate>