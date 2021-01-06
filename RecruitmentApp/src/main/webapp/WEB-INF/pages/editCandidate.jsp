<%-- 
    Document   : addCandidate
    Created on : Jan 6, 2021, 1:09:58 PM
    Author     : Leo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<t:pageTemplate pageTitle="Edit Candidates">
    <h1>Edit Candidate</h1>

    <form class="needs-validation" novalidate method="POST" action="${pageContext.request.contextPath}/EditCandidate">

        <div class="row">
            <div class="col-md-6 mb-3">
                <label for="nume">Nume</label>
                <input type="text" class="form-control" id="nume" name="nume" placeholder="" value="${candidate.nume}" required>
                <div class="invalid-feedback">
                    Name is required.
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-6 mb-3">
                <label for="prenume">Prenume</label>
                <input type="text" class="form-control" id="prenume" name="prenume" placeholder="" value="${candidate.prenume}" required>
                <div class="invalid-feedback">
                    First name is required.
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-6 mb-3">
                <label for="telefon">Telefon</label>
                <input type="text" class="form-control" id="telefon" name="telefon" placeholder="" value="${candidate.telefon}" required>
                <div class="invalid-feedback">
                    Phone is required.
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-6 mb-3">
                <label for="email">Email</label>
                <input type="email" class="form-control" id="email" name="email" placeholder="" value="${candidate.email}" required>
                <div class="invalid-feedback">
                    Email is required.
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-6 mb-3">
                <label for="text">CV</label>
                <input type="text" class="form-control" id="cv" name="cv" placeholder="" value="${candidate.cv}" required>
                <div class="invalid-feedback">
                    CV is required.
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-6 mb-3">
                <label for="data">Data</label>
                <input type="text" class="form-control" id="data" name="data" placeholder="" value="${candidate.data}" required>
                <div class="invalid-feedback">
                    Data is required.
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-6 mb-3">
                <label for="comentariu">Comentariu</label>
                <input type="text" class="form-control" id="comentariu" name="comentariu" placeholder="" value="${candidate.comentariu}" required>
                <div class="invalid-feedback">
                    Comment is required.
                </div>
            </div>
        </div>
        <input type="hidden" name="candidate_id" value="${candidate.id}" />
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


