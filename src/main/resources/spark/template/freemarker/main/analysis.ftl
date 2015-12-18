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
                <legend>Hotel365 !</legend>
                <div class="row">
                    <div class="col-lg-12" loading>
                        <div class="box">
                            <div class="box-header">
                                <h2>
                                    <i class="fa fa-home"></i>
                                    Analysis and Recommandation
                                </h2>
                            </div>

                            <div class="jumbotron">
                                <div class="container">
                                    <b><font size="15pt">Last Year Income</font></b>

                                    <p>1. The income of each part is shown in the below pie chart!</p>
                                    <p>
                                        <div id="pie-chart">Loading, please wait.</div>
                                    </p>

                                    <br/><br/><br/>
                                    <p>2. The double-room's price and occupancy rate in last year.</p>
                                    <p>
                                        <div id="chart-container">Loading, please wait.</div>
                                    </p>


                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- end -->

        </div>
    </div>
    </@base.content>
    <#nested >
</#macro>
<@content></@content>

<#macro script>
    <@base.script>
    <div class="modal fade bs-example-modal-sm" id="crm_chart_modal" tabindex="-1" role="dialog"
         aria-labelledby="mySmallModalLabel" aria-hidden="true" data-api="">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div id="chart-container">Loading Data, Please Wait.</div>
            </div>
        </div>
    </div>

    <div class="modal" id="crm_info_modal" tabindex="-1" role="dialog"
         aria-hidden="true" data-api="">
        <div class="modal-dialog modal-sm col-md-14">
            <div class="modal-content col-md-14">
                <div class="modal-header col-md-14">
                    <b>Customer Information</b>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" id="customer_info_form" style="">
                        <div class="form-group has-feedback">
                            <label class="col-md-5 control-label">Name:</label>
                            <div class="col-md-7">
                                <input type="text" class="form-control" id="info_name" value=""
                                       data-bv-trigger="blur" readonly>
                            </div>

                            <label class="col-md-5 control-label">ID card:</label>
                            <div class="col-md-7">
                                <input type="text" class="form-control" id="info_idcard" value=""
                                       data-bv-trigger="blur" readonly>
                            </div>

                            <label class="col-md-5 control-label">Gender:</label>
                            <div class="col-md-7">
                                <input type="text" class="form-control" id="info_gender" value=""
                                       data-bv-trigger="blur" readonly>
                            </div>

                            <label class="col-md-5 control-label">Telephone:</label>
                            <div class="col-md-7">
                                <input type="text" class="form-control" id="info_tel" value=""
                                       data-bv-trigger="blur" readonly>
                            </div>

                            <label class="col-md-5 control-label">Email:</label>
                            <div class="col-md-7">
                                <input type="text" class="form-control" id="info_email" value=""
                                       data-bv-trigger="blur" readonly>
                            </div>

                            <label class="col-md-5 control-label">Nationality:</label>
                            <div class="col-md-7">
                                <input type="text" class="form-control" id="info_nationality" value=""
                                       data-bv-trigger="blur" readonly>
                            </div>

                            <label class="col-md-5 control-label">Birthday:</label>
                            <div class="col-md-7">
                                <input type="text" class="form-control" id="info_birthday" value=""
                                       data-bv-trigger="blur" readonly>
                            </div>

                            <label class="col-md-5 control-label">Address:</label>
                            <div class="col-md-7">
                                <input type="text" class="form-control" id="info_address" value=""
                                       data-bv-trigger="blur" readonly>
                            </div>

                            <label class="col-md-5 control-label">VIP Level:</label>
                            <div class="col-md-7">
                                <input type="text" class="form-control" id="info_vip_level" value=""
                                       data-bv-trigger="blur" readonly>
                            </div>

                            <label class="col-md-5 control-label">Remarks:</label>
                            <div class="col-md-7">
                                <input type="text" class="form-control" id="info_remarks" value=""
                                       data-bv-trigger="blur" readonly>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script id="customer_list_template" type="text/x-jquery-tmpl">
        <tr>
            <td>${r'${name}'}</td>
            <td>${r'${gender}'}</td>
            <td>${r'${tel}'}</td>
            <td>${r'${email}'}</td>
            <td>${r'${birthday}'}</td>
            <td>${r'${$item.getVIP(vip_level)}'}</td>
            <td>${r'${remarks}'}</td>
            <td>${r'${revenue}'}</td>
            <td>${r'${default_amount}'}</td>
            <td>${r'${default_times}'}</td>

            <td class="col-action">
                <a class="btn btn-info btn-sm" href="#" data-target="#crm_chart_modal" data-toggle="modal">
                    <i class="fa fa-bar-chart "></i>
                </a>
                <a class="btn btn-info btn-sm" href="#" data-target="#crm_info_modal" data-toggle="modal">
                    <i class="fa fa-file-text"></i>
                </a>
            </td>
        </tr>

        </script>
    <script type="text/javascript" src="js/jquery/bootstrapValidator.js"></script>
    <script type="text/javascript" src="js/fusioncharts.js"></script>
    <script type="text/javascript" src="js/fusioncharts.powercharts.js"></script>
    <script type="text/javascript" src="js/fusioncharts.charts.js"></script>
    <script type="text/javascript" src="js/themes/fusioncharts.theme.fint.js"></script>
    <script type="text/javascript" src="js/analysis.js"></script>
    </@base.script>
    <#nested >
</#macro>
<@script></@script>

</body>
</html>
