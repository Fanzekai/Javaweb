<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
 <%@ page language="java" import="java.util.*" %>
 <%@page import="util.*" %>
 <%@ include file="head.jsp" %>


<div style="padding: 10px" class="admin-content">
    <% Map map = Query.make("dingdanxinxi").where("id", request.getParameter("id")).find(); %>

    <div class="admin-detail">
        <table class="table table-detail">
            <tr>
                <td width="180">订单编号</td>
                <td><%= map.get("dingdanbianhao") %></td>

                <td width="180">商品</td>
                <td>
                    <% List<Map> shangpinList = Query.make("dingdanxinxishangpin").where("dingdanxinxiid", map.get("id")).order("id desc").select(); %>
<mk-table>
                        <thead>
                            <tr>
                                <td>商品编号</td>
                                <td>分类</td>
                                <td>商品名称</td>
                                <td>图片</td>
                                <td>售价</td>
                                <td>发布人</td>
                                <td>购买数量</td>
                                <td>小计</td>
                                <td>购买人</td>
                            </tr>
                        </thead>
                        <tbody>
                            <% for (Map r : shangpinList) { %>

                            <tr>
                                <td><%= r.get("shangpinbianhao") %></td>
                                <td><% Map mapfenlei4 = new CommDAO().find("SELECT fenleiming,id FROM fenlei where id='" + r.get("fenlei") + "'"); %>
<%= mapfenlei4.get("fenleiming") %></td>
                                <td><%= r.get("shangpinmingcheng") %></td>
                                <td><% if ("".equals(r.get("tupian"))) { %>
-<%} else { %><img width="100" src="<%= Info.images(r.get("tupian")) %>" /><%} %>
</td>
                                <td><%= r.get("shoujia") %></td>
                                <td><%= r.get("faburen") %></td>
                                <td><%= r.get("goumaishuliang") %></td>
                                <td><%= r.get("xiaoji") %></td>
                                <td><%= r.get("goumairen") %></td>
                            </tr>
                            <%} %>

                        </tbody>
                    </mk-table>
                </td>
            </tr>
            <tr>
                <td width="180">订单金额</td>
                <td><%= map.get("shangpinjine") %></td>

                <td width="180">收货人</td>
                <td><%= map.get("shouhuoren") %></td>
            </tr>
            <tr>
                <td width="180">联系电话</td>
                <td><%= map.get("lianxidianhua") %></td>

                <td width="180">订单状态</td>
                <td><%= map.get("dingdanzhuangtai") %></td>
            </tr>
            <tr>
                <td width="180">备注</td>
                <td><%= map.get("beizhu") %></td>

                <td width="180">下单人</td>
                <td><%= map.get("xiadanren") %></td>
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

