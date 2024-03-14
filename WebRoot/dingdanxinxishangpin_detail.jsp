<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
 <%@ page language="java" import="java.util.*" %>
 <%@page import="util.*" %>
 <%@ include file="head.jsp" %>

<link href="js/h5upload/h5upload.css" rel="stylesheet" />
<script src="js/h5upload/h5upload.js"></script>

<div style="padding: 10px" class="admin-content">
    <% Map map = Query.make("dingdanxinxishangpin").where("id", request.getParameter("id")).find(); %>

    <div class="admin-detail">
        <table class="table table-detail">
            <tr>
                <td width="180">订单信息id</td>
                <td><% Map mapdingdanxinxi46 = new CommDAO().find("SELECT ,id FROM dingdanxinxi where id='" + map.get("dingdanxinxiid") + "'"); %>
<%= mapdingdanxinxi46.get("") %></td>

                <td width="180">商品id</td>
                <td><% Map mapshangpin47 = new CommDAO().find("SELECT ,id FROM shangpin where id='" + map.get("shangpinid") + "'"); %>
<%= mapshangpin47.get("") %></td>
            </tr>
            <tr>
                <td width="180">商品编号</td>
                <td><%= map.get("shangpinbianhao") %></td>

                <td width="180">分类</td>
                <td><% Map mapfenlei48 = new CommDAO().find("SELECT fenleiming,id FROM fenlei where id='" + map.get("fenlei") + "'"); %>
<%= mapfenlei48.get("fenleiming") %></td>
            </tr>
            <tr>
                <td width="180">商品名称</td>
                <td><%= map.get("shangpinmingcheng") %></td>

                <td width="180">图片</td>
                <td>
                    <fieldset class="images_box">
                        <div id="gellay_images" class="imagesList">
                            <script>
                                var images = "<%= map.get("tupian") %>".split(",");
                                for (var i = 0; i < images.length; i++) {
                                    var image = images[i];
                                    var uploadImage = '<div class="uploadImage">' + '<span class="thumb thumbnail"><img src="' + image + '"/></span>' + "</div>";
                                    document.writeln(uploadImage);
                                }
                            </script>
                        </div>
                    </fieldset>
                </td>
            </tr>
            <tr>
                <td width="180">售价</td>
                <td><%= map.get("shoujia") %></td>

                <td width="180">发布人</td>
                <td><%= map.get("faburen") %></td>
            </tr>
            <tr>
                <td width="180">购买数量</td>
                <td><%= map.get("goumaishuliang") %></td>

                <td width="180">小计</td>
                <td><%= map.get("xiaoji") %></td>
            </tr>
            <tr>
                <td width="180">购买人</td>
                <td><%= map.get("goumairen") %></td>

                <td width="180">添加时间</td>
                <td><%= map.get("addtime") %></td>
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

