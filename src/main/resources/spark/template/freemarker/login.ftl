<!DOCTYPE html>
<html lang="zh">
<head>

    <title>Login in Hotel365</title>
    <meta name="keywords" content=""/>
    <meta name="description" content="">

    <meta name="author" content="LiuChen">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/oh.base.css" rel="stylesheet">
    <link href="css/oh.login.css" rel="stylesheet">

</head>

<body>
<div class="background_branding_container">
    <img class="background_image" alt="" src="pic/login_background.jpg" width="100%" oh-resizebgimage>
</div>
<div class="login_panel">
    <div class="login_panel_center">
        <div class="inner_container ">
            <div class="login_workload_logo_container">
                <span class="fa fa-moon-o"></span> Hotel365&reg;
            </div>
            <div class="login-box">
                <form class="form-horizontal login" action="/login" method="post">
                    <fieldset class="col-sm-12">
                        <div class="form-group">
                            <div class="controls row">
                                <div class="input-group col-sm-12">
                                    <input type="text" class="form-control" id="username" name="username"
                                           placeholder="Username or E-mail">
                                    <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="controls row">
                                <div class="input-group col-sm-12">
                                    <input type="password" class="form-control" id="password" name="password"
                                           placeholder="Password">
                                    <span class="input-group-addon"><i class="fa fa-key"></i></span>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="controls row">
                                <div class="input-group col-sm-12">
                                    <button id="login" type="submit" class="btn btn-lg btn-primary col-xs-12">Login
                                    </button>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="controls row">
                                <div class="input-group col-sm-4">
                                    <a href="/register"><span class="label label-info">Register</span></a>
                                </div>
                            </div>
                        </div>

                        <#if error??>
                            <div class="error">
                                <font size="4pt"><strong>Error:</strong> ${error}</font>
                            </div>
                        </#if>
                        <#if message??>
                            <div class="message">
                                <font size="4pt">${message}</font>
                            </div>
                        </#if>
                    </fieldset>
                </form>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript" src="js/jquery/jquery.min.js"></script>

</body>
</html>