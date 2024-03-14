<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
 <%@ page language="java" import="java.util.*" %>
 <%@page import="util.*" %>
 <%@ include file="head.jsp" %>


<div style="padding: 10px" class="admin-content">
    <%
    String orderby = util.Request.get("order", "id"); // 获取搜索框中的排序字段、默认为发布时间
    String sort = util.Request.get("sort", "desc"); // 获取搜索框中的排序类型、默认为倒序
    
    String where = " 1=1 "; // 防止sql 搜索条件为： where and a=b 这样的错误
    where += " AND username='" + request.getSession().getAttribute("username") + "' "; //  设置username为当前登录用户
    
    // 以下是检测搜索框中是否填写了或者选择了什么，则写入sql 语句中
    
    if (request.getParameter("biaoti") != null && !"".equals(request.getParameter("biaoti"))) {
        where += " AND biaoti LIKE '%" + request.getParameter("biaoti") + "%'";
    }
    
    List<Map> list = Query.make("shoucang").where(where).order(orderby + " " + sort).page(15);
    %>


    <div class="panel panel-default">
        <div class="panel-heading">
            <span class="module-name"> 收藏 </span>
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
                        标题

                        <input type="text" class="form-control" style="" name="biaoti" value="<%= request.getParameter("biaoti") !=null ? request.getParameter("biaoti") : "" %>" />
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

            <form action="shoucang.jsp?a=batch" method="post" id="form-batch">
                <div class="list-table">
                    <table width="100%" border="1" class="table table-list table-bordered table-hover">
                        <thead>
                            <tr align="center">
                                <th width="60" data-field="item">序号</th>
                                <th>标题</th>
                                <th>收藏时间</th>
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
                                    <label>
                                        <input type="checkbox" name="ids" class="ids" value="<%= map.get("id") %>" />
                                        <%= i %>
                                    </label>
                                </td>
                                <td><%= map.get("biaoti") %></td>
                                <td><%= Info.subStr(map.get("addtime") , 19 , "") %></td>
                                <td align="center">
                                    <a target="_blank" href="<%= map.get("biao") %>detail.jsp?id=<%= map.get("xwid") %>">详情</a>

                                    <a href="shoucang.jsp?a=delete&id=<%= map.get("id") %>" onclick="return confirm('确定要删除？')">删除</a>
                                    <!--qiatnalijne-->
                                </td>
                            </tr>
                            <%} %>

                        </tbody>
                    </table>
                </div>
                <div class="" style="margin-top: 10px">
                    <label><input type="checkbox" value="1" onclick="$('.list-table input.ids').prop('checked' , this.checked)" /> 全选/全不选</label>
                    <input type="submit" name="delete" value="批量删除" />
                </div>
            </form>

            ${page.info}
        </div>
    </div>
</div>
<%@ include file="foot.jsp" %>

