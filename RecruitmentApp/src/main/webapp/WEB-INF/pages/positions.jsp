<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:pageTemplate pageTitle="Positions">
    <h1>Positions</h1>

        <c:forEach var="positions" items="${positions}" varStatus="status">
            <div class="row">
                
                <div class="col-md-4">
                    ${positions.nume}
                </div>
                <div class="col-md-4">
                    ${positions.nrPersoane}
                </div>
                
            </div>
        </c:forEach>
    
</t:pageTemplate>