
var currentList = {};
// 显示的字段
function searchSelect(id , table , keyword , where , fields,ext , callback) {
    where = where || {};
    if(keyword && keyword != ''){
        var fs = ext && $.isArray(ext) ? fields.concat(ext) : fields;
        where[fs.join('|')] = ['like' , "%"+keyword+"%"];
    }

    var value = $('#'+id).data('value');
    //var fields = $('#'+id).data('fields');
    fields = $.isArray(fields) ? fields : fields.split(',');

    $.post( window.searchSelectUrl , {
        table:table,
        where:JSON.stringify(where)
    },function (res) {
        var sel = document.getElementById(id);
        sel.length = 1;
        sel.selectedIndex = 0;
        var values = null;
        $.each(res , function (index,obj) {
            var option = document.createElement('option');
            option.value = obj.id;
            var text = [];
            $.each(fields , function (i , o) {
                text.push(obj[o]);
            });
            if(value && value == obj.id){
                option.selected = true
                values = obj;
            }
            if(!currentList[table]){
                currentList[table] = {};
            }
            currentList[table][obj.id] = obj;
            option.text = text.join(" - ");
            sel.options.add(option);
        });
        callback && callback(res);
        if(window.layui){
            layui.use("form" , function (){
                var form = layui.form;
                form.render();
            })
        }
        if(values !== null){
            $(function () {
                setAjaxData(fields , values)
            });
        }
    },'json');
}

function setAjaxData(fields , res) {
    $.each(fields, function (i, name) {
        var tagName = $("#" + name)[0].tagName.toLocaleLowerCase();
        var type = $("#" + name).attr('type');

        if (res[name]) {
            if(tagName == 'input')
            {
                var type = $("#" + name).attr('type');
                if(type == 'checkbox'){
                    // 多选
                    $("input[name='" + name+"']:checkbox").val(res[name].split(','));
                }else{
                    $("#" + name).val(res[name]);
                }
            }else if(tagName == 'select'){

                $("#" + name).val(res[name]);
            }else{
                $("#" + name).val(res[name]);
            }
        }else if(res[name+'_id']){
            $("#" + name).val(res[name+'_id']);
        }else{
            if(tagName == 'input' && type == 'checkbox'){
                $("input[name='" + name+"']:checkbox").val([]);
            }else{
                $("#" + name).val('');
            }
        }
    });
    updateFieldText(fields)
}


function updateFieldText( fields ) {
    // 将值写入到span 中
    $.each(fields, function (i,name) {
        var input = $('#'+name);
        var tagName = input[0].tagName.toLocaleLowerCase();
        if(tagName == 'input'){
            var type = input.attr('type');
            input.next().html(input.val());
        }else if(tagName == 'select'){
            var text = input.find('option:selected').text();
            input.next().html(text);
        }
    })
}

function getAjaxData( table, sel , destId ) {
    var tab = $(sel);
    var fields = tab.data('fields');

    fields = $.isArray(fields) ? fields : fields.split(",")
    if (!destId || destId == "") {
        setAjaxData(fields , {});
        return;
    }

    var data = currentList[table][destId];
    setAjaxData(fields , data || {});
}


function setFieldData(fields , res) {
    fields = $.isArray(fields) ? fields : fields.split(",")
    $.each(fields, function (i, name) {
        if (res[name]) {
            $("#" + name).val(res[name]);
        }
    });
}

$(function () {
    $('.select-update').hide().after('<span class="showData"></span>');
});


