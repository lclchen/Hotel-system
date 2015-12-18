<#import "../partials/base.ftl" as base>

<!DOCTYPE html>
<html>
<head>

<@base.meta></@base.meta>

<#macro style>
    <@base.style>
        <link href="css/bootstrapValidator.css" rel="stylesheet">
    <#nested >
    </@base.style>
</#macro>
<@style></@style>

<@base.head></@base.head>

</head>
<body>

<#macro content>
    <@base.content>
    <div class="container-fluid">
        <div class="row">
            <div id="sidebar-left" class="col-lg-2 col-sm-1">
                <div class="sidebar-nav nav-collapse collapse navbar-collapse">
                    <#include  "../partials/main-menu.ftl">
                </div>
                <a href="" id="main-menu-min" class="full visible-md visible-lg">
                    <i class="fa fa-list"></i>
                </a>
            </div>

            <!-- start -->
            <div id="content" class="col-lg-10 col-sm-11">
                <legend> <font size="20pt"><b>Welcome to Hotel365!</b><font> </legend>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="box" style="">
                            <div class="box-header">
                                <h2>
                                    <i class="fa fa-home"></i>
                                    <#if role == 1>
                                    Start your journey
                                    <#elseif role == 2>
                                    Welcome back! Receptionist!
                                    <#else>
                                    Enjoy your work! Sales Manager!
                                    </#if>
                                </h2>
                            </div>
                            <div class="box-content">
                                <img class="avatar" src="pic/main_hotel_room.jpg" alt="">
                            </div>
                        </div>
                    </div>

                    <#nested >
                </div>
            </div>
            <!-- end -->

        </div>
    </div>
    </@base.content>
</#macro>
<@content></@content>

<#macro script>
<@base.script>
<script type="text/javascript" src="js/jquery/bootstrapValidator.js"></script>
</@base.script>
<#nested >
</#macro>
<@script></@script>

</body>
</html>
