<%--
  Created by IntelliJ IDEA.
  User: plche
  Date: 9/03/22
  Time: 21:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Read Share</title>
        <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
        <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
    </head>
    <body>
        <div class="row justify-content-center mt-4">
            <div class="col-6">
                <div class="row">
                    <div class="col-8">
                        <h1 class="fst-italic pt-2"><c:out value="${book.getTitle()}" /></h1>
                    </div>
                    <div class="col-4 align-self-center">
                        <form class="d-flex justify-content-end" action="/books">
                            <button class="btn btn-sm btn-outline-warning">back to shelves</button>
                        </form>
                    </div>
                </div>
                <div class="row">
                    <c:if test="${book.getUser().getId() eq userId}">
                        <h3 class="fw-bolder">
                            <span class="text-danger">You</span> read
                            <span style="color: #8C1AF5 !important;"><c:out value="${book.getTitle()}" /></span> by
                            <span class="text-success"><c:out value="${book.getAuthor()}" /></span>.
                        </h3>
                        <h3>Here are your thoughts:</h3>    
                    </c:if>
                    <c:if test="${book.getUser().getId() ne userId}">
                        <h3 class="fw-bolder">
                            <span class="text-danger"><c:out value="${book.getUser().getUserName()}" /></span> read
                            <span style="color: #8C1AF5 !important;"><c:out value="${book.getTitle()}" /></span> by
                            <span class="text-success"><c:out value="${book.getAuthor()}" /></span>.
                        </h3>
                        <h3>Here are <c:out value="${book.getUser().getUserName()}" />'s thoughts:</h3>
                    </c:if>
                    <blockquote class="col-9 blockquote ps-5 pe-5 pt-4 pb-4">
                        <p class="border-2 border-top border-bottom pt-4 pb-4"><c:out value="${book.getThoughts()}" /></p>
                    </blockquote>
                    <c:if test="${book.getUser().getId() eq userId}">
                        <div class="col-9 align-self-center">
                            <form class="d-flex justify-content-end" action="/books/${book.id}/edit">
                                <button class="btn btn-sm btn-outline-info">Edit</button>
                            </form>
                        </div>
                    </c:if>
                </div>
            </div>
        </div>
    </body>
</html>
