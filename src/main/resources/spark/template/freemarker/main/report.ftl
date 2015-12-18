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
                                    Order Report
                                </h2>
                            </div>

                            <div class="box-content">
                                <div id="orderlisttable">
                                    <table class="table table-bordered table-striped" id="ordertable">
                                        <thead>
                                        <tr>
                                            <th>customer id</th>
                                            <th>room type</th>
                                            <th>room id</th>
                                            <th>bookin time</th>
                                            <th>deadline</th>
                                            <th>checkin time</th>
                                            <th>checkout time</th>
                                            <th>revnue</th>
                                            <th>state</th>
                                            <th>remarks</th>
                                            <th>info</th>
                                        </tr>
                                        </thead>
                                        <tbody id="order_list">
                                        </tbody>
                                    </table>
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
    <div class="modal" id="customer_info_modal" tabindex="-1" role="dialog" aria-hidden="true" data-api="">
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

    <script id="order_list_template" type="text/x-jquery-tmpl">
        <tr>
            <td>${r'${customer_id}'}</td>
            <td>${r'${$item.getRoomType(room_type)}'}</td>
            <td>${r'${room_id}'}</td>
            <td>${r'${bookin_time}'}</td>
            <td>${r'${deadline}'}</td>
            <td>${r'${checkin_time}'}</td>
            <td>${r'${checkout_time}'}</td>
            <td>${r'${$item.getPrice(price, price_unit)}'}</td>
            <td>${r'${$item.getState(state)}'}</td>
            <td>${r'${remarks}'}</td>

            <td class="col-action">
                <a class="btn btn-info btn-sm" href="#" data-target="#customer_info_modal" data-toggle="modal">
                    <i class="fa fa-file-text"></i>
                </a>

            </td>
        </tr>

        </script>
    <script type="text/javascript" src="js/jquery/bootstrapValidator.js"></script>
    <script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="js/dataTables.bootstrap.min.js"></script>
    <script type="text/javascript" src="js/report.js"></script>
    </@base.script>
    <#nested >
</#macro>
<@script></@script>

</body>
</html>
