<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
 <%@ page language="java" import="java.util.*" %>
 <%@page import="util.*" %>
 <%
String orderby = util.Request.get("order", "id"); // 获取搜索框中的排序字段、默认为发布时间
String sort = util.Request.get("sort", "desc"); // 获取搜索框中的排序类型、默认为倒序

String where = " 1=1 "; // 防止sql 搜索条件为： where and a=b 这样的错误

// 以下是检测搜索框中是否填写了或者选择了什么，则写入sql 语句中

if (request.getParameter("shangpinbianhao") != null && !"".equals(request.getParameter("shangpinbianhao"))) {
    where += " AND shangpinbianhao LIKE '%" + request.getParameter("shangpinbianhao") + "%'";
}
if (request.getParameter("fenlei") != null && !"".equals(request.getParameter("fenlei"))) {
    where += " AND fenlei ='" + request.getParameter("fenlei") + "'";
}
if (request.getParameter("shangpinmingcheng") != null && !"".equals(request.getParameter("shangpinmingcheng"))) {
    where += " AND shangpinmingcheng LIKE '%" + request.getParameter("shangpinmingcheng") + "%'";
}
if (request.getParameter("tanweihao") != null && !"".equals(request.getParameter("tanweihao"))) {
    where += " AND tanweihao LIKE '%" + request.getParameter("tanweihao") + "%'";
}
if (request.getParameter("quyu") != null && !"".equals(request.getParameter("quyu"))) {
    where += " AND quyu ='" + request.getParameter("quyu") + "'";
}
if (request.getParameter("shifoutuijian") != null && !"".equals(request.getParameter("shifoutuijian"))) {
    where += " AND shifoutuijian ='" + request.getParameter("shifoutuijian") + "'";
}

List<Map> list = Query.make("shangpin").where(where).order(orderby + " " + sort).page(15);
%>
 <%@ include file="head.jsp" %>
 <%@ include file="header.jsp" %>


<link href="js/owl/owl.carousel.min.css" rel="stylesheet" />
<script src="js/owl/owl.carousel.min.js"></script>

<div>
    <div class="container">
        <!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->

        <div class="shop-product-xz" style="background-color: #FFFFFF">
            <div style="margin-bottom: 20px">
                <form action="?" class="search" style="margin: 20px 0 0 0; background-color: #FFFFFF">
                    <table class="jd-search">
                        <tbody>
                            <tr>
                                <td class="label1">区域</td>
                                <td class="form-inline">
                                    <p class="search-radio">
                                        <input type="hidden" name="quyu" value="<%= request.getParameter("quyu") !=null ? request.getParameter("quyu") : "" %>" />
                                        <a href="javascript:;" data-value="" onclick="selectRadio(this)">全部</a>
                                        <% List<Map> mapquyu5 = new CommDAO().select("SELECT id,quyuming FROM quyu"); %>
 <% for (Map r : mapquyu5) { %>

                                        <a href="javascript:;" data-value="<%= r.get("id") %>" onclick="selectRadio(this)"><%= r.get("quyuming") %></a>
                                        <%} %>

                                    </p>
                                </td>
                            </tr>

                            <tr>
                                <td class="label1">分类</td>
                                <td class="form-inline">
                                    <p class="search-radio">
                                        <input type="hidden" name="fenlei" value="<%= request.getParameter("fenlei") !=null ? request.getParameter("fenlei") : "" %>" />
                                        <a href="javascript:;" data-value="" onclick="selectRadio(this)">全部</a>
                                        <% List<Map> mapfenlei6 = new CommDAO().select("SELECT id,fenleiming FROM fenlei"); %>
 <% for (Map r : mapfenlei6) { %>

                                        <a href="javascript:;" data-value="<%= r.get("id") %>" onclick="selectRadio(this)"><%= r.get("fenleiming") %></a>
                                        <%} %>

                                    </p>
                                </td>
                            </tr>

                            <tr>
                                <td class="label1">摊位号</td>
                                <td class="form-inline">
                                    <input type="text" class="form-control" style="width: 150px" name="tanweihao" value="<%= request.getParameter("tanweihao") !=null ? request.getParameter("tanweihao") : "" %>" placeholder="请输入关键词" />
                                    <button type="submit" class="btn btn-default">搜索</button>
                                </td>
                            </tr>

                            <tr>
                                <td class="label1">商品名称</td>
                                <td class="form-inline">
                                    <input type="text" class="form-control" style="width: 150px" name="shangpinmingcheng" value="<%= request.getParameter("shangpinmingcheng") !=null ? request.getParameter("shangpinmingcheng") : "" %>" placeholder="请输入关键词" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </form>
            </div>

            <div class="row clearfix">
                <% for (Map r : list) { %>

                <div class="col-xs-12 col-md-3 products-col">
                    <article class="single_product">
                        <figure>
                            <div class="product_thumb">
                                <a class="primary_img img-box pb100" href="shangpindetail.jsp?id=<%= r.get("id") %>">
                                    <div class="img" style="background-image: url('<%= Info.images(r.get("tupian")) %>')">
                                        <img src="<%= Info.images(r.get("tupian")) %>" alt="" />
                                    </div>
                                </a>
                            </div>
                            <figcaption class="product_content">
                                <h4 class="product_name">
                                    <a href="shangpindetail.jsp?id=<%= r.get("id") %>"> <%= r.get("shangpinmingcheng") %> </a>
                                </h4>
                                <div class="price_box">
                                    <span class="current_price">￥<%= r.get("shoujia") %></span>
                                </div>
                                <div class="add_to_cart">
                                    <a href="shangpindetail.jsp?id=<%= r.get("id") %>" title="查看详情">查看详情</a>
                                </div>
                            </figcaption>
                        </figure>
                    </article>
                </div>
                <%} %>

            </div>
            ${page.info}
        </div>

        <!-- container定宽，并剧中结束 -->
    </div>
</div>

<%@ include file="footer.jsp" %>
 <%@ include file="foot.jsp" %>

