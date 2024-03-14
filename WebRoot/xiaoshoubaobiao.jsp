<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="head.jsp" %>
<script src="js/echarts.js" charset="UTF-8"></script>
<script src="js/customed.js"></script>


    <div class="panel panel-default">
        <div class="panel-heading">市场销售情况:</div>
<%
 if (request.getSession().getAttribute("username") == null || "".equals(request.getSession().getAttribute("username"))) { %>
<script>
    alert("对不起,请您先登陆!");
    location.href = "index.jsp";
</script>
<%
        return;
} %>

<%
    int i1 = CommDAO.sumXiaoliangByFenlei("1");
    int i2 = CommDAO.sumXiaoliangByFenlei("2");
    int i3 = CommDAO.sumXiaoliangByFenlei("3");
    int i4 = CommDAO.sumXiaoliangByFenlei("4");
%>

<div id="main" style="width: 90%;height:600px"></div>
<script type="text/javascript">
    var i1 = <%= i1 %>;
    var i2 = <%= i2 %>;
    var i3 = <%= i3 %>;
    var i4 = <%= i4 %>;
    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('main'));
    window.addEventListener('resize', function() {
        myChart.resize();
    });


// 指定图表的配置项和数据
    option = {
        legend: {
            top: 'bottom'
        },
        toolbox: {
            show: true,
            feature: {
                mark: { show: true },
                dataView: { show: true, readOnly: false },
                restore: { show: true },
                saveAsImage: { show: true }
            }
        },
        series: [
            {
                name: 'Nightingale Chart',
                type: 'pie',
                radius: [50, 250],
                center: ['50%', '50%'],
                roseType: 'area',
                itemStyle: {
                    borderRadius: 8
                },
                data: [
                    { value: i1, name: '水果区域' },
                    { value: i2, name: '蔬菜区域' },
                    { value: i3, name: '海鲜区域' },
                    { value: i4, name: '肉类区域' },
                ]
            }
        ]
    };
    myChart.setOption(option);

</script>
    </div>



<%@ include file="foot.jsp" %>

