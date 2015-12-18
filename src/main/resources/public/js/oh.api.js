;
(function($, w) {
    var SERVER_IP = "http://localhost/api/";
    w.hotel.api = function sendRestfulRequest(method, api_url, options, callback) {
        var _params = {
            query: {},
            body: {},
            header: {},
        };
        callback = callback || new Function();
        if ($.isFunction(options)) {
            callback = options;
            options = {};
        }
        options = $.extend(_params, options);
        var url = SERVER_IP + api_url;
        var data = $.isEmptyObject(options.body) ? '{}':JSON.stringify(options.body);
        if (!$.isEmptyObject(options.query)) {
            url += '?'+$.param(options.query);
        }
        //options.header.token = $.cookie('token');
        return $.ajax({
            method: method,
            url: url,
            contentType: method == 'get' ? 'application/x-www-form-urlencoded' : 'application/json',
            headers: options.header,
            data: data,
            success: function(data) {
                if(data.error){
                    if(data.error.code == 401){
                        console.log(data)
                        location.href = '/logout';
                    }else {
                        callback(data)
                    }
                }else{
                    callback(data)
                }
            },
            error: function(req, status, error) {
                var data = {
                    error : {
                        error: error ,
                        message: req.responseText,
                        status: req.status
                    }
                };
                callback(data);
            }
        });
    }
   w.hotel = w.hotel || {};

})(jQuery, window);