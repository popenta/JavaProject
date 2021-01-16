<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:pageTemplate pageTitle="Positions">
    <div style="padding:30px; border-radius: 5px; border:1px solid #dedede; margin: 30px auto 0 auto; box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);">
    <h1 style="text-align: center; padding-bottom: 50px; color: #4B8CA6;">Positions</h1>
    <form method="POST" action="${pageContext.request.contextPath}/PositionsDG"> 
        <div class="row" style="font-weight: bold; font-size: 110%; margin-bottom: 20px; text-align: center;">

            <div class="col-md-2">
                Nume pozitie
            </div>
            <div class="col-md-2">
                Numar persoane
            </div>
            <div class="col-md-2">
                Position opener
            </div>
            <div class="col-md-2">
                Departament
            </div>

            <div class="col-md-2">
                Stare
            </div>

            <div class="col-md">

            </div>

            <div class="col-md">

            </div>

        </div>     

        <c:forEach var="positions" items="${positions}" varStatus="status">
            <div class="row" style="margin-bottom: 10px; text-align: center;">

                <div class="col-md-2">
                    ${positions.nume}
                </div>
                <div class="col-md-2">
                    ${positions.nrPersoane}
                </div>
                <div class="col-md-2">
                    ${positions.posOpener}
                </div>
                <div class="col-md-2">
                    ${positions.departament}
                </div>
                <div class="col-md-2">
                    ${positions.stare}
                </div>
                <div class="col-md">
                    <a class="btn btn-secondary" style="background-color: #4B8CA6; border:none; box-shadow: 0 2px 4px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);" onMouseOver="this.style.background = '#A7D9D9'" onMouseOut="this.style.background = '#4B8CA6'" href="${pageContext.request.contextPath}/AcceptPosition?id=${positions.id}" role="button">Accept</a>
                </div>
                <div class="col-md">
                    <a class="btn btn-secondary" style="background-color: #D93B58; border:none; box-shadow: 0 2px 4px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);" onMouseOver="this.style.background = '#ff8097'" onMouseOut="this.style.background = '#D93B58'" href="${pageContext.request.contextPath}/DeclinePosition?id=${positions.id}" role="button">Decline</a>
                </div>
            </div>
        </c:forEach>
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