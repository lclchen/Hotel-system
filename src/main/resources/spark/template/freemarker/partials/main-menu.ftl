<ul class="nav main-menu">
<#if role == 1>
    <!--------------------------------     Customer      ---------------------------------->
    <li>
        <a href="">
            <i class="fa fa-search"></i>
            <span class="hidden-sm text"> Search Info</span>
        </a>
    </li>
    <li>
        <a href="">
            <i class="fa fa-clock-o"></i>
            <span class="hidden-sm text"> Reservation</span>
        </a>
    </li>
    <li>
        <a href="">
            <i class="fa fa-th-list"></i>
            <span class="hidden-sm text"> My Order</span>
        </a>
    </li>
    <li>
        <a href="">
            <i class="fa fa-phone-square"></i>
            <span class="hidden-sm text"> Messages</span>
        </a>
    </li>

    <!--------------------------------     Receptionist       ---------------------------------->
<#elseif role == 2>
    <li>
        <a href="">
            <i class="fa fa-check-square-o"></i>
            <span class="hidden-sm text"> Check-In</span>
        </a>
    </li>
    <li>
        <a href="">
            <i class="fa fa-share-square-o"></i>
            <span class="hidden-sm text"> Check-Out</span>
        </a>
    </li>

    <li>
        <a href="">
            <i class="fa fa-home"></i>
            <span class="hidden-sm text"> Room management</span>
        </a>
    </li>

    <li>
        <a href="">
            <i class="fa fa-user"></i>
            <span class="hidden-sm text"> Customer Info</span>
        </a>
    </li>

    <li>
        <a href="">
            <i class="fa fa-briefcase"></i>
            <span class="hidden-sm text"> Conference Room</span>
        </a>
    </li>

    <li>
        <a href="">
            <i class="fa fa-files-o"></i>
            <span class="hidden-sm text"> My Tasks</span>
        </a>
    </li>

    <li>
        <a href="">
            <i class="fa fa-phone-square"></i>
            <span class="hidden-sm text"> Messages</span>
        </a>
    </li>

    <li>
        <a href="">
        <i class="fa fa-envelope-o"></i>
        <span class="hidden-sm text"> Email</span>
    </a>
</li>

    <!--------------------------------     Sales Manager       ---------------------------------->
<#else>
    <li>
        <a class="dropmenu" href="">
            <i class="fa fa-sitemap"></i>
            <span class="hidden-sm text">Management</span>
            <span class="chevron closed"></span>
        </a>
        <ul>
            <li>
                <a href="">
                    <i class="fa fa-money"></i>
                    <span class="hidden-sm text">Finance</span>
                </a>
            </li>
            <li>
                <a href="/crm">
                    <i class="fa  fa-user"></i>
                    <span class="hidden-sm text">Customer CRM</span>
                </a>
            </li>
            <li>
                <a href="">
                    <i class="fa fa-usd"></i>
                    <span class="hidden-sm text">Pricing</span>
                </a>
            </li>
            <li>
                <a href="">
                    <i class="fa fa-users"></i>
                    <span class="hidden-sm text"> Human Resource</span>
                </a>
            </li>
        </ul>
    </li>

    <li>
        <a href="">
            <i class="fa fa-files-o"></i>
            <span class="hidden-sm text"> Task Allocation</span>
        </a>
    </li>

    <li>
        <a href="/report">
            <i class="fa fa-bar-chart"></i>
            <span class="hidden-sm text"> Order Report</span>
        </a>
    </li>

    <li>
        <a href="/analysis">
            <i class="fa fa-star"></i>
            <span class="hidden-sm text"> Recommandation</span>
        </a>
    </li>

    <li>
        <a href="">
            <i class="fa fa-phone-square"></i>
            <span class="hidden-sm text"> Messages</span>
        </a>
    </li>

    <li>
        <a href="">
        <i class="fa fa-envelope-o"></i>
        <span class="hidden-sm text"> Email</span>
    </a>
</#if>
</ul>
