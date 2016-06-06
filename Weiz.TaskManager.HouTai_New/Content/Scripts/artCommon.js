(function ($, window, document) {
    $(function () {
        var dialog = {
            alert: function (msg) {
                art.dialog({
                    width: 220,
                    height: 100,
                    title: 'ÌבÊ¾',
                    content: msg,
                });
            },
            confirm: function (msg, call) {
            
            },
            popShow: function () {

            }
        };

        window.artDialog = dialog;
    });
})(jQuery, window);