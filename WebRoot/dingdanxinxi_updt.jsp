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
    } %> <%
     String updtself = "0"; // 设置更新
     HashMap mmm = new CommDAO().getmap(request.getParameter("id"), "dingdanxinxi");
     %>


    <div class="container">
        <!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->

        <div class="panel panel-default">
            <div class="panel-heading">编辑订单信息:</div>
            <div class="panel-body">
                <form action="dingdanxinxi.jsp?a=update" method="post" name="form1" id="form1">
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
                                    value="<%= Info.html(mmm.get("dingdanbianhao")) %>"
                                />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">商品</label>
                            <div class="col-sm-10">
                                <div id="dataListshangpin">
                                    <% List<Map> shangpinList = Query.make("dingdanxinxishangpin").where("dingdanxinxiid", mmm.get("id")).order("id desc").select(); %>

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
                                            <% for (Map r : shangpinList) { %>

                                            <tr>
                                                <td><%= r.get("shangpinbianhao") %></td>
                                                <td><% Map mapfenlei8 = new CommDAO().find("SELECT fenleiming,id FROM fenlei where id='" + r.get("fenlei") + "'"); %>
<%= mapfenlei8.get("fenleiming") %></td>
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
                                <input id="shangpin" name="shangpin" type="hidden" value="<%= Info.html(mmm.get("shangpin")) %>" />
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
                                    value="<%= Info.html(mmm.get("shangpinjine")) %>"
                                />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">收货人</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" placeholder="输入收货人" style="width: 150px" id="shouhuoren" name="shouhuoren" value="<%= Info.html(mmm.get("shouhuoren")) %>" />
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
                                    value="<%= Info.html(mmm.get("lianxidianhua")) %>"
                                />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">备注</label>
                            <div class="col-sm-10">
                                <textarea style="width: 80%; height: 120px" class="form-control" placeholder="输入备注" id="beizhu" name="beizhu"><%= Info.html(mmm.get("beizhu")) %></textarea>
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
                                    value="<%= mmm.get("xiadanren") %>"
                                />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs"> </label>
                            <div class="col-sm-10">
                                <input name="id" value="<%= mmm.get("id") %>" type="hidden" />
                                <input name="referer" value="<%=request.getHeader("referer") %>" type="hidden" />
                                <input name="updtself" value="<%= updtself %>" type="hidden" />

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

