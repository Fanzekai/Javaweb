<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
 <%@ page language="java" import="java.util.*" %>
 <%@page import="util.*" %>


<nav id="header-box">
    <div class="container">
        <!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->

        <a href="{url home}" class="logo"> 农贸市场管理系统的设计与实现 </a>

        <!-- ==========  Top navigation ========== -->

        <div class="navigation navigation-top clearfix">
            <ul>
                <!--add active class for current page-->
                <li class="left-side">
                    <a href="./"> 农贸市场管理系统的设计与实现 </a>
                </li>
                <!--<li class="left-side"><a href="email-template.html">Email template</a></li>-->

                <% if (request.getSession().getAttribute("username") != null && !(request.getSession().getAttribute("username").equals(""))) { %>

                <li>
                    <a href="main.jsp"><i class="icon icon-user"></i><%= request.getSession().getAttribute("username") !=null ? request.getSession().getAttribute("username") : "" %>,<%= request.getSession().getAttribute("cx") !=null ? request.getSession().getAttribute("cx") : "" %></a>
                </li>
                <li>
                    <a href="logout.jsp"><i class="fa fa-sign-out"></i>退出</a>
                </li>
                <%} else { %>
                <li>
                    <a href="javascript:void(0);" class="open-login"><i class="icon icon-user"></i> 登录</a>
                </li>
                <%} %>


                <li>
                    <a href="javascript:void(0);" class="open-search"><i class="icon icon-magnifier"></i></a>
                </li>

                <!--<li><a href="javascript:void(0);" class="open-cart"><i class="icon icon-cart"></i> <span>4</span></a></li>-->
            </ul>
        </div>

        <!-- ==========  Main navigation ========== -->

        <div class="navigation navigation-main">
            <a href="#" class="open-login"><i class="icon icon-user"></i></a>
            <!--<a href="#" class="open-search"><i class="icon icon-magnifier"></i></a>
                <a href="#" class="open-cart"><i class="icon icon-cart"></i> <span>4</span></a>-->
            <a href="#" class="open-menu"><i class="icon icon-menu"></i></a>

            <div class="floating-menu">
                <!--mobile toggle menu trigger-->
                <div class="close-menu-wrapper">
                    <span class="close-menu"><i class="icon icon-cross"></i></span>
                </div>
                <ul id="navbar-str">
                    <li>
                        <a href="./">首页 </a>
                    </li>
                    <li>
                        <a href="shangpinlist.jsp">商品信息 </a>
                    </li>
                    <li>
                        <a href="tanweilist.jsp">摊位信息 </a>
                    </li>
                    <li>
                        <a href="gonggaoxiaoxilist.jsp">公告消息 </a>
                    </li>
                    <li>
                        <a href="liuyanbanadd.jsp">在线留言 </a>
                    </li>
                    <li>
                        <a href="yonghuadd.jsp">用户注册 </a>
                    </li>
                    <li>
                        <a href="login.jsp">后台登录 </a>
                    </li>
                </ul>
            </div>
        </div>

        <!-- ==========  Search wrapper ========== -->
        <div class="search-wrapper">
            <form action="shangpinlist.jsp">
                <input type="text" value="<%= request.getParameter("shangpinmingcheng") !=null ? request.getParameter("shangpinmingcheng") : "" %>" name="shangpinmingcheng" class="form-control" placeholder="输入搜索关键字" />
                <button class="btn btn-outline-dark btn-sm">搜索</button>
            </form>
        </div>

        <!-- ==========  Login wrapper ========== -->

        <div class="login-wrapper">
            <!--<div class="h5">登录系统</div>-->
            <form action="login?ac=login&a=a" method="post">
                <!-- form 标签开始 -->

                <div class="form-group">
                    <input type="text" class="form-control" name="username" placeholder="输入帐号" />
                </div>

                <div class="form-group">
                    <input type="password" class="form-control" name="pwd" placeholder="密码" />
                </div>

                <div class="form-group">
                    <select class="form-control" name="cx">
                        <option value="用户">用户</option>
                        <option value="农户">农户</option>
                    </select>
                </div>

                <div class="form-group">
                    <div class="input-group">
                        <input type="text" class="form-control" name="pagerandom" placeholder="输入验证码" />

                        <span class="input-group-addon"
                            ><img src="image.jsp" style="width: 60px; height: 20px; max-width: none; max-height: none" onclick="this.src='image.jsp?rand='+new Date().getTime()"
                        /></span>
                    </div>
                </div>

                <div class="form-group">
                    <div class="row">
                        <label style="text-align: right" class="col-sm-2 hiddex-xs"> </label>
                        <div class="col-sm-10">
                            <button type="submit" class="btn btn-primary">登录</button>
                        </div>
                    </div>
                </div>

                <!--form标签结束-->
            </form>
        </div>

        <!-- ==========  Cart wrapper ========== -->

        <!-- container定宽，并剧中结束 -->
    </div>

    <script>
        $(function () {
            var objSearch = $("#header-box .search-wrapper"),
                objLogin = $("#header-box .login-wrapper"),
                objCart = $("#header-box .cart-wrapper"),
                objMenu = $("#header-box .floating-menu"),
                objMenuLink = $("#header-box .floating-menu a"),
                $search = $("#header-box .open-search"),
                $login = $("#header-box .open-login"),
                $cart = $("#header-box .open-cart"),
                $menu = $("#header-box .open-menu"),
                $openDropdown = $("#header-box .open-dropdown"),
                $close = $("#header-box .close-menu"),
                $settingsItem = $("#header-box .nav-settings .nav-settings-list li");

            // Open/close login

            $login.on("click", function () {
                toggleOpen($(this));
                objLogin.toggleClass("open");
                closeSearch();
                closeCart();
            });

            // Open/close search bar

            $search.on("click", function () {
                toggleOpen($(this));
                objSearch.toggleClass("open");
                objSearch.find("input").focus();
                closeLogin();
                closeCart();
            });

            // Open/close cart

            $cart.on("click", function () {
                toggleOpen($(this));
                objCart.toggleClass("open");
                closeLogin();
                closeSearch();
            });

            // Settings language & currency dropdown

            $settingsItem.on("click", function () {
                var $value = $(this).closest(".nav-settings").find(".nav-settings-value");
                $value.text($(this).text());
            });

            // Mobile menu open/close

            $menu.on("click", function () {
                objMenu.addClass("expanded");
                closeSearch();
                closeLogin();
                closeCart();
            });

            // Floating menu hyperlink
            if ($("nav").hasClass("navbar-single-page")) {
                objMenuLink.on("click", function () {
                    objMenu.removeClass("expanded");
                });
            }

            // Open dropdown/megamenu

            $openDropdown.on("click", function (e) {
                e.preventDefault();

                var liParent = $(this).parent().parent(),
                    liDropdown = liParent.find(".navbar-dropdown");

                liParent.toggleClass("expanded");

                if (liParent.hasClass("expanded")) {
                    liDropdown.slideDown();
                } else {
                    liDropdown.slideUp();
                }
            });

            // Close menu (mobile)

            $close.on("click", function () {
                $("nav").find(".expanded").removeClass("expanded");
                $("nav").find(".navbar-dropdown").slideUp();
            });

            // Global functions

            function toggleOpen(el) {
                $(el).toggleClass("open");
            }

            function closeSearch() {
                objSearch.removeClass("open");
                $search.removeClass("open");
            }
            function closeLogin() {
                objLogin.removeClass("open");
                $login.removeClass("open");
            }
            function closeCart() {
                objCart.removeClass("open");
                $cart.removeClass("open");
            }

            // Sticky header
            // ----------------------------------------------------------------

            var navbarFixed = $("nav.navbar-fixed");

            // When reload page - check if page has offset
            if ($(document).scrollTop() > 94) {
                navbarFixed.addClass("navbar-sticked");
            }
            // Add sticky menu on scroll
            $(document).on("bind ready scroll", function () {
                var docScroll = $(document).scrollTop();
                if (docScroll >= 10) {
                    navbarFixed.addClass("navbar-sticked");
                } else {
                    navbarFixed.removeClass("navbar-sticked");
                }
            });
        })(function () {
            var path = location.pathname.substr(1);
            var search = location.search;
            if (search != "") {
                path += decodeURIComponent(search);
            }
            if (path == "") {
                $("#navbar-str li:eq(0)").addClass("active");
            } else {
                $("#navbar-str>li").each(function () {
                    var href = $(this).find(">a").attr("href");
                    if (href == path) {
                        $(this).addClass("active");
                    }
                    if ($(this).find(".navbar-dropdown").length > 0) {
                        var that = this;
                        $(this)
                            .find("a")
                            .each(function () {
                                var href = $(this).attr("href");
                                if (href == path) {
                                    $(this).addClass("active");
                                    $(that).addClass("active");
                                }
                            });
                    }
                });
            }
        })();
    </script>
</nav>
