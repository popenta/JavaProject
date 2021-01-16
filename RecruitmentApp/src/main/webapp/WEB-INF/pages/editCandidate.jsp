<%-- 
    Document   : addCandidate
    Created on : Jan 6, 2021, 1:09:58 PM
    Author     : Leo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<t:pageTemplate pageTitle="Edit Candidates">
    <div style="width: 40%; padding:30px; border-radius: 5px; border:1px solid #dedede;
         margin: 30px auto 0 auto; box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);">
        <h1 style="text-align: center; padding-bottom: 50px; color: #4B8CA6;">Edit Candidate</h1>

        <form class="needs-validation" novalidate method="POST" action="${pageContext.request.contextPath}/EditCandidate">

            <div class="row">
                <div class="col-md-6 mb-3">
                    <div class="input-group">
                        <span class="input-group-text" style="border-top-right-radius: 0; border-bottom-right-radius: 0; border-right: none;">Nume</span>
                        <input type="text" class="form-control" id="nume" name="nume" placeholder="Nume" value="${candidate.nume}" required>
                    </div>
                    <div class="invalid-feedback">
                        Name is required.
                    </div>
                </div>

                <div class="col-md-6 mb-3">
                    <div class="input-group">
                        <span class="input-group-text" style="border-top-right-radius: 0; border-bottom-right-radius: 0; border-right: none;">Prenume</span>
                        <input type="text" class="form-control" id="prenume" name="prenume" placeholder="Prenume" value="${candidate.prenume}" required>
                    </div>
                    <div class="invalid-feedback">
                        First name is required.
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-6 mb-3">
                    <div class="input-group">
                        <span class="input-group-text" style="border-top-right-radius: 0; border-bottom-right-radius: 0; border-right: none;">Telefon</span>
                        <input type="text" class="form-control" id="telefon" name="telefon" placeholder="Telefon" value="${candidate.telefon}" required>
                    </div>
                    <div class="invalid-feedback">
                        Phone is required.
                    </div>
                </div>
                <div class="col-md-6 mb-3">
                    <div class="input-group">
                        <span class="input-group-text" style="border-top-right-radius: 0; border-bottom-right-radius: 0; border-right: none;">Email</span>
                        <input type="email" class="form-control" id="email" name="email" placeholder="Email" value="${candidate.email}" required>
                    </div>
                    <div class="invalid-feedback">
                        Email is required.
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-12 mb-3">
                    <div class="input-group">
                        <span class="input-group-text" style="border-top-right-radius: 0; border-bottom-right-radius: 0; border-right: none;">CV</span>
                        <input type="text" class="form-control" id="cv" name="cv" placeholder="CV" value="${candidate.cv}" required>
                    </div>
                    <div class="invalid-feedback">
                        CV is required.
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-12 mb-3">
                    <div class="input-group">
                        <span class="input-group-text" style="border-top-right-radius: 0; border-bottom-right-radius: 0; border-right: none;">Data</span>
                        <input type="text" class="form-control" id="data" name="data" placeholder="Data" value="${candidate.data}" required>
                    </div>
                    <div class="invalid-feedback">
                        Data is required.
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-12 mb-3">       
                    <select class="custom-select d-block w-100" id="position" name="position" required>
                        <option value="">Alege job</option>
                        <c:forEach var="positions" items="${positions}" varStatus="status">
                            <c:if test="${positions.stare eq 'active'}">
                                <option value="${positions.nume}">${positions.nume}</option>  
                            </c:if>
                        </c:forEach>

                    </select>
                    <div class="invalid-feedback">
                        Job is required.
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-12 mb-3">
                    <div class="input-group">
                        <span class="input-group-text" style="border-top-right-radius: 0; border-bottom-right-radius: 0; border-right: none;">Comentariu</span>
                        <input type="text" class="form-control" id="comentariu" style="padding-bottom: 100px; padding-top: 20px;"
                               name="comentariu" placeholder="Comentariu" value="${candidate.comentariu}" required>
                    </div>
                    <div class="invalid-feedback">
                        Comment is required.
                    </div>
                </div>
            </div>
            <input type="hidden" name="candidate_id" value="${candidate.id}" />
            <button class="btn btn-primary btn-lg btn-block" class="btn btn-primary btn-lg btn-block" style="background-color: #4B8CA6; border: none;
                    box-shadow: 0 2px 4px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);"
                    onMouseOver="this.style.background = '#A7D9D9'" onMouseOut="this.style.background = '#4B8CA6'" type="submit">Save</button>
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


