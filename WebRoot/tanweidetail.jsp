<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.util.*" %>
<%@page import="util.*" %>
<% %>
<% Map map = Query.make("tanwei").where("id", request.getParameter("id")).find(); %>
<%@ include file="head.jsp" %>
<%@ include file="header.jsp" %>

<link rel="stylesheet" href="js/swiper/swiper.css"/>
<script src="js/swiper/swiper.js"></script>
<script src="js/jquery.validate.js"></script>
<link href="js/owl/owl.carousel.min.css" rel="stylesheet"/>
<script src="js/owl/owl.carousel.min.js"></script>

<div>
    <div class="container">
        <!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->

        <div class="" style="margin: 20px 0 0 0; background-color: #FFFFFF">
            <div class="goods-info clearfix">
                <div class="gallery-list">
                    <div class="swiper-container gallery-top" id="shangpin-galler">
                        <div class="swiper-wrapper"></div>
                    </div>
<%--                    <div class="swiper-container gallery-thumbs" id="shangpin-thumb">--%>
<%--                        <div class="swiper-wrapper"></div>--%>
<%--                    </div>--%>
                </div>
                <div class="goods-right-content">
                    <h3 class="title"><%= map.get("tanweihao") %>
                    </h3>

                    <div class="descount" style="line-height: 30px">
                        <div>
                            <span class="name"> 区域： </span>
                            <span class="val"> <% Map mapquyu32 = new CommDAO().find("SELECT quyuming,id FROM quyu where id='" + map.get("quyu") + "'"); %>
<%= mapquyu32.get("quyuming") %> </span>
                        </div>
                        <div>
                            <span class="name"> 位置： </span>
                            <span class="val"> <%= map.get("weizhi") %> </span>
                        </div>
                        <div>
                            <span class="name"> 摊位大小： </span>
                            <span class="val"> <%= map.get("tanweidaxiao") %> </span>
                        </div>
                        <div>
                            <span class="name"> 经营产品： </span>
                            <span class="val"> <%= map.get("jingyingchanpin") %> </span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="goods-content"></div>

            <script>
                (function () {
                    var images = "<%= map.get("tupian") %>".split(",");
                    if (images.length > 0) {
                        for (var i = 0; i < images.length; i++) {
                            var path = images[i];
                            var src = '<div class="swiper-slide"><div class="img-box pb100"><div class="img" style="background-image: url(' + path + ')"></div></div></div>';
                            $("#shangpin-galler .swiper-wrapper").append(src);
                            $("#shangpin-thumb .swiper-wrapper").append(src);
                        }

                        var thumbsSwiper = new Swiper("#shangpin-thumb", {
                            spaceBetween: 10,
                            slidesPerView: 4,
                            watchSlidesVisibility: true, //防止不可点击
                        });
                        var gallerySwiper = new Swiper("#shangpin-galler", {
                            spaceBetween: 10,
                            thumbs: {
                                swiper: thumbsSwiper,
                            },
                        });
                    }
                })();
            </script>
        </div>

        <!-- container定宽，并剧中结束 -->
    </div>
</div>

<div>
    <div class="container">
        <!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->

        <div class="title-modelbox-widget">
            <h3 class="section-title">摊位商品</h3>
            <div class="sidebar-widget-body">
                <div class="shop-product-xz" style="background-color: #FFFFFF">
                    <% List<Map> shangpinlist26 = Query.make("shangpin").where("tanweihao", map.get("tanweihao")).limit(8).order("id desc").select(); %>

                    <div class="row clearfix">
                        <% for (Map r : shangpinlist26) { %>

                        <div class="col-xs-12 col-md-3 products-col">
                            <article class="single_product">
                                <figure>
                                    <div class="product_thumb">
                                        <a class="primary_img img-box pb100"
                                           href="shangpindetail.jsp?id=<%= r.get("id") %>">
                                            <div class="img"
                                                 style="background-image: url('<%= Info.images(r.get("tupian")) %>')">
                                                <img src="<%= Info.images(r.get("tupian")) %>" alt=""/>
                                            </div>
                                        </a>
                                    </div>
                                    <figcaption class="product_content">
                                        <h4 class="product_name">
                                            <a href="shangpindetail.jsp?id=<%= r.get("id") %>"><%= r.get("shangpinmingcheng") %>
                                            </a>
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
                </div>
            </div>
            <!-- /.sidebar-widget-body -->
        </div>

        <!-- container定宽，并剧中结束 -->
    </div>
</div>

<%@ include file="footer.jsp" %>
<%@ include file="foot.jsp" %>

