<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.util.*" %>
<%@page import="util.*" %>
<% %>
<% Map map = Query.make("shangpin").where("id", request.getParameter("id")).find(); %>
<%@ include file="head.jsp" %>
<%@ include file="header.jsp" %>

<link rel="stylesheet" href="js/swiper/swiper.css"/>
<script src="js/swiper/swiper.js"></script>
<script src="js/jquery.validate.js"></script>

<div>
    <div class="container">
        <!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->

        <div class="" style="margin: 20px 0 0 0; background-color: #FFFFFF">
            <div class="goods-info clearfix">
                <div class="gallery-list">
                    <div class="swiper-container gallery-top" id="shangpin-galler">
                        <div class="swiper-wrapper"></div>
                    </div>
                    <div class="swiper-container gallery-thumbs" id="shangpin-thumb">
                        <div class="swiper-wrapper"></div>
                    </div>
                </div>
                <div class="goods-right-content">
                    <h3 class="title"><%= map.get("shangpinmingcheng") %>
                    </h3>
                    <div class="descount" style="line-height: 30px">
                        <div>
                            <span class="name"> 分类： </span>
                            <span class="val"> <% Map mapfenlei11 = new CommDAO().find("SELECT fenleiming,id FROM fenlei where id='" + map.get("fenlei") + "'"); %>
<%= mapfenlei11.get("fenleiming") %> </span>
                        </div>
                        <div>
                            <span class="name"> 售价： </span>
                            <span class="val"> <%= map.get("shoujia") %> </span>
                        </div>
                        <div>
                            <span class="name"> 库存： </span>
                            <span class="val"> <%= map.get("kucun") %> </span>
                        </div>
                        <div>
                            <span class="name"> 销量： </span>
                            <span class="val"> <%= map.get("xiaoliang") %> </span>
                        </div>
                        <div>
                            <span class="name"> 摊位号： </span>
                            <span class="val"> <%= map.get("tanweihao") %> </span>
                        </div>
                        <div>
                            <span class="name"> 区域： </span>
                            <span class="val"> <% Map mapquyu12 = new CommDAO().find("SELECT quyuming,id FROM quyu where id='" + map.get("quyu") + "'"); %>
<%= mapquyu12.get("quyuming") %> </span>
                        </div>
                    </div>

                    <% Map readMap = Query.make("shangpin").where("id", request.getParameter("id")).find(); %>

                    <form class="form-inline" action="gouwuche.jsp?a=insert" id="addCard" method="post">
                        <!-- form 标签开始 -->

                        <div style="display: none">
                            <input type="hidden" name="shangpinid"
                                   value="<%= request.getParameter("id") !=null ? request.getParameter("id") : "" %>"/>
                            <input type="hidden" id="shangpinbianhao" name="shangpinbianhao"
                                   value="<%= Info.html(map.get("shangpinbianhao")) %>"/>
                            <input type="hidden" id="fenlei" name="fenlei" value="<%= Info.html(map.get("fenlei")) %>"/>
                            <input type="hidden" id="shangpinmingcheng" name="shangpinmingcheng"
                                   value="<%= Info.html(map.get("shangpinmingcheng")) %>"/>
                            <input type="hidden" id="tupian" name="tupian" value="<%= Info.html(map.get("tupian")) %>"/>
                            <input type="hidden" id="shoujia" name="shoujia"
                                   value="<%= Info.html(map.get("shoujia")) %>"/>
                            <input type="hidden" id="faburen" name="faburen"
                                   value="<%= Info.html(map.get("faburen")) %>"/>
                            <input
                                    type="text"
                                    class="form-control"
                                    placeholder="输入购买人"
                                    style="width: 150px"
                                    readonly="readonly"
                                    id="goumairen"
                                    name="goumairen"
                                    value="<%= request.getSession().getAttribute("username") !=null ? request.getSession().getAttribute("username") : "" %>"
                            />
                            <input name="referer" id="referer" value="" type="hidden"/>
                            <script>
                                $("#referer").val(location.href);
                            </script>
                        </div>

                        <div class="mt10">
                            <div class="spec-list"></div>

                            <div class="mt10">
                                <div class="form-group mt10">
                                    购买数量：

                                    <input
                                            type="number"
                                            class="form-control"
                                            placeholder="输入购买数量"
                                            style="width: 150px"
                                            data-rule-required="true"
                                            data-msg-required="请填写购买数量"
                                            number="true"
                                            data-msg-number="输入一个有效数字"
                                            min="1"
                                            max="<%= readMap.get("kucun") %>"
                                            id="goumaishuliang"
                                            name="goumaishuliang"
                                            value=""
                                    />
                                </div>
                            </div>
                            <div class="mt10">
                                <% if (request.getSession().getAttribute("username") == null || "".equals(request.getSession().getAttribute("username"))) { %>

                                <button type="button" class="btn btn-primary" onclick="alert('你尚未登录，请登录后操作')">加入购物车
                                </button>
                                <%} else { %>
                                <button type="submit" class="btn btn-primary">加入购物车</button>
                                <%} %>
                                <% if (request.getSession().getAttribute("username") != null && !("".equals(request.getSession().getAttribute("username")))) { %>
                                <%
                                    Map shoucangCount = Query
                                            .make("shoucang")
                                            .where("biao", "shangpin")
                                            .where("xwid", map.get("id"))
                                            .where("username", request.getSession().getAttribute("username"))
                                            .field("count(*) as count")
                                            .find();
                                %>
                                <% if (!(shoucangCount.get("count").equals("0"))) { %>

                                <button
                                        type="button"
                                        class="btn btn-default"
                                        onclick="location.href='shoucang.jsp?a=insert&xwid=<%= map.get("id") %>&biao=shangpin&biaoti=<%= map.get("shangpinmingcheng") %>'"
                                >
                                    取消收藏
                                </button>
                                <%} else { %>
                                <button
                                        type="button"
                                        class="btn btn-default"
                                        onclick="location.href='shoucang.jsp?a=insert&xwid=<%= map.get("id") %>&biao=shangpin&biaoti=<%= map.get("shangpinmingcheng") %>'"
                                >
                                    收藏
                                </button>
                                <%} %>
                                <%} else { %>
                                <button
                                        type="button"
                                        class="btn btn-default"
                                        onclick="location.href='shoucang.jsp?a=insert&xwid=<%= map.get("id") %>&biao=shangpin&biaoti=<%= map.get("shangpinmingcheng") %>'"
                                >
                                    收藏
                                </button>
                                <%} %>

                            </div>
                        </div>

                        <!--form标签结束-->
                    </form>
                    <script>
                        $(function () {
                            $("#addCard").validate();
                        });
                    </script>
                </div>
            </div>
            <div class="goods-content"><%= map.get("xiangqing") %>
            </div>

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

<%@ include file="footer.jsp" %>
<%@ include file="foot.jsp" %>

