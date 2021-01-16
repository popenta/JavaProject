<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:pageTemplate pageTitle="Users">
    <div style="padding:30px; border-radius: 5px; border:1px solid #dedede; margin: 30px auto 0 auto; box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);">
        <h1 style="text-align: center; padding-bottom: 50px; color: #4B8CA6;">Users</h1>

        <form method="POST" action="${pageContext.request.contextPath}/Users">

            <div class="row" style="font-weight: bold; font-size: 110%; margin-bottom: 20px; text-align: center; ">
                <div class = "col-md">

                </div>
                <div class="col-md">
                    Nume
                </div>
                <div class="col-md">
                    Prenume
                </div>
                <div class="col-md-2">
                    Email
                </div>
                <div class="col-md-2">
                    Telefon
                </div>
                <div class="col-md-2">
                    Pozitie
                </div>
                <div class="col-md">
                    Username
                </div>
                <div class = "col-md-2">

                </div>
            </div>

            <c:forEach var="users" items="${users}" varStatus="status">
                <div class="row" style="margin-bottom: 10px; text-align: center;">
                    <c:if test="${pageContext.request.isUserInRole('DirectorGeneralRol') || pageContext.request.isUserInRole('AdminAplicatieRol')}">
                        <div class="col-md">
                            <input class="form-check-input" type="radio" name="user_ids" value="${users.id}"/>
                        </div>
                    </c:if>
                    <div class="col-md">
                        ${users.nume}
                    </div>
                    <div class="col-md">
                        ${users.prenume}
                    </div>
                    <div class="col-md-2">
                        ${users.email}
                    </div>
                    <div class="col-md-2">
                        ${users.telefon}
                    </div>
                    <div class="col-md-2">
                        ${users.position}
                    </div>
                    <div class="col-md">
                        ${users.username}
                    </div>
                    <c:if test="${pageContext.request.isUserInRole('DirectorGeneralRol') || pageContext.request.isUserInRole('AdminAplicatieRol')}">
                        <div class="col-md-2">
                            <a class="btn btn-secondary" style="background-color: #1E3859; border:none; box-shadow: 0 2px 4px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);" onMouseOver="this.style.background = '#46658c'" onMouseOut="this.style.background = '#1E3859'" href="${pageContext.request.contextPath}/EditUser?id=${users.id}" role="button">Edit User</a>
                        </div>
                    </c:if>
                </div>
            </c:forEach>
            <c:if test="${pageContext.request.isUserInRole('DirectorGeneralRol') || pageContext.request.isUserInRole('AdminAplicatieRol')}">
                <a class="btn btn-primary" style="background-color: #4B8CA6; border:none; box-shadow: 0 2px 4px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);" onMouseOver="this.style.background = '#A7D9D9'" onMouseOut="this.style.background = '#4B8CA6'" href="${pageContext.request.contextPath}/AddUser" role="button">Add user</a>
                <button class="btn btn-danger" style="background-color: #D93B58; border:none; box-shadow: 0 2px 4px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);" onMouseOver="this.style.background = '#ff8097'" onMouseOut="this.style.background = '#D93B58'" type="submit">Delete selected users</button>
            </c:if>
        </form>
    </div>
    <script>
        // Example starter JavaScript for disabling form submissions if there are invalid fields
        (function () {
            'use strict'

            window.addEventListener('load', function () {
                // Fetch all the forms we want to apply custom Bootstrap validation styles to
                var forms = document.getElementsByClassName('needs-validation')

                // Loop over them and prevent submission
                Array.prototype.filter.call(forms, function (form) {
                    form.addEventListener('submit', function (event) {
                        if (form.checkValidity() === false) {
                            event.preventDefault()
                            event.stopPropagation()
                        }

                        form.classList.add('was-validated')
                    }, false)
                })
            }, false)
        })()
    </script> 
</t:pageTemplate>