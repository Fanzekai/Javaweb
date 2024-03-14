<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
 <%@ page language="java" import="java.util.*" %>
 <%@page import="util.*" %>
 <%@ include file="head.jsp" %>

<script src="js/jquery.validate.js"></script>

<div style="padding: 10px" class="admin-content">
    <% if (request.getSession().getAttribute("username") == null || "".equals(request.getSession().getAttribute("username"))) { %>

    <script>
        alert("对不起,请您先登陆!");
        location.href = "login.jsp";
    </script>
    <%return;
    } %>

    <div class="container">
        <!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->

        <div class="panel panel-default">
            <div class="panel-heading">添加订单信息:</div>
            <div class="panel-body">
                <form action="dingdanxinxi.jsp?a=insert" method="post" name="form1" id="form1">
                    <!-- form 标签开始 -->

                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">订单编号</label>
                            <div class="col-sm-10">
                                <input
                                    type="text"
                                    class="form-control"
                                    placeholder="输入订单编号"
                                    style="width: 150px"
                                    readonly="readonly"
                                    id="dingdanbianhao"
                                    name="dingdanbianhao"
                                    value="<%= Info.getID() %>"
                                />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">商品</label>
                            <div class="col-sm-10">
                                <%
                                List<Map> dataListshangpin = new CommDAO()
                                    .select("SELECT * FROM gouwuche WHERE goumairen='" + request.getSession().getAttribute("username") + "' ORDER BY id desc");
                                %>

                                <div id="dataListshangpin" style="text-align: left">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <td>商品编号</td>
                                                <td>分类</td>
                                                <td>商品名称</td>
                                                <td>图片</td>
                                                <td>售价</td>
                                                <td>发布人</td>
                                                <td>购买数量</td>
                                                <td>小计</td>
                                                <td>购买人</td>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <% for (Map r : dataListshangpin) { %>

                                            <tr>
                                                <td><%= r.get("shangpinbianhao") %></td>
                                                <td><% Map mapfenlei6 = new CommDAO().find("SELECT fenleiming,id FROM fenlei where id='" + r.get("fenlei") + "'"); %>
<%= mapfenlei6.get("fenleiming") %></td>
                                                <td><%= r.get("shangpinmingcheng") %></td>
                                                <td><% if ("".equals(r.get("tupian"))) { %>
-<%} else { %><img width="100" src="<%= Info.images(r.get("tupian")) %>" /><%} %>
</td>
                                                <td><%= r.get("shoujia") %></td>
                                                <td><%= r.get("faburen") %></td>
                                                <td><%= r.get("goumaishuliang") %></td>
                                                <td><%= r.get("xiaoji") %></td>
                                                <td><%= r.get("goumairen") %></td>
                                            </tr>
                                            <%} %>

                                        </tbody>
                                    </table>
                                </div>
                                <input id="shangpin" name="shangpin" type="hidden" />
                                <script>
                                    $("#shangpin").val($("#dataListshangpin").html());
                                </script>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">订单金额</label>
                            <div class="col-sm-10">
                                <input
                                    type="number"
                                    readonly
                                    class="form-control"
                                    placeholder="输入订单金额"
                                    style="width: 150px"
                                    step="0.01"
                                    number="true"
                                    data-msg-number="输入一个有效数字"
                                    id="shangpinjine"
                                    name="shangpinjine"
                                    value="<%= request.getParameter("xiaoji") !=null ? request.getParameter("xiaoji") : "" %>"
                                />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">收货人</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" placeholder="输入收货人" style="width: 150px" id="shouhuoren" name="shouhuoren" value="<%= request.getSession().getAttribute("xingming") !=null ? request.getSession().getAttribute("xingming") : "" %>" />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">联系电话<span style="color: red">*</span></label>
                            <div class="col-sm-10">
                                <input
                                    type="text"
                                    class="form-control"
                                    placeholder="输入联系电话"
                                    style="width: 150px"
                                    data-rule-required="true"
                                    data-msg-required="请填写联系电话"
                                    phone="true"
                                    data-msg-phone="请输入正确手机号码"
                                    id="lianxidianhua"
                                    name="lianxidianhua"
                                    value="<%= request.getSession().getAttribute("lianxifangshi") !=null ? request.getSession().getAttribute("lianxifangshi") : "" %>"
                                />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">备注</label>
                            <div class="col-sm-10">
                                <textarea style="width: 80%; height: 120px" class="form-control" placeholder="输入备注" id="beizhu" name="beizhu"></textarea>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">下单人</label>
                            <div class="col-sm-10">
                                <input
                                    type="text"
                                    class="form-control"
                                    placeholder="输入下单人"
                                    style="width: 150px"
                                    readonly="readonly"
                                    id="xiadanren"
                                    name="xiadanren"
                                    value="<%= request.getSession().getAttribute("username") !=null ? request.getSession().getAttribute("username") : "" %>"
                                />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs"> </label>
                            <div class="col-sm-10">
                                <input type="hidden" name="dingdanzhuangtai" id="dingdanzhuangtai" value="待支付" />
                                <input type="hidden" name="iszf" value="否" />
                                <input type="hidden" name="referer" value="dingdanxinxi_list_xiadanren.jsp" />

                                <button type="submit" class="btn btn-primary" name="Submit">提交</button>
                                <button type="reset" class="btn btn-default" name="Submit2">重置</button>
                            </div>
                        </div>
                    </div>

                    <!--form标签结束-->
                </form>
            </div>
        </div>

        <!-- container定宽，并剧中结束 -->
    </div>

    <script>
        $(function () {
            $("#form1").validate();
        });
    </script>
</div>
<%@ include file="foot.jsp" %>

