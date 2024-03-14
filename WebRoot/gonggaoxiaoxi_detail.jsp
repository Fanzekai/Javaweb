<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
 <%@ page language="java" import="java.util.*" %>
 <%@page import="util.*" %>
 <%@ include file="head.jsp" %>


<div style="padding: 10px" class="admin-content">
    <% Map map = Query.make("gonggaoxiaoxi").where("id", request.getParameter("id")).find(); %>

    <div class="admin-detail">
        <table class="table table-detail">
            <tr>
                <td width="180">标题</td>
                <td><%= map.get("biaoti") %></td>

                <td width="180">图片</td>
                <td><img src="<%= map.get("tupian") %>" style="width: 350px" /></td>
            </tr>
            <tr>
                <td width="180">内容</td>
                <td><%= map.get("neirong") %></td>

                <td width="180">添加人</td>
                <td><%= map.get("tianjiaren") %></td>
            </tr>
            <tr>
                <td width="180">添加时间</td>
                <td><%= map.get("addtime") %></td>
            </tr>
        </table>
    </div>

    <div class="button-list">
        <div class="">
            <button onclick="history.go(-1);" style="background: #07de19; border: 1px solid #9a9a9a; border-top-width: 2px; border-left: 2px">返回</button>
            <button onclick="window.print()" style="background: #4961de; border: 1px solid #9a9a9a; border-top-width: 2px; border-left: 2px">打印本页</button>
        </div>
    </div>
</div>
<%@ include file="foot.jsp" %>

