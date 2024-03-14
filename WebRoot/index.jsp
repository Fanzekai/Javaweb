<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
 <%@ page language="java" import="java.util.*" %>
 <%@page import="util.*" %>
 <%@ include file="head.jsp" %>
 <%@ include file="header.jsp" %>


<link rel="stylesheet" href="js/swiper/swiper.css" />
<script src="js/swiper/swiper.js"></script>
<link href="js/owl/owl.carousel.min.css" rel="stylesheet" />
<script src="js/owl/owl.carousel.min.js"></script>


<div>
    <div class="container" style="margin-top: 20px">
        <!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->

        <div class="row">

            <div class="col-sm-4 col-md-4">
                <div class="title-modelbox-widget">
                    <h3 class="section-title">公告消息</h3>
                    <div class="sidebar-widget-body">
                        <div class="" style="background-color: #FFFFFF">
                            <% List<Map> gonggaoxiaoxilist31 = Query.make("gonggaoxiaoxi").limit(3).order("id desc").select(); %>

                            <div class="news-list">
                                <ul>
                                    <% for (Map r : gonggaoxiaoxilist31) { %>

                                    <li class="clearfix">
                                        <a href="gonggaoxiaoxidetail.jsp?id=<%= r.get("id") %>">
                                            <div class="thumb">
                                                <div class="img-box pb90">
                                                    <div class="img" style="background-image: url('<%= r.get("tupian") %>')"></div>
                                                </div>
                                            </div>
                                        </a>

                                        <div class="news-content-text">
                                            <a href="gonggaoxiaoxidetail.jsp?id=<%= r.get("id") %>">
                                                <h3><%= r.get("biaoti") %></h3>
                                            </a>
                                            <div class="description"><%= Info.subStr(r.get("neirong"), 25) %></div>
                                            <div class="other-content">
                                                <span><%= Info.subStr(r.get("addtime") , 19 , "") %></span>
                                            </div>
                                        </div>
                                    </li>
                                    <%} %>

                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- /.sidebar-widget-body -->
                </div>
            </div>
            <div class="col-sm-8 col-md-8">
                <% List<Map> bhtList = Query.make("lunbotu").order("id desc").limit(5).select(); %>


                <div class="swiper-container" id="base/banner32">
                    <div class="swiper-wrapper">
                        <% for (Map bht : bhtList) { %>

                        <div class="swiper-slide">
                            <div class="decoimg_b2">
                                <a class="btn btn-" href="<%= bht.get("url") %>" style="background-image: url('<%= bht.get("image") %>'); height: 490px"></a>
                            </div>
                        </div>

                        <%} %>

                    </div>
                    <!-- 如果需要分页器 -->
                    <div class="swiper-pagination"></div>
                    <!-- 如果需要导航按钮 -->
                    <div class="swiper-button-prev"></div>
                    <div class="swiper-button-next"></div>
                </div>

                <script>
                    var mySwiper = new Swiper("#base/banner32", {
                        loop: true, // 循环模式选项
                        autoplay: {
                            delay: 3000,
                            disableOnInteraction: false,
                        },
                        // 如果需要分页器
                        pagination: {
                            el: ".swiper-pagination",
                        },
                        // 如果需要前进后退按钮
                        navigation: {
                            nextEl: ".swiper-button-next",
                            prevEl: ".swiper-button-prev",
                        },
                        // 如果需要滚动条
                        /*scrollbar: {
            el: '.swiper-scrollbar',
        },*/
                    });
                </script>
            </div>
        </div>

        <!-- container定宽，并剧中结束 -->
    </div>
</div>

<div  style="margin-top: 20px">
    <div class="container">
        <!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->

        <div class="title-modelbox-widget">
            <h3 class="section-title">推荐产品</h3>
            <div class="sidebar-widget-body">
                <div class="shop-product-xz">
                    <% List<Map> shangpinlist37 = Query.make("shangpin").where("shifoutuijian","是").limit(8).order("id desc").select(); %>

                    <div class="row clearfix owl-carousel" data-items="4" data-autoplay="true" data-autoplay-time="8000">
                        <% for (Map r : shangpinlist37) { %>

                        <div class="col-xs-12 col-md-3 products-col">
                            <article class="single_product">
                                <figure>
                                    <div class="product_thumb">
                                        <div class="label_product">
                                            <% if (r.get("shifoutuijian").equals("是")) { %>

                                            <span class="label_sale">推荐</span>
                                            <%} %>

                                        </div>
                                        <a class="primary_img img-box pb100 img-scale" href="shangpindetail.jsp?id=<%= r.get("id") %>">
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
                </div>
            </div>
            <!-- /.sidebar-widget-body -->
        </div>

        <!-- container定宽，并剧中结束 -->
    </div>
</div>



<div>
    <div class="container" style="margin-top: 20px">
        <!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->

        <div class="title-modelbox-widget">
            <h3 class="section-title">热销产品</h3>
            <div class="sidebar-widget-body">
                <div class="shop-product-xz">
                    <% List<Map> shangpinlist42 = Query.make("shangpin").limit(8).order("xiaoliang desc").select(); %>

                    <div class="row clearfix owl-carousel" data-items="4" data-autoplay="true" data-autoplay-time="8000">
                        <% for (Map r : shangpinlist42) { %>

                        <div class="col-xs-12 col-md-3 products-col">
                            <article class="single_product">
                                <figure>
                                    <div class="product_thumb">
                                        <a class="primary_img img-box pb100 img-scale" href="shangpindetail.jsp?id=<%= r.get("id") %>">
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
                </div>
            </div>
            <!-- /.sidebar-widget-body -->
        </div>

        <!-- container定宽，并剧中结束 -->
    </div>
</div>

<%@ include file="footer.jsp" %>
 <%@ include file="foot.jsp" %>

