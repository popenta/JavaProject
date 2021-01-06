<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:pageTemplate pageTitle="Users">
    
    <h1>Users</h1>

    <form method="POST" action="${pageContext.request.contextPath}/Users">
    
        <c:forEach var="users" items="${users}" varStatus="status">
            <div class="row">
                <c:if test="${pageContext.request.isUserInRole('DirectorGeneralRol') || pageContext.request.isUserInRole('AdminAplicatieRol')}">
                <div class="col-md">
                    <input type="checkbox" name="user_ids" value="${users.id}"/>
                </div>
                </c:if>
                <div class="col-md-3">
                    ${users.nume}
                </div>
                <div class="col-md-3">
                    ${users.email}
                </div>
                <div class="col-md-3">
                    ${users.position}
                </div>
                <c:if test="${pageContext.request.isUserInRole('DirectorGeneralRol') || pageContext.request.isUserInRole('AdminAplicatieRol')}">
                <div class="col-md-2">
                    <a class="btn btn-secondary" href="${pageContext.request.contextPath}/EditUser?id=${users.id}" role="button">Edit User</a>
                </div>
                </c:if>
            </div>
        </c:forEach>
        <c:if test="${pageContext.request.isUserInRole('DirectorGeneralRol') || pageContext.request.isUserInRole('AdminAplicatieRol')}">
            <a class="btn btn-primary" href="${pageContext.request.contextPath}/AddUser" role="button">Add user</a>
        <button class="btn btn-danger" type="submit">Delete selected users</button>
        </c:if>
    </form>
</t:pageTemplate>