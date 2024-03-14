(function(){
(function () {
    function selectRadio(obj) {
        var form = $(obj).parents('form');
        var div = $(obj).parent();
        div.find('input').val($(obj).attr('data-value'));
        var isSeach = false;
        $('.search-radio-tree').each(function (i) {
            if(isSeach){
                $(this).remove();
            }
            if(this == div[0])
            {
                isSeach=true
            }
        });
        form.submit();
    }
    window.selectRadio = selectRadio;
    $('.search-radio').each(function () {

        var val = $(this).find('input').val();
        $(this).find('a[data-value="'+val+'"]').addClass('active');

    })
})();

})();