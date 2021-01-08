<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<t:pageTemplate pageTitle="Edit User">
        <h1>Edit User</h1>
        
        <form class="needs-validation" novalidate method="POST" action="${pageContext.request.contextPath}/EditUser">
            
            <div class="row">
                <div class="col-md-6 mb-3">
                    <label for="nume">Nume</label>
                    <input type="text" class="form-control" id="nume" name="nume" placeholder="" value="${user.nume}" required>
                    <div class="invalid-feedback">
                        Name is required.
                    </div>
                </div>
            </div>
            
            <div class="row">
                <div class="col-md-6 mb-3">
                    <label for="prenume">Prenume</label>
                    <input type="text" class="form-control" id="prenume" name="prenume" placeholder="" value="${user.prenume}" required>
                    <div class="invalid-feedback">
                        First name is required.
                    </div>
                </div>
            </div>
            
            <div class="row">
                <div class="col-md-6 mb-3">
                    <label for="telefon">Telefon</label>
                    <input type="text" class="form-control" id="telefon" name="telefon" placeholder="" value="${user.telefon}" required>
                    <div class="invalid-feedback">
                        Phone is required.
                    </div>
                </div>
            </div>
            
            <div class="row">
                <div class="col-md-6 mb-3">
                    <label for="email">Email</label>
                    <input type="email" class="form-control" id="email" name="email" placeholder="" value="${user.email}" required>
                    <div class="invalid-feedback">
                        Email is required.
                    </div>
                </div>
            </div>
            
            <!--<div class="row">
                <div class="col-md-6 mb-3">
                    <label for="password">Password</label>
                    <input type="password" class="form-control" id="password" name="password" placeholder="" value="" required>
                    <div class="invalid-feedback">
                        Password is required.
                    </div>
                </div>
            </div>-->
            
            <div class="row">
                <div class="col-md-6 mb-3">
                    <label for="position">Position</label>
                    <select class="custom-select d-block w-100" id="position" name="position" required>
                        <option value="">Choose...</option>
                        <option value="Director General">Director General</option>
                        <option value="Director Departament">Director Departament</option>
                        <option value="Director HR">Director HR</option>
                        <option value="Recruiter">Recruiter</option>
                        <option value="Admin Aplicatie">Admin Aplicatie</option>  
                    </select>
                    <div class="invalid-feedback">
                        Please select a position.
                    </div>
                </div>
            </div>
            <input type="hidden" name="user_id" value="${user.id}" />
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
            
