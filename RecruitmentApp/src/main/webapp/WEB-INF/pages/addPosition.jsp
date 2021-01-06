<%-- 
    Document   : addCandidate
    Created on : Jan 6, 2021, 1:09:58 PM
    Author     : Leo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<t:pageTemplate pageTitle="Add Position">
    <h1>Add Position</h1>

    <form class="needs-validation" novalidate method="POST" action="${pageContext.request.contextPath}/AddPosition">

        <div class="row">
            <div class="col-md-6 mb-3">
                <label for="nume">Nume</label>
                <input type="text" class="form-control" id="nume" name="nume" placeholder="" value="" required>
                <div class="invalid-feedback">
                    Name is required.
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-6 mb-3">
                <label for="nrPersoane">Numar persoane</label>
                <input type="text" class="form-control" id="nrPersoane" name="nrPersoane" placeholder="" value="" required>
                <div class="invalid-feedback">
                    Number of people required.
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-6 mb-3">
                <label for="posOpener">Position opener</label>
                <input type="text" class="form-control" id="posOpener" name="posOpener" placeholder="" value="" required>
                <div class="invalid-feedback">
                    Position Opener is required.
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-6 mb-3">
                <label for="departament">Departament</label>
                <input type="text" class="form-control" id="departament" name="departament" placeholder="" value="" required>
                <div class="invalid-feedback">
                    Department is required.
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-6 mb-3">
                <label for="cerinte">Cerinte</label>
                <input type="text" class="form-control" id="cerinte" name="cerinte" placeholder="" value="" required>
                <div class="invalid-feedback">
                    This field is required.
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-6 mb-3">
                <label for="responsabilitati">Responsabilitati</label>
                <input type="text" class="form-control" id="responsabilitati" name="responsabilitati" placeholder="" value="" required>
                <div class="invalid-feedback">
                    Duties are required.
                </div>
            </div>
        </div>

        <button class="btn btn-primary btn-lg btn-block" type="submit">Save</button>
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


