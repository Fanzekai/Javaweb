<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
 <%@ page language="java" import="java.util.*" %>
 <%@page import="util.*" %>


<div class="footer" style="margin-top: 20px">
    <div class="FooterTop">
        <div class="cmain">
            <ul class="ImgList">
                <li class="active"><a style="color: white" href="##">个人信息</a></li>
                <li class="item">
                    <a class="m1 WXCon" href="##">
                        <div class="ewmcon">
                            <img src="./images/ewm1.jpg" alt="" />
                        </div>
                    </a>
                    <a class="m2" href="javascript:;"></a>
                </li>
                <li class="item">
                    <a class="m3" href="javascript:;"></a>
                    <a class="m4" href="javascript:;"></a>
                </li>
            </ul>
            <ul>
                <li></li>
                <li class="active" style="color: white">广州软件学院</li>
                <li style="color: white">fzk</li>
                <li style="color: white">软件工程</li>
                <li style="color: white">电话：111 2222 333 邮箱：1581669423@qq.com</li>
                <li style="color: white">theme © 2024 农贸市场管理系统的设计与实现</li>
            </ul>
            <% List<Map> likeList = Query.make("youqinglianjie").order("id desc").select(); %>

            <div class="LinkItem">
                <div class="txt1" style="color: white"><em style="color: white">友情链接 / </em> LINKS</div>
                <div class="txt2"><span class="hen"></span></div>
                <div class="txt3">
                    <% for (Map v : likeList) { %>

                    <a style="color: white" href="<%= v.get("wangzhi") %>" target="_blank"><%= v.get("wangzhanmingcheng") %></a>   <%} %>

                </div>
            </div>
        </div>
    </div>
</div>
