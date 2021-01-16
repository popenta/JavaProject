<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:pageTemplate pageTitle="Login">
    <c:if test="${message != null}">
        <div class="alert alert-warning" role="alert">
            ${message}
        </div>
    </c:if>
    <div style="width: 40%; padding:30px; border-radius: 5px; border:1px solid #dedede; margin: 80px auto 0 auto; box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);">
        <form class="form-sigin" method="POST" action="j_security_check">
            <h1 style="text-align: center; padding-bottom: 70px; color: #4B8CA6;">Login</h1>
            <label for="username" class="sr-only">Username</label>
            <input type="text" id="username" name="j_username" class="form-control" placeholder="Username" required autofocus />
            <label for="password" class="sr-only">Password</label>
            <input type="password" id="password" style="margin-bottom: 30px;" name="j_password" class="form-control" placeholder="Password" required />
            <button class="btn btn-lg btn-primary btn-block" style="background-color: #4B8CA6; border: none; box-shadow: 0 2px 4px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);" onMouseOver="this.style.background='#A7D9D9'" onMouseOut="this.style.background='#4B8CA6'" type="submit">Sign in</button>
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
