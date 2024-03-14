<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
 <%@ page language="java" import="java.util.*" %>
 <%@page import="util.*" %>
 <%@ include file="head.jsp" %>

<link href="js/h5upload/h5upload.css" rel="stylesheet" />
<script src="js/h5upload/h5upload.js"></script>

<div style="padding: 10px" class="admin-content">
    <% Map map = Query.make("gouwuche").where("id", request.getParameter("id")).find(); %>

    <div class="admin-detail">
        <table class="table table-detail">
            <tr>
                <td width="180">商品id</td>
                <td><%= map.get("shangpinid") %></td>

                <td width="180">商品编号</td>
                <td><%= map.get("shangpinbianhao") %></td>
            </tr>
            <tr>
                <td width="180">分类</td>
                <td><% Map mapfenlei4 = new CommDAO().find("SELECT fenleiming,id FROM fenlei where id='" + map.get("fenlei") + "'"); %>
<%= mapfenlei4.get("fenleiming") %></td>

                <td width="180">商品名称</td>
                <td><%= map.get("shangpinmingcheng") %></td>
            </tr>
            <tr>
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

                <td width="180">售价</td>
                <td><%= map.get("shoujia") %></td>
            </tr>
            <tr>
                <td width="180">发布人</td>
                <td><%= map.get("faburen") %></td>

                <td width="180">购买数量</td>
                <td><%= map.get("goumaishuliang") %></td>
            </tr>
            <tr>
                <td width="180">小计</td>
                <td><%= map.get("xiaoji") %></td>

                <td width="180">购买人</td>
                <td><%= map.get("goumairen") %></td>
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

