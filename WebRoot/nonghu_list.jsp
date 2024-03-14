<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.util.*" %>
<%@page import="util.*" %>
<%@ include file="head.jsp" %>


<div style="padding: 10px" class="admin-content">
    <%
        String orderby = util.Request.get("order", "id"); // 获取搜索框中的排序字段、默认为发布时间
        String sort = util.Request.get("sort", "desc"); // 获取搜索框中的排序类型、默认为倒序

        String where = " 1=1 "; // 防止sql 搜索条件为： where and a=b 这样的错误
        if (session.getAttribute("cx").equals("农户")) {
            where += " and zhanghao ='" + session.getAttribute("username") + "'";
        }

        // 以下是检测搜索框中是否填写了或者选择了什么，则写入sql 语句中

        if (request.getParameter("zhanghao") != null && !"".equals(request.getParameter("zhanghao"))) {
            where += " AND zhanghao LIKE '%" + request.getParameter("zhanghao") + "%'";
        }
        if (request.getParameter("suozaitanwei") != null && !"".equals(request.getParameter("suozaitanwei"))) {
            where += " AND suozaitanwei ='" + request.getParameter("suozaitanwei") + "'";
        }

        List<Map> list = Query.make("nonghu").where(where).order(orderby + " " + sort).page(15);
    %>


    <div class="panel panel-default">
        <div class="panel-heading">
            <span class="module-name"> 农户 </span>
            <span>列表</span>
        </div>
        <div class="panel-body">
            <div class="pa10 bg-warning">
                <form class="form-inline" id="formSearch" action="?">
                    <!-- form 标签开始 -->

                    <div class="form-group">
                        <i class="glyphicon glyphicon-search"></i>
                    </div>

                    <div class="form-group">
                        账号

                        <input type="text" class="form-control" style="" name="zhanghao"
                               value="<%= request.getParameter("zhanghao") !=null ? request.getParameter("zhanghao") : "" %>"/>
                    </div>
                    <div class="form-group">
                        所在摊位

                        <select class="form-control class_suozaitanwei1"
                                data-value="<%= request.getParameter("suozaitanwei") !=null ? request.getParameter("suozaitanwei") : "" %>"
                                id="suozaitanwei" name="suozaitanwei">
                            <option value="">请选择</option>
                            <% List<Map> select = new CommDAO().select("SELECT * FROM tanwei ORDER BY id desc"); %>
                            <% for (Map m : select) { %>

                            <option value="<%= m.get("id") %>"><%= m.get("tanweihao") %>
                            </option>
                            <%} %>

                        </select>
                        <script>
                            $(".class_suozaitanwei1").val($(".class_suozaitanwei1").attr("data-value"));
                        </script>
                    </div>
                    <select class="form-control" name="order" id="orderby">
                        <option value="id">按发布时间</option>
                    </select>
                    <select class="form-control" name="sort" id="sort">
                        <option value="desc">倒序</option>
                        <option value="asc">升序</option>
                    </select>
                    <script>
                        $("#orderby").val("<%= orderby %>");
                        $("#sort").val("<%= sort %>");
                    </script>
                    <button type="submit" class="btn btn-default">搜索</button>

                    <!--form标签结束-->
                </form>
            </div>

            <div class="list-table">
                <table width="100%" border="1" class="table table-list table-bordered table-hover">
                    <thead>
                    <tr align="center">
                        <th width="60" data-field="item">序号</th>
                        <th>账号</th>
                        <th>姓名</th>
                        <th>性别</th>
                        <th>联系方式</th>
                        <th>所在摊位</th>
                        <th>营业执照</th>
                        <th>备注</th>
                        <th width="220" data-field="handler">操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        int i = 0;
                        for (Map map : list) {
                            i++;
                    %>

                    <tr id="<%= map.get("id") %>" pid="">
                        <td width="30" align="center">
                            <label><%= i %>
                            </label>
                        </td>
                        <td><%= map.get("zhanghao") %>
                        </td>
                        <td><%= map.get("xingming") %>
                        </td>
                        <td><%= map.get("xingbie") %>
                        </td>
                        <td><%= map.get("lianxifangshi") %>
                        </td>
                        <td><%
                            Map maptanwei1 = new CommDAO().find("SELECT tanweihao,id FROM tanwei where id='" + map.get("suozaitanwei") + "'"); %>
                            <%= maptanwei1.get("tanweihao") %>
                        </td>
                        <td><% if ("".equals(map.get("yingyezhizhao"))) { %>
                            -<%} else { %><img width="100" src="<%= map.get("yingyezhizhao") %>"/><%} %>
                        </td>
                        <td><%= map.get("beizhu") %>
                        </td>
                        <td align="center">


                            <% if (session.getAttribute("cx").equals("管理员")) {%>

                            <a href="nonghu_updt.jsp?id=<%= map.get("id") %>">编辑</a>

                            <a href="nonghu.jsp?a=delete&id=<%= map.get("id") %>"
                               onclick="return confirm('确定要删除？')">删除</a>


                            <%}%>


                            <!--qiatnalijne-->
                        </td>
                    </tr>
                    <%} %>

                    </tbody>
                </table>
            </div>

            ${page.info}
        </div>
    </div>
</div>
<%@ include file="foot.jsp" %>

