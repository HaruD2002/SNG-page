<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
          crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
            integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
    crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
            integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
    crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.js"
            integrity="sha512-n/4gHW3atM3QqRcbCn6ewmpxcLAHGaDjpEBu4xZd47N0W2oQ+6q7oc3PXstrJYXcbNU1OHdQ1T7pAP+gi5Yu8g=="
    crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="<c:url value="resource/css/profile.css"></c:url>">
        <script>
            "use strict";

            function imageChange() {
                $(document).ready(function () {
                    $("#picture").click(function () {
                        $("#box").toggleClass("invisible");
                    })
                })
            }

            $(document).mouseup(function (e) {
                var profilepicture = $("#picture");
                if (!profilepicture.is(e.target) && profilepicture.has(e.target).length === 0) {
                    $("#box").addClass("invisible");
                }
            });
        </script> 
        <style>

            .boxcontainer{
                background-color: #111720;
                border-radius: 25px;
                display: block;
                position: relative;        
                margin-bottom: 20px;
                height: 120%;
            }
            .inside{
                margin-left: 24px;
                padding-top: 25px;
                background-color: grey;
                overflow-y: scroll;
                width: 90%;
                border-radius: 25px;

            }
            .myPicture{
                background-color: black;
                width: 100%;
            }
        </style>
        <body>
        <%@include file="../../resource/components/category.jsp" %>%>
        <div class="container-fluid  px-4" style="margin-top: 100px;">
            <div class="row gx-5">
                <div class="col-md-4" on>
                    <div class="row align-items-start">
                        <div class="col-sm-12 boxcontainer">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="user-Avatar">
                                        <div class="updatebox invisible" id="box">
                                            <div class="div-row">
                                                <a data-bs-toggle="modal" data-bs-target="#displayprofile">See User Avatar </a>
                                            </div>
                                            <div class="div-row">
                                                <a>Update User Picture</a>
                                            </div>
                                        </div>
                                        <div class="user-pic col-sm-10" enctype="multipart/form-data">
                                            <div id="picture" onclick="imageChange()">
                                                <c:set value="${userAccount.getAvatar()}" var="userAvatar">
                                                </c:set>
                                                <c:choose>
                                                    <c:when test="${userAvatar == null}"> <img
                                                            src="<c:url value="
                                                                   resource/img/istockphoto-1206037167-612x612.jpg">
                                                            </c:url>"> </c:when>
                                                    <c:otherwise><img
                                                            src="data:image/jpeg;base64,${userAccount.getAvatar()}" />
                                                    </c:otherwise>
                                                </c:choose>
                                                <br>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6 card">
                                    <div class="card-body">
                                        <div class="card-tex user-informationt">
                                            <h4>${userAccount.getDisplayname()}</h4>
                                        </div>
                                        <div class="card-tex user-informationt">
                                            <c:set var="genderx" value="${userAccount.getGender()}">
                                            </c:set>
                                            <c:choose>
                                                <c:when test="${genderx == 1}">
                                                    <h4>Female</h4>
                                                </c:when>
                                                <c:when test="${genderx == 0}">
                                                    <h4>Male</h4>
                                                </c:when>
                                                <c:otherwise>
                                                    <h4>${userAccount.getGender()}</h4>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                        <div class="card-text user-informationt">
                                            <c:set var="dob" value="${userAccount.getDob()}"> </c:set>
                                            <c:choose>
                                                <c:when test="${dob == null}">
                                                    <h4>dd/MM/yyyy</h4>
                                                </c:when>
                                                <c:otherwise>
                                                    <h4>
                                                        <fmt:formatDate type="date"
                                                                        value="${userAccount.getDob()}" />
                                                    </h4>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                        <div class="card-text user-informationt">
                                            <h4>Posted:
                                                <c:set var="x" value="${totalpost}"></c:set>
                                                <c:choose>
                                                    <c:when test="${x<10000}">${totalpost}</c:when>
                                                    <c:otherwise>999+</c:otherwise>
                                                </c:choose>
                                            </h4>
                                        </div><br>
                                        <div class="card-text">
                                            <c:choose>  
                                                <c:when test = "${userAccount.getID() eq user.getID()}"> 
                                                    <div class="dropdown">
                                                        <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false" style="background-color: green; width: 100%; height: 100%">
                                                            User
                                                        </button>
                                                        <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                                                            <li><a class="dropdown-item" href="updateProfile">Update User Profile</a></li>
                                                            <li><a class="dropdown-item" href="#">Update User Password</a></li>
                                                        </ul>
                                                    </div>
                                                </c:when>
                                                <c:when test = "${userAccount.getID() ne user.getID()}">    

                                                </c:when>
                                                <c:otherwise>  
                                                    <div>Something not right </div>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>

                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="row align-items-start">
                        <div class="col-sm-12 boxcontainer">
                            <div class="row col-sm-12"><h1 style="color: white">User Product</h1> </div>
                            <div class="row col-sm-12">

                            </div>
                        </div>
                    </div>

                </div>
                <div class="col-sm-4">
                    <div class="row boxcontainer">
                        <div class=" col-sm-12 inside">
                            rem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
                        </div>
                    </div>
                </div>

                <div class="col-sm-4">
                    <div class="row ">
                        <div class="col-sm-12 boxcontainer">
                            <div class="row">
                                <div class="col-sm-12"><h1>User Game <span class="seeMore"><a href="#">See more</a></span></h1>
                                </div>
                            </div>
                            <div class="row">
                                <div class ="col-sm-12">

                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="row ">
                        <div class="col-sm-12 boxcontainer">
                            <div class="row">
                                <div class="col-sm-12"></div>
                                <h1 style="color:whitesmoke;">Friends <small>${countFriend}</small><span
                                        class="seeMore"><a href="GetAllFriendList">See more</a></span></h1>
                            </div>

                        </div>
                    </div>
                </div>

            </div>
        </div>
        <div class="modal fade" id="displayprofile" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-header">
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-content" style="background-color: black;">
                    <div class="modal-body">
                        <div enctype="multipart/form-data">
                            <div  class="myPicture">
                                <c:set value="${userAccount.getAvatar()}" var="userAvatar">
                                </c:set>
                                <c:choose>
                                    <c:when test="${userAvatar == null}"> <img
                                            src="<c:url value="
                                                   resource/img/istockphoto-1206037167-612x612.jpg">
                                            </c:url>"> </c:when>
                                    <c:otherwise><img
                                            src="data:image/jpeg;base64,${userAccount.getAvatar()}" />
                                    </c:otherwise>
                                </c:choose>
                                <br>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>

</html>