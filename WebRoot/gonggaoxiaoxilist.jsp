<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
 <%@ page language="java" import="java.util.*" %>
 <%@page import="util.*" %>
 <%
String orderby = util.Request.get("order", "id"); // 获取搜索框中的排序字段、默认为发布时间
String sort = util.Request.get("sort", "desc"); // 获取搜索框中的排序类型、默认为倒序

String where = " 1=1 "; // 防止sql 搜索条件为： where and a=b 这样的错误

// 以下是检测搜索框中是否填写了或者选择了什么，则写入sql 语句中

if (request.getParameter("biaoti") != null && !"".equals(request.getParameter("biaoti"))) {
    where += " AND biaoti LIKE '%" + request.getParameter("biaoti") + "%'";
}

List<Map> list = Query.make("gonggaoxiaoxi").where(where).order(orderby + " " + sort).page(15);
%>
 <%@ include file="head.jsp" %>
 <%@ include file="header.jsp" %>


<div style="margin: 20px 0 0 0">
    <div class="container">
        <!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->

        <div class="" style="background-color: #FFFFFF">
            <div style="margin-bottom: 20px">
                <form action="?" class="search" style="background-color: #FFFFFF">
                    <table class="jd-search">
                        <tbody>
                            <tr>
                                <td class="label1">标题</td>
                                <td class="form-inline">
                                    <input type="text" class="form-control" style="width: 150px" name="biaoti" value="<%= request.getParameter("biaoti") !=null ? request.getParameter("biaoti") : "" %>" placeholder="请输入关键词" />
                                    <button type="submit" class="btn btn-default">搜索</button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </form>
            </div>
            <div class="news-list">
                <ul>
                    <% for (Map r : list) { %>

                    <li class="clearfix">
                        <a href="gonggaoxiaoxidetail.jsp?id=<%= r.get("id") %>">
                            <div class="thumb">
                                <div class="img-box pb100">
                                    <div class="img" style="background-image: url('<%= r.get("tupian") %>')"></div>
                                </div>
                            </div>
                        </a>

                        <div class="news-content-text">
                            <a href="gonggaoxiaoxidetail.jsp?id=<%= r.get("id") %>">
                                <h3><%= r.get("biaoti") %></h3>
                            </a>
                            <div class="description"><%= Info.subStr(r.get("neirong"), 80) %></div>
                            <div class="other-content">
                                <span>添加时间：<%= Info.subStr(r.get("addtime") , 19 , "") %></span>
                            </div>
                        </div>
                    </li>
                    <%} %>

                </ul>
            </div>
            ${page.info}
        </div>

        <!-- container定宽，并剧中结束 -->
    </div>
</div>

<%@ include file="footer.jsp" %>
 <%@ include file="foot.jsp" %>

