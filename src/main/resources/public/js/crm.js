;
(function($, hotel) {

    function init(){

        function pad(num) {
            str = num.toString();
            if(str.length == 1)
                str = "0"+str;
            return str;
        }

        function getCategories(){
            categories = {"category":[]};
            date = new Date();
            year = date.getYear()-1-100;
            month = date.getMonth()+1;
            for(i=1; i<=12; i++){
                if(month >= 13){
                    month = 1;
                    year ++;
                }
                datestr = year.toString() + "." + pad(month);
                if(month == 2)
                    categories.category.push({
                    "vline": "true",
                        "lineposition": "0",
                        "color": "#6baa01",
                        "labelHAlign": "right",
                        "labelPosition": "0",
                        "label": "New Year"
                    });
                categories.category.push({"label":datestr});
                month++;
            }
            console.log(categories);
            return categories;
        }

        function getDataset(customerdata, averagedata){
            average = {"seriesname": "Average Value", "data":[]};
            customer = {"seriesname": "Customer Value", "data":[]};

            for(i=1; i<=12; i++){
                average.data.push({"value": averagedata[i-1].revenue.toString()});
                customer.data.push({"value": customerdata[i-1].revenue.toString()});
            }

            console.log([average, customer])
            return [average, customer];
        }

        var list = $('#customer_list');
        hotel.api("get", "customer_value/list", {}, function(datastring) {
            data = JSON.parse(datastring)
            list.empty().append($('#customer_list_template').tmpl(data,{
                getVIP:function(vip_level){
                    if(vip_level == 1)
                        return 'Not VIP'
                    else if (vip_level == 2)
                        return 'VIP';
                    else
                        return "Super VIP";
                }
            }));
            $('#customertable').DataTable();
            hotel.comm.removeLoading();
        });

        var crmModal = $('#crm_chart_modal').on('show.bs.modal',function(e){
            info_data = $(e.relatedTarget).parents('tr').data('tmplItem').data;
            console.log(info_data);
            hotel.api("post", "customer_value", {
                body:{id: info_data.id}
            }, function(customer_data) {
                customer_data = JSON.parse(customer_data);
                hotel.api("get", "customer_value", {}, function(average_data) {
                    average_data = JSON.parse(average_data);
                    FusionCharts.ready(function () {
                        var visitChart = new FusionCharts({
                            type: 'mssplinearea',
                            renderAt: 'chart-container',
                            width: '600',
                            height: '400',
                            dataFormat: 'json',
                            dataSource: {
                                "chart": {
                                    "caption": "Customer Value Analysis in Last Year",
                                    "subCaption": "Customer value vs Average value",
                                    "xAxisName": "Month",
                                    "yAxisName": "R M B",
                                    "captionFontSize": "14",
                                    "subcaptionFontSize": "14",
                                    "baseFontColor" : "#333333",
                                    "baseFont" : "Helvetica Neue,Arial",
                                    "subcaptionFontBold": "1",
                                    "paletteColors" : "#6baa01,#008ee4",
                                    "usePlotGradientColor": "0",
                                    "bgColor" : "#ffffff",
                                    "showBorder" : "0",
                                    "showPlotBorder": "1",
                                    "showValues": "0",
                                    "showShadow" : "1",
                                    "showAlternateHGridColor" : "0",
                                    "showCanvasBorder": "0",
                                    "showXAxisLine": "1",
                                    "xAxisLineThickness": "1",
                                    "xAxisLineColor": "#999999",
                                    "canvasBgColor" : "#ffffff",
                                    "divlineAlpha" : "100",
                                    "divlineColor" : "#999999",
                                    "divlineThickness" : "1",
                                    "divLineIsDashed" : "1",
                                    "divLineDashLen" : "1",
                                    "divLineGapLen" : "1",
                                    "legendBorderAlpha": "0",
                                    "legendShadow": "0",
                                    "toolTipColor": "#ffffff",
                                    "toolTipBorderThickness": "0",
                                    "toolTipBgColor": "#000000",
                                    "toolTipBgAlpha": "80",
                                    "toolTipBorderRadius": "2",
                                    "toolTipPadding": "5"
                                },
                                "categories": [getCategories()],
                                "dataset": getDataset(customer_data, average_data)
                            }
                        }).render();
                    });
                });
            });
        });

        var crmInfoModal = $('#crm_info_modal').on('show.bs.modal',function(e){
            info_data = $(e.relatedTarget).parents('tr').data('tmplItem').data;
            $('#info_name').val(info_data.name);
            $('#info_idcard').val(info_data.idcard);
            $('#info_gender').val(info_data.gender);
            $('#info_tel').val(info_data.tel);
            $('#info_email').val(info_data.email);
            $('#info_nationality').val(info_data.nationality);
            $('#info_birthday').val(info_data.birthday);
            $('#info_address').val(info_data.address);
            $('#info_vip_level').val(info_data.vip_level);
            $('#info_remarks').val(info_data.remarks);
        });
    }

    $(function() {
        init();
    });

})(jQuery, window.hotel);