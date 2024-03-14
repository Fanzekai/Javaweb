<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.util.*" %>
<%@page import="util.*" %>
<%@ include file="head.jsp" %>

<script src="js/jquery.validate.js"></script>
<link rel="stylesheet" href="js/layer/theme/default/layer.css"/>
<script src="js/layer/layer.js"></script>
<link href="js/h5upload/h5upload.css" rel="stylesheet"/>
<script src="js/h5upload/h5upload.js"></script>
<link rel="stylesheet" href="js/umeditor/themes/default/css/umeditor.css"/>
<script src="js/umeditor/umeditor.config.js"></script>
<script src="js/umeditor/umeditor.min.js"></script>
<script>
    window.searchSelectUrl = "ajax.jsp?a=selectUpdate";
    window.selectUpdateUrl = "ajax.jsp?a=table";
</script>
<script src="js/selectUpdate.js"></script>

<div style="padding: 10px" class="admin-content">
    <% if (request.getSession().getAttribute("username") == null || "".equals(request.getSession().getAttribute("username"))) { %>

    <script>
        alert("对不起,请您先登陆!");
        location.href = "login.jsp";
    </script>
    <%
            return;
        }
    %>

    <div class="container">
        <!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->

        <div class="panel panel-default">
            <div class="panel-heading">添加商品:</div>
            <div class="panel-body">
                <form action="shangpin.jsp?a=insert" method="post" name="form1" id="form1">
                    <!-- form 标签开始 -->

                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">商品编号</label>
                            <div class="col-sm-10">
                                <input
                                        type="text"
                                        class="form-control"
                                        placeholder="输入商品编号"
                                        style="width: 150px"
                                        readonly="readonly"
                                        id="shangpinbianhao"
                                        name="shangpinbianhao"
                                        value="<%= Info.getID() %>"
                                />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">分类</label>
                            <div class="col-sm-10">
                                <select class="form-control class_fenlei7" data-value="" id="fenlei" name="fenlei"
                                        style="width: 250px">
                                    <% List<Map> select = new CommDAO().select("SELECT * FROM fenlei ORDER BY id desc"); %>
                                    <% for (Map m : select) { %>

                                    <option value="<%= m.get("id") %>"><%= m.get("fenleiming") %>
                                    </option>
                                    <%} %>

                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">商品名称</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" placeholder="输入商品名称" style="width: 250px"
                                       id="shangpinmingcheng" name="shangpinmingcheng" value=""/>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">图片</label>
                            <div class="col-sm-10">
                                <input type="hidden" id="tupian" name="tupian" value=""/>
                                <script>
                                    showUploadImages("#tupian", "upload.html");
                                </script>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">售价</label>
                            <div class="col-sm-10">
                                <input
                                        type="number"
                                        class="form-control"
                                        placeholder="输入售价"
                                        style="width: 150px"
                                        step="0.01"
                                        number="true"
                                        data-msg-number="输入一个有效数字"
                                        id="shoujia"
                                        name="shoujia"
                                        value=""
                                />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">库存<span
                                    style="color: red">*</span></label>
                            <div class="col-sm-10">
                                <input
                                        type="number"
                                        class="form-control"
                                        placeholder="输入库存"
                                        style="width: 150px"
                                        data-rule-required="true"
                                        data-msg-required="请填写库存"
                                        number="true"
                                        data-msg-number="输入一个有效数字"
                                        id="kucun"
                                        name="kucun"
                                        value=""
                                />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">详情</label>
                            <div class="col-sm-10">
                                <textarea id="xiangqing" name="xiangqing"
                                          style="max-width: 750px; width: 100%; height: 300px"></textarea>
                                <script>
                                    (function () {
                                        var um = UM.getEditor("xiangqing");
                                    })();
                                </script>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">摊位<span
                                    style="color: red">*</span></label>
                            <div class="col-sm-10">
                                <div class="form-inline">
                                    <select
                                            class="form-control"
                                            data-fields="tanweihao,quyu"
                                            data-rule-required="true"
                                            data-msg-required="请填写摊位"
                                            id="tanwei"
                                            name="tanwei"
                                            onchange="getAjaxData('tanwei',this,this.value)"
                                    >
                                        <option value="">请选择摊位</option>
                                    </select>
                                    关键词：<input type="text" class="form-control" id="tanwei_keyword" value=""/>
                                    <select class="form-control class_quyu_search8" data-value="" id="quyu_search"
                                            name="quyu_search">
                                        <option value="">请选择</option>
                                        <% select = new CommDAO().select("SELECT * FROM quyu ORDER BY id desc"); %>
                                        <% for (Map m : select) { %>

                                        <option value="<%= m.get("id") %>"><%= m.get("quyuming") %>
                                        </option>
                                        <%} %>

                                    </select>
                                    <button type="button" class="btn btn-default" onclick="tanwei_select_update()">搜索
                                    </button>





                                    <script>
                                        function tanwei_select_update() {
                                            var keyword = $("#tanwei_keyword").val();
                                            var where = {};
                                            where.id='<%= Query.make("tanwei").where("id",session.getAttribute("suozaitanwei")).find().get("id") %>';
                                            if ($("#quyu_search").val() != "") where.quyu = $("#quyu_search").val();
                                            searchSelect("tanwei", "tanwei", keyword, where, "tanweihao,quyu".split(","), "".split(","));
                                        }

                                        tanwei_select_update();
                                    </script>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">摊位号</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control select-update" placeholder="输入摊位号"
                                       style="width: 150px" id="tanweihao" name="tanweihao" value=""/>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">区域</label>
                            <div class="col-sm-10">
                                <select class="form-control select-update" data-value="" id="quyu" name="quyu"
                                        style="width: 250px">
                                    <% select = new CommDAO().select("SELECT * FROM quyu ORDER BY id desc"); %>
                                    <% for (Map m : select) { %>

                                    <option value="<%= m.get("id") %>"><%= m.get("quyuming") %>
                                    </option>
                                    <%} %>

                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">发布人</label>
                            <div class="col-sm-10">
                                <input
                                        type="text"
                                        class="form-control"
                                        placeholder="输入发布人"
                                        style="width: 150px"
                                        readonly="readonly"
                                        id="faburen"
                                        name="faburen"
                                        value="<%= request.getSession().getAttribute("username") !=null ? request.getSession().getAttribute("username") : "" %>"
                                />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs"> </label>
                            <div class="col-sm-10">
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

