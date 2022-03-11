<%--
  Created by IntelliJ IDEA.
  User: plche
  Date: 9/03/22
  Time: 17:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Book Share</title>
        <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
        <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
    </head>
    <body>
        <div class="row justify-content-center mt-4">
            <div class="col-4">
                <div class="row">
                    <div class="col-8">
                        <h2 class="text-primary mb-3">Add a Book to Your Shelf!</h2>
                    </div>
                    <div class="col-4 align-self-center">
                        <form class="d-flex justify-content-end" action="/books">
                            <button class="btn btn-sm btn-outline-warning">back to shelves</button>
                        </form>
                    </div>
                </div>
                <form:form class="rounded border border-5 border-primary" action="/books/new" method="post" modelAttribute="newBook">
                    <div class="row justify-content-center">
                        <div class="col-9">
                            <form:label for="title" path="title" class="form-label mt-3">Title:</form:label>
                            <form:errors path="title" cssClass="text-danger" />
                            <form:input type="text" class="form-control mb-3" id="title" path="title" aria-label="Book's title" />
                            <form:label for="author" path="author" class="form-label">Author:</form:label>
                            <form:errors path="author" cssClass="text-danger" />
                            <form:input type="text" class="form-control mb-3" id="author" path="author" aria-label="Book's author"/>
                            <form:label for="thoughts" path="thoughts" class="form-label">My thoughts:</form:label>
                            <form:errors path="thoughts" cssClass="text-danger" />
                            <form:textarea cssClass="form-control mb-3" id="thoughts" path="thoughts" rows="3" aria-label="Book's thoughts"></form:textarea>
                            <div class="d-flex justify-content-end">
                                <button type="submit" class="btn btn-primary mb-3">Submit</button>
                            </div>
                        </div>
                    </div>
                </form:form>
            </div>
        </div>
    </body>
</html>
