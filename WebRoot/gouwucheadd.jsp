<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
 <%@ page language="java" import="java.util.*" %>
 <%@page import="util.*" %>
 <%
if ((String) request.getSession().getAttribute("username") == null || "".equals(request.getSession().getAttribute("username"))) {
    out.print("<script>javascript:alert('对不起，您已超时或未登陆！');window.history.go(-1);</script>");
    return;
}
%>
<%@ include file="head.jsp" %>
 <%@ include file="header.jsp" %>

<script src="js/jquery.validate.js"></script>

<% if (null == request.getParameter("id") || "".equals(request.getParameter("id"))) { %>

<script>
    alert("非法操作");
    history.go(-1);
</script>
<% out.close(); %>
 <%} %>
 <% Map readMap = Query.make("shangpin").where("id", request.getParameter("id")).find(); %>


<div class="container">
    <!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->

    <div class="panel panel-default">
        <div class="panel-heading">添加购物车:</div>
        <div class="panel-body">
            <form action="gouwuche.jsp?a=insert" method="post" name="form1" id="form1">
                <!-- form 标签开始 -->

                <input type="hidden" name="shangpinid" value="<%= request.getParameter("id") !=null ? request.getParameter("id") : "" %>" />
                <div class="form-group">
                    <div class="row">
                        <label style="text-align: right" class="col-sm-2 hiddex-xs">商品编号</label>
                        <div class="col-sm-10"><%= readMap.get("shangpinbianhao") %><input type="hidden" id="shangpinbianhao" name="shangpinbianhao" value="<%= Info.html(readMap.get("shangpinbianhao")) %>" /></div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="row">
                        <label style="text-align: right" class="col-sm-2 hiddex-xs">分类</label>
                        <div class="col-sm-10"><% Map mapfenlei7 = new CommDAO().find("SELECT fenleiming,id FROM fenlei where id='" + readMap.get("fenlei") + "'"); %>
<%= mapfenlei7.get("fenleiming") %><input type="hidden" id="fenlei" name="fenlei" value="<%= Info.html(readMap.get("fenlei")) %>" /></div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="row">
                        <label style="text-align: right" class="col-sm-2 hiddex-xs">商品名称</label>
                        <div class="col-sm-10"><%= readMap.get("shangpinmingcheng") %><input type="hidden" id="shangpinmingcheng" name="shangpinmingcheng" value="<%= Info.html(readMap.get("shangpinmingcheng")) %>" /></div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="row">
                        <label style="text-align: right" class="col-sm-2 hiddex-xs">图片</label>
                        <div class="col-sm-10">
                            <% if ("".equals(readMap.get("tupian"))) { %>
-<%} else { %><img width="100" src="<%= Info.images(readMap.get("tupian")) %>" /><%} %>
<input
                                type="hidden"
                                id="tupian"
                                name="tupian"
                                value="<%= Info.html(readMap.get("tupian")) %>"
                            />
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="row">
                        <label style="text-align: right" class="col-sm-2 hiddex-xs">售价</label>
                        <div class="col-sm-10"><%= readMap.get("shoujia") %><input type="hidden" id="shoujia" name="shoujia" value="<%= Info.html(readMap.get("shoujia")) %>" /></div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="row">
                        <label style="text-align: right" class="col-sm-2 hiddex-xs">发布人</label>
                        <div class="col-sm-10"><%= readMap.get("faburen") %><input type="hidden" id="faburen" name="faburen" value="<%= Info.html(readMap.get("faburen")) %>" /></div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="row">
                        <label style="text-align: right" class="col-sm-2 hiddex-xs">购买数量<span style="color: red">*</span></label>
                        <div class="col-sm-10">
                            <input
                                type="number"
                                class="form-control"
                                placeholder="输入购买数量"
                                style="width: 150px"
                                data-rule-required="true"
                                data-msg-required="请填写购买数量"
                                number="true"
                                data-msg-number="输入一个有效数字"
                                min="1"
                                max="<%= readMap.get("kucun") %>"
                                id="goumaishuliang"
                                name="goumaishuliang"
                                value=""
                            />
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="row">
                        <label style="text-align: right" class="col-sm-2 hiddex-xs">购买人</label>
                        <div class="col-sm-10">
                            <input
                                type="text"
                                class="form-control"
                                placeholder="输入购买人"
                                style="width: 150px"
                                readonly="readonly"
                                id="goumairen"
                                name="goumairen"
                                value="<%= request.getSession().getAttribute("username") !=null ? request.getSession().getAttribute("username") : "" %>"
                            />
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="row">
                        <label style="text-align: right" class="col-sm-2 hiddex-xs"> </label>
                        <div class="col-sm-10">
                            <input name="referer" id="referers" class="referers" value="<%=request.getHeader("referer") %>" type="hidden" />
                            <script>
                                $(function () {
                                    $("input.referers").val(document.referrer);
                                });
                            </script>

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

<%@ include file="footer.jsp" %>
 <%@ include file="foot.jsp" %>

