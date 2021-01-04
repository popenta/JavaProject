<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:pageTemplate pageTitle="Users">
    <h1>Users</h1>

        <c:forEach var="users" items="${users}" varStatus="status">
            <div class="row">
                
                <div class="col-md-4">
                    ${users.nume}
                </div>
                <div class="col-md-4">
                    ${users.email}
                </div>
                <div class="col-md-3">
                    ${users.position}
                </div>
            </div>
        </c:forEach>
    
</t:pageTemplate>