<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:pageTemplate pageTitle="Positions">
    <h1>Positions</h1>
    <form method="POST" action="${pageContext.request.contextPath}/Positions"> 

        <div class="row">
            <div class = "col-md">

            </div>
            <div class="col-md-2">
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
            <div class="col-md-2">
                Cerinte
            </div>
            <div class="col-md-2">
                Responsabilitati
            </div>
            <div class = "col-md-2">

            </div>
        </div>   


        <c:forEach var="positions" items="${positions}" varStatus="status">
            <c:if test="${positions.stare eq 'active'}">
                <div class="row">
                    <c:if test="${pageContext.request.isUserInRole('DirectorGeneralRol') || pageContext.request.isUserInRole('DirectorDepRol') || pageContext.request.isUserInRole('DirectorHrRol')
                                  || pageContext.request.isUserInRole('RecruiterRol')}">
                          <div class="col-md">
                              <input type="checkbox" name="position_ids" value="${positions.id}"/>
                          </div>
                    </c:if>
                    <div class="col-md-2">
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
                    <div class="col-md-2">
                        ${positions.cerinte}
                    </div>
                    <div class="col-md-2">
                        ${positions.responsabilitati}
                    </div>

                    <c:if test="${pageContext.request.isUserInRole('DirectorGeneralRol') || pageContext.request.isUserInRole('DirectorDepRol') || pageContext.request.isUserInRole('DirectorHrRol')
                                  || pageContext.request.isUserInRole('RecruiterRol')}">
                          <div class="col-md-2">
                              <a class="btn btn-secondary" href="${pageContext.request.contextPath}/EditPosition?id=${positions.id}" role="button">Edit Position</a>
                          </div>
                    </c:if>
                </div>

            </c:if>
        </c:forEach>


        <c:if test="${pageContext.request.isUserInRole('DirectorGeneralRol') || pageContext.request.isUserInRole('DirectorDepRol') || pageContext.request.isUserInRole('DirectorHrRol')
                      || pageContext.request.isUserInRole('RecruiterRol')}">
              <a class="btn btn-primary" href="${pageContext.request.contextPath}/AddPosition" role="button">Add position</a> 
              <button class="btn btn-danger" type="submit">Delete selected positions</button>
        </c:if>




    </form>
    
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