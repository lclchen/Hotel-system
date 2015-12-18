;
(function($, hotel) {

    function init(){

        var list = $('#order_list');
        hotel.api("get", "order/list", {}, function(datastring) {
            data = JSON.parse(datastring)
            list.empty().append($('#order_list_template').tmpl(data,{
                getRoomType:function(room_type) {
                    if(room_type == 1)
                        return "Single";
                    else if (room_type == 2)
                        return "Double";
                    else
                        return "Triple";
                },
                getPrice:function(price, price_unit) {
                    return price.toString() + price_unit;
                },
                getState:function(state) {
                    if(state == 1)
                        return "Not livein";
                    else if(state==2)
                        return "Living";
                    else if (state==3)
                        return "Finished";
                    else if (state==4)
                        return "Cancel";
                    else
                        return "Overdue";
                }
            }));
            $('#ordertable').DataTable();
            hotel.comm.removeLoading();
        });

        var customerInfoModal = $('#customer_info_modal').on('show.bs.modal',function(e){
            hotel.api("get", "customer", {
                query:{id: $(e.relatedTarget).parents('tr').data('tmplItem').data.customer_id}
            }, function(datastring) {
                console.log(datastring);
                info_data = JSON.parse(datastring);
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
        });
    }

    $(function() {
        init();
    });

})(jQuery, window.hotel);