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
    Map<Integer, String> areasData = CommDAO.sumXiaoliangByFenlei1();
    %>
        <script>
            var data = [];
            <%
                for (Map.Entry<Integer, String> entry : areasData.entrySet()) {
            %>
            data.push({
                value: <%= entry.getKey() %>,
                name: '<%= entry.getValue() %>'
            });
            <%
                }
            %>
        </script>

<div id="main" style="width: 90%;height:600px"></div>
<script type="text/javascript">

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
                data: data
            }
        ]
    };
    myChart.setOption(option);
</script>
    </div>
<%@ include file="foot.jsp" %>

