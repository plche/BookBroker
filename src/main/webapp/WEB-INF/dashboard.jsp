<%--
  Created by IntelliJ IDEA.
  User: plche
  Date: 8/03/22
  Time: 16:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Read Share</title>
        <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
        <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
    </head>
    <body>
        <div class="row mt-2">
            <div class="col-6 offset-3 mt-2">
                <%-- header --%>
                <div class="col d-flex justify-content-between">
                    <span class="fs-1 fw-bolder" style="color: #8C1AF5;">Welcome, ${userName}!</span>
                    <%-- home & logout --%>
                    <div class="align-self-center">
                        <div class="btn-group" role="group">
                            <a href="/home" class="btn btn-outline-warning">Home</a>
                            <a href="/logout" class="btn btn-outline-danger">Logout</a>
                        </div>
                    </div>
                </div>
                <div class="col d-flex justify-content-between">
                    <span class="align-self-center">Books from everyone's shelves:</span>
                    <div>
                        <a href="/books/new" class="btn btn-outline-primary">+Add to my shelf!</a>
                    </div>
                </div>
            </div>
        </div>
        <%-- body --%>
<%--        <div class="container col-6 border border-5 border-danger mt-3">--%>
        <div class="container col-6 mt-3">
            <div class="container col-12 bg-white p-3">
                <table class="table table-striped p-2">
                    <thead>
                        <tr>
                            <th scope="col">ID</th>
                            <th scope="col">Title</th>
                            <th scope="col">Author Name</th>
                            <th scope="col">Posted By</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="book" items="${books}">
                            <tr>
                                <td><c:out value="${book.id}" /></td>
                                <td><a href="/books/${book.id}"><c:out value="${book.title}" /></a></td>
                                <td><c:out value="${book.author}" /></td>
                                <td><c:out value="${book.user.userName}" /></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
