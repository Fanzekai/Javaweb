<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
 <%@ page language="java" import="java.util.*" %>
 <%@page import="util.*" %>
 <%@ include file="head.jsp" %>

<link href="js/h5upload/h5upload.css" rel="stylesheet" />
<script src="js/h5upload/h5upload.js"></script>

<div style="padding: 10px" class="admin-content">
    <% Map map = Query.make("shangpin").where("id", request.getParameter("id")).find(); %>

    <div class="admin-detail">
        <table class="table table-detail">
            <tr>
                <td width="180">商品编号</td>
                <td><%= map.get("shangpinbianhao") %></td>

                <td width="180">分类</td>
                <td><% Map mapfenlei9 = new CommDAO().find("SELECT fenleiming,id FROM fenlei where id='" + map.get("fenlei") + "'"); %>
<%= mapfenlei9.get("fenleiming") %></td>
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

                <td width="180">库存</td>
                <td><%= map.get("kucun") %></td>
            </tr>
            <tr>
                <td width="180">销量</td>
                <td><%= map.get("xiaoliang") %></td>

                <td width="180">详情</td>
                <td><%= map.get("xiangqing") %></td>
            </tr>
            <tr>
                <td width="180">摊位</td>
                <td></td>

                <td width="180">摊位号</td>
                <td><%= map.get("tanweihao") %></td>
            </tr>
            <tr>
                <td width="180">区域</td>
                <td><% Map mapquyu10 = new CommDAO().find("SELECT quyuming,id FROM quyu where id='" + map.get("quyu") + "'"); %>
<%= mapquyu10.get("quyuming") %></td>

                <td width="180">是否推荐</td>
                <td><%= map.get("shifoutuijian") %></td>
            </tr>
            <tr>
                <td width="180">发布人</td>
                <td><%= map.get("faburen") %></td>

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

