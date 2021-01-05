<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:pageTemplate pageTitle="Candidates">
    <h1>Candidates</h1>

        <c:forEach var="candidates" items="${candidates}" varStatus="status">
            <div class="row">
                
                <div class="col-md-4">
                    ${candidates.nume}
                </div>
                <div class="col-md-4">
                    ${candidates.prenume}
                </div>
                <div class="col-md-3">
                    ${candidates.email}
                </div>
            </div>
        </c:forEach>
    
</t:pageTemplate>