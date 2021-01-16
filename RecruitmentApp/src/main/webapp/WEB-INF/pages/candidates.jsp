<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:pageTemplate pageTitle="Candidates">
    <div style="padding:30px; border-radius: 5px; border:1px solid #dedede; margin: 30px auto 0 auto; box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);">
        <h1 style="text-align: center; padding-bottom: 50px; color: #4B8CA6;">Candidates</h1>
        <form method="POST" action="${pageContext.request.contextPath}/Candidates">

            <div class="row" style="font-weight: bold; font-size: 110%; margin-bottom: 20px; text-align: center;">
                <div class = "col-md">

                </div>
                <div class="col-md">
                    Nume
                </div>
                <div class="col-md">
                    Prenume
                </div>
                <div class="col-md">
                    Email
                </div>
                <div class="col-md">
                    Telefon
                </div>
                <div class="col-md">
                    CV
                </div>
                <div class="col-md">
                    Data
                </div>
                <div class="col-md">
                    Job
                </div>
                <div class="col-md-2">
                    Comentariu
                </div>
                <div class = "col-md-2">

                </div>
            </div>

            <c:forEach var="candidates" items="${candidates}" varStatus="status">

                <div class="row" style="margin-bottom: 10px; text-align: center;">
                    <c:if test="${pageContext.request.isUserInRole('DirectorGeneralRol') || pageContext.request.isUserInRole('DirectorHrRol') || pageContext.request.isUserInRole('RecruiterRol')}">
                        <div class="col-md">
                            <input class="form-check-input" type="radio" name="candidate_ids" value="${candidates.id}"/>
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
                        ${candidates.job}
                    </div>
                    <div class="col-md-2">
                        <textarea rows="3" cols="25" style="resize: none; font-size: 80%;" disabled>${candidates.comentariu}</textarea>
                    </div> 
                    <c:if test="${pageContext.request.isUserInRole('DirectorGeneralRol') || pageContext.request.isUserInRole('DirectorHrRol') || pageContext.request.isUserInRole('RecruiterRol')}">
                        <div class="col-md-2">
                            <a class="btn btn-secondary" style="background-color: #1E3859; border:none; box-shadow: 0 2px 4px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);" onMouseOver="this.style.background = '#46658c'" onMouseOut="this.style.background = '#1E3859'" href="${pageContext.request.contextPath}/EditCandidate?id=${candidates.id}" role="button">Edit Candidate</a>
                        </div>
                    </c:if>

                </div>
            </c:forEach>
            <c:if test="${pageContext.request.isUserInRole('DirectorGeneralRol') || pageContext.request.isUserInRole('DirectorHrRol') || pageContext.request.isUserInRole('RecruiterRol')}">
                <a class="btn btn-primary" style="background-color: #4B8CA6; border:none; box-shadow: 0 2px 4px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);" onMouseOver="this.style.background = '#A7D9D9'" onMouseOut="this.style.background = '#4B8CA6'" href="${pageContext.request.contextPath}/AddCandidate" role="button">Add candidate</a>
                <button class="btn btn-danger" style="background-color: #D93B58; border:none; box-shadow: 0 2px 4px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);" onMouseOver="this.style.background = '#ff8097'" onMouseOut="this.style.background = '#D93B58'" type="submit">Delete selected candidates</button>
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