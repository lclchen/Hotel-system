;
(function($, hotel) {

    function getCategory(data) {
        total = data.room_single + data.room_double + data.room_triple + data.food_chinese + data.food_western +
                data.food_buffet + data.agency_ticket + data.agency_airline + data.agency_railway +
                data.agency_car_rental + data.other_park + data.other_gym + data.other_natatorium;

        function formatInt(num) {
            return (num/1000).toFixed(2) + "";
        }

        result = {"category": [
            {
                "label": "Total Income",
                "color": "#ffffff",
                "value": formatInt(total),
                "category": [
                    {
                        "label": "Room",
                        "color": "#f8bd19",
                        "value": formatInt(data.room_single + data.room_double + data.room_triple),
                        "category": [
                            {
                                "label": "Single",
                                "color": "#f8bd19",
                                "value": formatInt(data.room_single)
                            },
                            {
                                "label": "Double",
                                "color": "#f8bd19",
                                "value": formatInt(data.room_double)
                            },
                            {
                                "label": "Trigle",
                                "color": "#f8bd19",
                                "value": formatInt(data.room_triple)
                            }
                        ]
                    },
                    {
                        "label": "Foods",
                        "color": "#e44a00",
                        "value": formatInt(data.food_buffet + data.food_chinese + data.food_western),
                        "category": [
                            {
                                "label": "Chinese",
                                "color": "#e44a00",
                                "value": formatInt(data.food_chinese)
                            },
                            {
                                "label": "Western",
                                "color": "#e44a00",
                                "value": formatInt(data.food_western)
                            },
                            {
                                "label": "Buffet",
                                "color": "#e44a00",
                                "value": formatInt(data.food_buffet)
                            }
                        ]
                    },
                    {
                        "label": "Agency",
                        "color": "#008ee4",
                        "value": formatInt(data.agency_airline + data.agency_car_rental + data.agency_railway + data.agency_ticket),
                        "category": [
                            {
                                "label": "Airline",
                                "color": "#008ee4",
                                "value": formatInt(data.agency_airline)
                            },
                            {
                                "label": "Railway",
                                "color": "#008ee4",
                                "value": formatInt(data.agency_railway)
                            },
                            {
                                "label": "Ticket",
                                "color": "#008ee4",
                                "value": formatInt(data.agency_ticket)
                            },
                            {
                                "label": "Car Rental",
                                "color": "#008ee4",
                                "value": formatInt(data.agency_car_rental)
                            }
                        ]
                    },
                    {
                        "label": "Other",
                        "color": "#33bdda",
                        "value": formatInt(data.other_natatorium + data.other_gym + data.other_park),
                        "category": [
                            {
                                "label": "Natatorium",
                                "color": "#33bdda",
                                "value": formatInt(data.other_natatorium)
                            },
                            {
                                "label": "Gym",
                                "color": "#33bdda",
                                "value": formatInt(data.other_gym)
                            },
                            {
                                "label": "Park",
                                "color": "#33bdda",
                                "value": formatInt(data.other_park)
                            }
                        ]
                    }
                ]
            }
        ]}
        return result.category;
    }

    function getCategories() {
        function pad(num) {
            str = num.toString();
            if(str.length == 1)
                str = "0"+str;
            return str;
        }

        result = {categories:[{
            "category": []
        }]};
        date = new Date();
        year = date.getYear()-1-100;
        month = date.getMonth()+1;
        for(i=1; i<=12; i++){
            if(month >= 13){
                month = 1;
                year ++;
            }
            datestr = year.toString() + "." + pad(month);
            result.categories[0].category.push({"label": datestr});
            month++;
        }
        console.log(result.categories);
        return result.categories;
    }

    function getDataset(data){
        console.log(data);
        result = {"dataset": []};
        revenue = {
            "seriesName": "Revenues",
            "data": []
        };
        price = {
            "seriesName": "Average Price(×100)",
            "renderAs": "area",
            "showValues": "0",
            "data": []
        };
        occupancy = {
            "seriesName": "Occupancy Rate %",
            "parentYAxis": "S",
            "renderAs": "line",
            "showValues": "0",
            "data": []
        };
        for(i=1; i<=12; i++){
            revenue.data.push({
                "value": data[i-1].revenue
            });
            price.data.push({
                "value": data[i-1].average_price*100
            });
            occupancy.data.push({
                "value": data[i-1].occupancy_rate/100
            });

        }
        result.dataset.push(revenue);
        result.dataset.push(occupancy);
        result.dataset.push(price);
        console.log(result.dataset)
        return result.dataset;
    }

    function init(){
        hotel.api("get", "income_report", {
            query: {year: (new Date()).getYear() + 1900 - 1}
        }, function(datastr) {
            data = JSON.parse(datastr);
            hotel.api("get", "room_report", {
                query: {year: (new Date()).getYear() + 1900 - 1, month:(new Date()).getMonth() + 1}
            }, function(data2str) {
                data2 = JSON.parse(data2str);
                console.log("data2:");
                console.log(data2);
                FusionCharts.ready(function () {
                    var topProductsChart = new FusionCharts({
                        type: 'multilevelpie',
                        renderAt: 'pie-chart',
                        id: "myChart",
                        width: '550',
                        height: '550',
                        dataFormat: 'json',
                        dataSource: {
                            "chart": {
                                "caption": "Split of Top Income",
                                "subCaption": "Last Year",
                                "captionFontSize": "14",
                                "subcaptionFontSize": "14",
                                "baseFontColor": "#333333",
                                "baseFont": "Helvetica Neue,Arial",
                                "basefontsize": "9",
                                "subcaptionFontBold": "0",
                                "bgColor": "#ffffff",
                                "canvasBgColor": "#ffffff",
                                "showBorder": "0",
                                "showShadow": "0",
                                "showCanvasBorder": "0",
                                "pieFillAlpha": "60",
                                "pieBorderThickness": "2",
                                "hoverFillColor": "#cccccc",
                                "pieBorderColor": "#ffffff",
                                "useHoverColor": "1",
                                "showValuesInTooltip": "1",
                                "showPercentInTooltip": "0",
                                "numberPrefix": "¥",
                                "plotTooltext": "$label, $valueK, $percentValue"
                            },
                            "category": getCategory(data)
                        }
                    });
                    topProductsChart.render();

                    var revenueChart = new FusionCharts({
                        type: 'mscombidy2d',
                        renderAt: 'chart-container',
                        width: '600',
                        height: '350',
                        dataFormat: 'json',
                        dataSource: {
                            "chart": {
                                "caption": "Revenues, Average Price and Occupancy Rate",
                                "subCaption": "Double-Room In last year",
                                "xAxisname": "Month",
                                "pYAxisName": "Amount (In R M B)",
                                "sYAxisName": "Occupancy Rate %",
                                "numberPrefix": "¥",
                                "sNumberSuffix": "%",
                                "sYAxisMaxValue": "50",
                                "numDivLines": "3",
                                "theme": "fint"
                            },
                            "categories": getCategories(),
                            "dataset": getDataset(data2),
                        }
                    });
                    revenueChart.render();
                });
            });
        });
        hotel.comm.removeLoading();
    }

    $(function() {
        init();
    });

})(jQuery, window.hotel);
