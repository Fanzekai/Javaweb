<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
 <%@ page language="java" import="java.util.*" %>
 <%@page import="util.*" %>
 <%  %>
 <% Map map = Query.make("gonggaoxiaoxi").where("id", request.getParameter("id")).find(); %>
<%@ include file="head.jsp" %>
 <%@ include file="header.jsp" %>


<div>
    <div class="container">
        <!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->

        <div class="news-info" style="background-color: #FFFFFF">
            <h3 class="title"><%= map.get("biaoti") %></h3>
            <div class="descount">
                <span class="title"> 添加人： <%= map.get("tianjiaren") %> </span>
                <span class="title"> 添加时间： <%= map.get("addtime") %> </span>
            </div>
            <div class="content"><%= map.get("neirong") %></div>
        </div>

        <!-- container定宽，并剧中结束 -->
    </div>
</div>

<%@ include file="footer.jsp" %>
 <%@ include file="foot.jsp" %>

