<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
 <%@ page language="java" import="java.util.*" %>
 <%@page import="util.*" %>
 <%
String orderby = util.Request.get("order", "id"); // 获取搜索框中的排序字段、默认为发布时间
String sort = util.Request.get("sort", "desc"); // 获取搜索框中的排序类型、默认为倒序

String where = " 1=1 "; // 防止sql 搜索条件为： where and a=b 这样的错误

// 以下是检测搜索框中是否填写了或者选择了什么，则写入sql 语句中

if (request.getParameter("tanweihao") != null && !"".equals(request.getParameter("tanweihao"))) {
    where += " AND tanweihao LIKE '%" + request.getParameter("tanweihao") + "%'";
}
if (request.getParameter("quyu") != null && !"".equals(request.getParameter("quyu"))) {
    where += " AND quyu ='" + request.getParameter("quyu") + "'";
}



List<Map> list = Query.make("tanwei").where(where).order(orderby + " " + sort).page(15);
%>
 <%@ include file="head.jsp" %>
 <%@ include file="header.jsp" %>


<div>
    <div class="container">
        <!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->

        <div class="snick clearfix" style="background-color: #FFFFFF">
            <div style="margin-bottom: 20px">
                <form action="?" class="search" style="margin: 20px 0 0 0; background-color: #FFFFFF">
                    <table class="jd-search">
                        <tbody></tbody>
                    </table>
                </form>

                <form action="?" class="search">
                    <table class="jd-search">
                        <tbody>
                            <tr>
                                <td class="label1">区域</td>
                                <td class="form-inline">
                                    <p class="search-radio">
                                        <input type="hidden" name="quyu" value="<%= request.getParameter("quyu") !=null ? request.getParameter("quyu") : "" %>" />
                                        <a href="javascript:;" data-value="" onclick="selectRadio(this)">全部</a>
                                        <% List<Map> mapquyu2 = new CommDAO().select("SELECT id,quyuming FROM quyu"); %>
 <% for (Map r : mapquyu2) { %>

                                        <a href="javascript:;" data-value="<%= r.get("id") %>" onclick="selectRadio(this)"><%= r.get("quyuming") %></a>
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
                        </tbody>
                    </table>
                </form>
            </div>
            <div class="row">
                <% for (Map r : list) { %>

                <div class="col-md-3 snock">
                    <a href="tanweidetail.jsp?id=<%= r.get("id") %>">
                        <div class="services">
                            <div class="img-box snocks pb100">
                                <div class="img" style="background-image: url('<%= r.get("tupian") %>')"></div>
                            </div>
                            <h2><%= Info.subStr(r.get("tanweihao"), 15) %></h2>
                            <p><%= Info.subStr(r.get("jingyingchanpin"), 60) %></p>
                        </div>
                    </a>
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

