<!-- start: Header Menu -->

<div id="navbar" class="navbar-collapse collapse header-nav">

    <ul class="nav navbar-nav">
        <li class="active">
            <a href="">Home</a>
        </li>
        <li class="soon">
            <a href="#" data-toggle="tooltip" data-placement="top" title="coming">News</a>
        </li>
        <li class="soon">
            <a href="#" data-toggle="tooltip" data-placement="top" title="coming soon">Activities</a>
        </li>
        <li>
            <a href="#"  data-toggle="tooltip" data-placement="top" title="coming soon">Help</a>
        </li>
    </ul>

    <ul class="nav navbar-nav navbar-right">
        <!-- start: User Dropdown -->
        <#if nickname??>
            <li><a href="">Contacts</a></li>

            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="javascirpt:;">
                    <img class="avatar" src="pic/anon_user.png" alt="">
                    My Center
                    <span class="oh-caret"></span>
                </a>
                <ul class="dropdown-menu">
                    <li>
                        <a href="">
                            <i class="fa fa-star"></i> ${ nickname }
                            <br>
                            <i class="fa fa-user"></i> My Account
                        </a>
                    </li>
                    <li class="divider"></li>
                    <li><a href=""><i class="fa fa-info-circle"></i> Information</a></li>
                    <li><a href=""><i class="fa fa-plus"></i> Activities</a></li>
                    <li><a target="_blank" href=""><i class="fa fa-question-circle"></i> Help</a></li>
                    <li><a href=""><i class="fa fa-wrench"></i> Management</a></li>
                    <li><a href="/logout"><i class="fa fa-sign-out"></i> Sign Out</a></li>
                </ul>
            </li>
        <#else>
            <li><a href="">发布活动</a></li>
            <li><a href="">登录</a></li>
        </#if>
        <!-- end: User Dropdown -->
    </ul>
</div>
<!-- end: Header Menu -->