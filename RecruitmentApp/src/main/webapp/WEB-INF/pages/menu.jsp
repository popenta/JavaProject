<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container">
    <nav class="navbar navbar-expand-md navbar-dark bg-dark">
        <a class="navbar-brand" href="${pageContext.request.contextPath}">Recruitment App</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarsExampleDefault">
            <ul class="navbar-nav mr-auto">


                <c:if test="${pageContext.request.isUserInRole('DirectorGeneralRol') || pageContext.request.isUserInRole('AdminAplicatieRol')}">
                    <li class="nav-item ${activePage eq 'Users' ? ' active' : ''}">
                        <a class="nav-link" href="${pageContext.request.contextPath}/Users">Users</a>
                    </li>   
                </c:if>

                 <c:if test="${pageContext.request.isUserInRole('DirectorGeneralRol') || pageContext.request.isUserInRole('DirectorHrRol') || pageContext.request.isUserInRole('RecruiterRol')
                       || pageContext.request.isUserInRole('DirectorDepRol')}">
                    <li class="nav-item ${activePage eq 'Candidates' ? ' active' : ''}">
                        <a class="nav-link" href="${pageContext.request.contextPath}/Candidates">Candidates</a>
                    </li>  
                </c:if>
                    
                 <c:if test="${pageContext.request.isUserInRole('DirectorGeneralRol')}">
                    <li class="nav-item ${activePage eq 'PositionsDG' ? ' active' : ''}">
                        <a class="nav-link" href="${pageContext.request.contextPath}/PositionsDG">Activate Positions</a>
                    </li>  
                </c:if>

                 
                    <li class="nav-item ${activePage eq 'Positions' ? ' active' : ''}">
                        <a class="nav-link" href="${pageContext.request.contextPath}/Positions">Positions</a>
                    </li>  
               

            </ul>
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <c:choose>
                        <c:when test="${pageContext.request.getRemoteUser() == null}">
                            <a class="nav-link" href="${pageContext.request.contextPath}/Login">Login</a>
                        </c:when>
                        <c:otherwise>
                            <a class="nav-link" href="${pageContext.request.contextPath}/Logout">Logout</a>
                        </c:otherwise>
                    </c:choose>
                </li>
            </ul>
        </div>
    </nav>
</div>