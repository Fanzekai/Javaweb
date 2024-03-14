<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
 <%@ page language="java" import="java.util.*" %>
 <%@page import="util.*" %>
 <%@ include file="head.jsp" %>


<div style="padding: 10px" class="admin-content">
    <% Map map = Query.make("tanwei").where("id", request.getParameter("id")).find(); %>

    <div class="admin-detail">
        <table class="table table-detail">
            <tr>
                <td width="180">摊位号</td>
                <td><%= map.get("tanweihao") %></td>

                <td width="180">区域</td>
                <td><% Map mapquyu31 = new CommDAO().find("SELECT quyuming,id FROM quyu where id='" + map.get("quyu") + "'"); %>
<%= mapquyu31.get("quyuming") %></td>
            </tr>
            <tr>
                <td width="180">图片</td>
                <td><img src="<%= map.get("tupian") %>" style="width: 350px" /></td>

                <td width="180">位置</td>
                <td><%= map.get("weizhi") %></td>
            </tr>
            <tr>
                <td width="180">摊位大小</td>
                <td><%= map.get("tanweidaxiao") %></td>

                <td width="180">经营产品</td>
                <td><%= map.get("jingyingchanpin") %></td>
            </tr>
            <tr></tr>
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

