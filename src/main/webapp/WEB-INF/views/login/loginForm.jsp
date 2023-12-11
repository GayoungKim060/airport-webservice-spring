<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="co.yeast.dao.AirlineDAO, co.yeast.bean.AirlineVO, java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Login</title>
    <!-- Style -->
    <link rel="stylesheet" href="/css/loginForm.css">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">


</head>
<body>

<div class="d-lg-flex justify-content-lg-center">
    <div class="contents">

        <div class="container">
            <div class="row align-items-center justify-content-center">
                <div class="mb-4">
                    <h3>Sign In</h3>
                    <p class="mb-4">Welcome to Han Airport. Always with Your Journey.</p>
                </div>
                <form action="loginOk" method="post">
                    <div class="form-group first">
                        <label for="username">Username</label>
                        <input type="text" class="form-control" id="username" name="userid">

                    </div>
                    <div class="form-group last mb-3">
                        <label for="password">Password</label>
                        <input type="password" class="form-control" id="password" name="password">

                    </div>

                    <div class="d-flex mb-5 align-items-center">
                        <label class="control control--checkbox mb-0"><span class="caption">Remember me</span>
                            <input type="checkbox" checked="checked"/>
                            <div class="control__indicator"></div>
                        </label>
                        <span class="ml-auto"><a href="#" class="forgot-pass">Forgot Password</a></span>
                    </div>

                    <input type="submit" value="Log In" class="btn btn-block btn-primary">

                    <span class="d-block text-center my-4 text-muted">&mdash; or &mdash;</span>

                    <div class="social-login">
                        <a href="#" class="facebook btn d-flex justify-content-center align-items-center">
                            <span class="icon-facebook mr-3"></span> Login with Facebook
                        </a>
                        <a href="#" class="twitter btn d-flex justify-content-center align-items-center">
                            <span class="icon-twitter mr-3"></span> Login with  Twitter
                        </a>
                        <a href="#" class="google btn d-flex justify-content-center align-items-center">
                            <span class="icon-google mr-3"></span> Login with  Google
                        </a>
                    </div>

                    <div class="w-full text-center p-t-55">
						<span class="txt2">
							Not a member?
						</span>

                        <a href="#" class="txt2 bo1">
                            Sign up now
                        </a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>



<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>
<script>
    $(function() {
        'use strict';

        $('.form-control').on('input', function() {
            var $field = $(this).closest('.form-group');
            if (this.value) {
                $field.addClass('field--not-empty');
            } else {
                $field.removeClass('field--not-empty');
            }
        });

    });
</script>
</body>
</html>
