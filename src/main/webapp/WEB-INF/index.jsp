<%--
  Created by IntelliJ IDEA.
  User: plche
  Date: 8/03/22
  Time: 10:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Read Share</title>
        <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
        <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
    </head>
    <body>
        <div class="container">
            <div class="col-6 offset-3 mt-4">
                <%-- header --%>
                <div class="row">
                    <h1 class="fw-bolder" style="color: #8C1AF5">Book Club</h1>
                    <p>A place for friends to share thoughts on books.</p>
                </div>
                <%-- registration & login --%>
                <div class="row">
                    <%-- registration --%>
                    <div class="col">
                        <div class="row">
                            <div class="col-8">
                                <h1 class="text-primary mb-3">Register</h1>
                            </div>
                        </div>
                        <form:form class="rounded border border-5 border-primary" action="/register" method="post" modelAttribute="newUser">
                            <div class="row justify-content-center">
                                <div class="col-9">
                                    <form:label for="userName" path="userName" class="form-label mt-3">User Name:</form:label>
                                    <form:errors path="userName" cssClass="text-danger" />
                                    <form:input type="text" class="form-control mb-3" id="userName" path="userName" aria-label="User's first name" />
                                    <form:label for="email" path="email" class="form-label mt-3">Email:</form:label>
                                    <form:errors path="email" cssClass="text-danger" />
                                    <form:input type="email" class="form-control mb-3" id="email" path="email" aria-label="User's email" />
                                    <form:label for="password" path="password" class="form-label mt-3">Password:</form:label>
                                    <form:errors path="password" cssClass="text-danger" />
                                    <form:input type="password" class="form-control mb-3" id="password" path="password" aria-label="User's password" />
                                    <form:label for="confirm" path="confirm" class="form-label mt-3">Confirm PW:</form:label>
                                    <form:errors path="confirm" cssClass="text-danger" />
                                    <form:input type="password" class="form-control mb-3" id="confirm" path="confirm" aria-label="User's password confirm" />
                                    <div class="d-flex justify-content-end">
                                        <button type="submit" class="btn btn-primary mb-3">Submit</button>
                                    </div>
                                </div>
                            </div>
                        </form:form>
                    </div>
                    <%-- login --%>
                    <div class="col">
                        <div class="row">
                            <div class="col-8">
                                <h1 class="text-primary mb-3">Log in</h1>
                            </div>
                        </div>
                        <form:form class="rounded border border-5 border-primary" action="/login" method="post" modelAttribute="newLogin">
                            <div class="row justify-content-center">
                                <div class="col-9">
                                    <form:label for="email" path="email" class="form-label mt-3">Email:</form:label>
                                    <form:errors path="email" cssClass="text-danger" />
                                    <form:input type="email" class="form-control mb-3" id="email" path="email" aria-label="User's email" />
                                    <form:label for="password" path="password" class="form-label mt-3">Password:</form:label>
                                    <form:errors path="password" cssClass="text-danger" />
                                    <form:input type="password" class="form-control mb-3" id="password" path="password" aria-label="User's password" />
                                    <div class="d-flex justify-content-end">
                                        <button type="submit" class="btn btn-primary mb-3">Submit</button>
                                    </div>
                                </div>
                            </div>
                        </form:form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
