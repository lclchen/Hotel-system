<!DOCTYPE html>
<html lang="zh">

<head>
    <!-- start: Meta -->

    <#macro meta>
        <#nested >
    <meta name="author" content="lc">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </#macro>
    <@meta></@meta>
    <!-- end: Meta -->

    <!-- start: CSS -->
    <#macro style>
        <#nested >
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/oh.base.css" rel="stylesheet">
    <link href="css/oh.manage.css" rel="stylesheet">
    </#macro>
    <@style/>

    <#macro head>
        <#nested >
        <link rel="icon" href="pic/icon.jpg">
    </#macro>
    <@head/>

</head>

<body>
<#macro content>
<header class="navbar navbar-inverse">
    <div class="container">
        <button class="navbar-toggle" type="button" data-toggle="collapse" data-target="#navbar">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="">
            <img src="pic/icon100.png">
            <span>HOTEL</span>
            <i class="fa fa-hospital-o"></i>
        </a>
        <#include  "header_menu.ftl" >
    </div>
</header>
    <#nested >
</#macro>
<@content/>

<#macro script>
<script type="text/javascript" src="js/jquery/jquery-1.11.1.js"></script>
<script type="text/javascript" src="js/jquery/jquery.cookie.js"></script>
<script type="text/javascript" src="js/jquery/jquery.ui-1.8.18.min.js"></script>
<script type="text/javascript" src="js/jquery/jquery.validate-1.9.min.js"></script>
<script type="text/javascript" src="js/jquery/jquery.tmpl.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/oh.core.js"></script>
<script type="text/javascript" src="js/oh.api.js"></script>
    <#nested >
</#macro>
<@script/>

</body>
</html>
