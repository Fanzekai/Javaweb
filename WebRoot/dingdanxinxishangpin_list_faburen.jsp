<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.util.*" %>
<%@page import="util.*" %>
<%@ include file="head.jsp" %>


<div style="padding: 10px" class="admin-content">
    <%
        String orderby = util.Request.get("order", "id"); // 获取搜索框中的排序字段、默认为发布时间
        String sort = util.Request.get("sort", "desc"); // 获取搜索框中的排序类型、默认为倒序

        String where = " 1=1 "; // 防止sql 搜索条件为： where and a=b 这样的错误
        where += " AND faburen='" + request.getSession().getAttribute("username") + "' "; //  设置faburen为当前登录用户

        // 以下是检测搜索框中是否填写了或者选择了什么，则写入sql 语句中

        if (request.getParameter("dingdanxinxiid") != null && !"".equals(request.getParameter("dingdanxinxiid"))) {
            where += " AND dingdanxinxiid ='" + request.getParameter("dingdanxinxiid") + "'";
        }
        if (request.getParameter("shangpinid") != null && !"".equals(request.getParameter("shangpinid"))) {
            where += " AND shangpinid ='" + request.getParameter("shangpinid") + "'";
        }
        if (request.getParameter("shangpinbianhao") != null && !"".equals(request.getParameter("shangpinbianhao"))) {
            where += " AND shangpinbianhao LIKE '%" + request.getParameter("shangpinbianhao") + "%'";
        }
        if (request.getParameter("fenlei") != null && !"".equals(request.getParameter("fenlei"))) {
            where += " AND fenlei ='" + request.getParameter("fenlei") + "'";
        }
        if (request.getParameter("shangpinmingcheng") != null && !"".equals(request.getParameter("shangpinmingcheng"))) {
            where += " AND shangpinmingcheng LIKE '%" + request.getParameter("shangpinmingcheng") + "%'";
        }
        if (request.getParameter("goumaishuliang_start") != null && !"".equals(request.getParameter("goumaishuliang_start"))) {
            where += " AND goumaishuliang >='" + request.getParameter("goumaishuliang_start") + "' ";
        }
        if (request.getParameter("goumaishuliang_end") != null && !"".equals(request.getParameter("goumaishuliang_end"))) {
            where += " AND goumaishuliang <='" + request.getParameter("goumaishuliang_end") + "' ";
        }
        if (request.getParameter("xiaoji_start") != null && !"".equals(request.getParameter("xiaoji_start"))) {
            where += " AND xiaoji >='" + request.getParameter("xiaoji_start") + "' ";
        }
        if (request.getParameter("xiaoji_end") != null && !"".equals(request.getParameter("xiaoji_end"))) {
            where += " AND xiaoji <='" + request.getParameter("xiaoji_end") + "' ";
        }
        List<Map> list = Query.make("dingdanxinxishangpin").where(where).order(orderby + " " + sort).page(15);

        Map total = Query
                .make("dingdanxinxishangpin")
                .field("(sum(xiaoji)) sum_xiaoji")
                .where(where)
                .field("(sum(xiaoji)) sum_xiaoji")
                .find();
    %>


    <div class="panel panel-default">
        <div class="panel-heading">
            <span class="module-name"> 订单信息商品 </span>
            <span>列表</span>
        </div>
        <div class="panel-body">
            <div class="pa10 bg-warning">
                <form class="form-inline" id="formSearch" action="?">
                    <!-- form 标签开始 -->

                    <div class="form-group">
                        <i class="glyphicon glyphicon-search"></i>
                    </div>

                    <div class="form-group" style="display: none">
                        订单信息id

                        <select class="form-control class_dingdanxinxiid32"
                                data-value="<%= request.getParameter("dingdanxinxiid") !=null ? request.getParameter("dingdanxinxiid") : "" %>"
                                id="dingdanxinxiid" name="dingdanxinxiid">
                            <option value="">请选择</option>
                            <% List<Map> select = new CommDAO().select("SELECT * FROM dingdanxinxi ORDER BY id desc"); %>
                            <% for (Map m : select) { %>

                            <option value="<%= m.get("id") %>"><%= m.get("") %>
                            </option>
                            <%} %>

                        </select>
                        <script>
                            $(".class_dingdanxinxiid32").val($(".class_dingdanxinxiid32").attr("data-value"));
                        </script>
                    </div>
                    <div class="form-group" style="display: none">
                        商品id

                        <select class="form-control class_shangpinid33"
                                data-value="<%= request.getParameter("shangpinid") !=null ? request.getParameter("shangpinid") : "" %>"
                                id="shangpinid" name="shangpinid">
                            <option value="">请选择</option>
                            <% select = new CommDAO().select("SELECT * FROM shangpin ORDER BY id desc"); %>
                            <% for (Map m : select) { %>

                            <option value="<%= m.get("id") %>"><%= m.get("") %>
                            </option>
                            <%} %>

                        </select>
                        <script>
                            $(".class_shangpinid33").val($(".class_shangpinid33").attr("data-value"));
                        </script>
                    </div>
                    <div class="form-group" >
                        商品编号

                        <input type="text" class="form-control" style="" name="shangpinbianhao"
                               value="<%= request.getParameter("shangpinbianhao") !=null ? request.getParameter("shangpinbianhao") : "" %>"/>
                    </div>
                    <div class="form-group">
                        商品名称

                        <input type="text" class="form-control" style="" name="shangpinmingcheng"
                               value="<%= request.getParameter("shangpinmingcheng") !=null ? request.getParameter("shangpinmingcheng") : "" %>"/>
                    </div>

                    <div class="form-group">
                        分类

                        <select class="form-control class_fenlei34"
                                data-value="<%= request.getParameter("fenlei") !=null ? request.getParameter("fenlei") : "" %>"
                                id="fenlei" name="fenlei">
                            <option value="">请选择</option>
                            <% select = new CommDAO().select("SELECT * FROM fenlei ORDER BY id desc"); %>
                            <% for (Map m : select) { %>

                            <option value="<%= m.get("id") %>"><%= m.get("fenleiming") %>
                            </option>
                            <%} %>

                        </select>
                        <script>
                            $(".class_fenlei34").val($(".class_fenlei34").attr("data-value"));
                        </script>
                    </div>


                    <select class="form-control" name="order" id="orderby">
                        <option value="id">按发布时间</option>
                        <option value="goumaishuliang">按购买数量</option>
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
                        <th>发布人</th>
                        <th>购买数量</th>
                        <th>小计</th>
                        <th>购买人</th>
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
                            <label><%= i %>
                            </label>
                        </td>
                        <td><%= map.get("shangpinbianhao") %>
                        </td>
                        <td><%
                            Map mapfenlei39 = new CommDAO().find("SELECT fenleiming,id FROM fenlei where id='" + map.get("fenlei") + "'"); %>
                            <%= mapfenlei39.get("fenleiming") %>
                        </td>
                        <td><%= map.get("shangpinmingcheng") %>
                        </td>
                        <td><% if ("".equals(map.get("tupian"))) { %>
                            -<%} else { %><img width="100" src="<%= Info.images(map.get("tupian")) %>"/><%} %>
                        </td>
                        <td><%= map.get("shoujia") %>
                        </td>
                        <td><%= map.get("faburen") %>
                        </td>
                        <td><%= map.get("goumaishuliang") %>
                        </td>
                        <td><%= map.get("xiaoji") %>
                        </td>
                        <td><%= map.get("goumairen") %>
                        </td>
                        <td><%= Info.subStr(map.get("addtime"), 19, "") %>
                        </td>
                        <td align="center">
                            <a href="dingdanxinxishangpin_detail.jsp?id=<%= map.get("id") %>">详情</a>
                            <!--qiatnalijne-->
                        </td>
                    </tr>
                    <%} %>

                    </tbody>
                </table>
            </div>

            ${page.info}
            <p>小计总和: <%= total.get("sum_xiaoji") %> 　　</p>
        </div>
    </div>
</div>
<%@ include file="foot.jsp" %>

