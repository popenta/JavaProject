<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:pageTemplate pageTitle="Candidates">
    <h1>Candidates</h1>
    <form method="POST" action="${pageContext.request.contextPath}/Candidates">
        <c:forEach var="candidates" items="${candidates}" varStatus="status">

            <div class="row">

                <div class="col-md">
                    <input type="checkbox" name="candidate_ids" value="${candidates.id}"/>
                </div>

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
                    <a href="${candidates.cv}">CV</a> 
                </div>
                <div class="col-md">
                    ${candidates.data}
                </div>
                <div class="col-md">
                    ${candidates.comentariu}
                </div>

                <div class="col-md-2">

                    <a class="btn btn-secondary" href="${pageContext.request.contextPath}/EditCandidate?id=${candidates.id}" role="button">Edit Candidate</a>
                </div>

            </div>
        </c:forEach>
        <button class="btn btn-danger" type="submit">Delete selected candidates</button>
    </form>

</t:pageTemplate>