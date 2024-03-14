<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
 <%@ page language="java" import="java.util.*" %>
 <%@page import="util.*" %>
 <%@ include file="head.jsp" %>


<div style="padding: 10px" class="admin-content">
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


    <div class="panel panel-default">
        <div class="panel-heading">
            <span class="module-name"> 商品 </span>
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
                        商品编号

                        <input type="text" class="form-control" style="" name="shangpinbianhao" value="<%= request.getParameter("shangpinbianhao") !=null ? request.getParameter("shangpinbianhao") : "" %>" />
                    </div>
                    <div class="form-group">
                        分类

                        <select class="form-control class_fenlei1" data-value="<%= request.getParameter("fenlei") !=null ? request.getParameter("fenlei") : "" %>" id="fenlei" name="fenlei">
                            <option value="">请选择</option>
                            <% List<Map> select = new CommDAO().select("SELECT * FROM fenlei ORDER BY id desc"); %>
 <% for (Map m : select) { %>

                            <option value="<%= m.get("id") %>"><%= m.get("fenleiming") %></option>
                            <%} %>

                        </select>
                        <script>
                            $(".class_fenlei1").val($(".class_fenlei1").attr("data-value"));
                        </script>
                    </div>
                    <div class="form-group">
                        商品名称

                        <input type="text" class="form-control" style="" name="shangpinmingcheng" value="<%= request.getParameter("shangpinmingcheng") !=null ? request.getParameter("shangpinmingcheng") : "" %>" />
                    </div>
                    <div class="form-group">
                        摊位号

                        <input type="text" class="form-control" style="" name="tanweihao" value="<%= request.getParameter("tanweihao") !=null ? request.getParameter("tanweihao") : "" %>" />
                    </div>
                    <div class="form-group">
                        区域

                        <select class="form-control select-update" data-value="<%= request.getParameter("quyu") !=null ? request.getParameter("quyu") : "" %>" id="quyu" name="quyu">
                            <option value="">请选择</option>
                            <% select = new CommDAO().select("SELECT * FROM quyu ORDER BY id desc"); %>
 <% for (Map m : select) { %>

                            <option value="<%= m.get("id") %>"><%= m.get("quyuming") %></option>
                            <%} %>

                        </select>
                        <script>
                            $(".class_quyu2 select-update").val($(".class_quyu2 select-update").attr("data-value"));
                        </script>
                    </div>
                    <div class="form-group">
                        是否推荐

                        <select
                            class="form-control class_shifoutuijian3"
                            data-value="<%= request.getParameter("shifoutuijian") !=null ? request.getParameter("shifoutuijian") : "" %>"
                            data-rule-required="true"
                            data-msg-required="请填写是否推荐"
                            id="shifoutuijian"
                            name="shifoutuijian"
                        >
                            <option value="">请选择</option>
                            <option value="是">是</option>
                            <option value="否">否</option>
                        </select>
                        <script>
                            $(".class_shifoutuijian3").val($(".class_shifoutuijian3").attr("data-value"));
                        </script>
                    </div>
                    <select class="form-control" name="order" id="orderby">
                        <option value="id">按发布时间</option>
                        <option value="kucun">按库存</option>
                        <option value="xiaoliang">按销量</option>
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
                            <th>商品编号</th>
                            <th>分类</th>
                            <th>商品名称</th>
                            <th>图片</th>
                            <th>售价</th>
                            <th>库存</th>
                            <th>销量</th>
                            <th>摊位号</th>
                            <th>区域</th>
                            <th>是否推荐</th>
                            <th>发布人</th>
                            <th>添加时间</th>
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
                                <label> <%= i %> </label>
                            </td>
                            <td><%= map.get("shangpinbianhao") %></td>
                            <td><% Map mapfenlei1 = new CommDAO().find("SELECT fenleiming,id FROM fenlei where id='" + map.get("fenlei") + "'"); %>
<%= mapfenlei1.get("fenleiming") %></td>
                            <td><%= map.get("shangpinmingcheng") %></td>
                            <td><% if ("".equals(map.get("tupian"))) { %>
-<%} else { %><img width="100" src="<%= Info.images(map.get("tupian")) %>" /><%} %>
</td>
                            <td><%= map.get("shoujia") %></td>
                            <td><%= map.get("kucun") %></td>
                            <td><%= map.get("xiaoliang") %></td>
                            <td><%= map.get("tanweihao") %></td>
                            <td><% Map mapquyu2 = new CommDAO().find("SELECT quyuming,id FROM quyu where id='" + map.get("quyu") + "'"); %>
<%= mapquyu2.get("quyuming") %></td>
                            <td><%= map.get("shifoutuijian") %></td>
                            <td><%= map.get("faburen") %></td>
                            <td><%= Info.subStr(map.get("addtime") , 19 , "") %></td>
                            <td align="center">
                                <a href="shangpin_detail.jsp?id=<%= map.get("id") %>">详情</a>

                                <a href="shangpin_updt.jsp?id=<%= map.get("id") %>">编辑</a>

                                <a href="shangpin.jsp?a=delete&id=<%= map.get("id") %>" onclick="return confirm('确定要删除？')">删除</a>
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

