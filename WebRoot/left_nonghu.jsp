<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
 <%@ page language="java" import="java.util.*" %>
 <%@page import="util.*" %>


<li>
    <a href="javascript:;">
        <i class="iconfont left-nav-li" lay-tips="个人中心">&#xe6a7;</i>
        <cite>个人中心</cite>
        <i class="iconfont nav_right">&#xe697;</i>
    </a>
    <ul class="sub-menu">
        <li>
            <a onclick="xadmin.add_tab('修改个人资料','nonghu_updtself.jsp')">
                <i class="iconfont">&#xe6a7;</i>
                <cite>修改个人资料</cite>
            </a>
        </li>
        <li>
            <a onclick="xadmin.add_tab('修改密码','mod.jsp')">
                <i class="iconfont">&#xe6a7;</i>
                <cite>修改密码</cite>
            </a>
        </li>
        <li>
            <a onclick="xadmin.add_tab('个人信息','nonghu_list.jsp')">
                <i class="iconfont">&#xe6a7;</i>
                <cite>个人信息</cite>
            </a>
        </li>
    </ul>
</li>
<li>
    <a href="javascript:;">
        <i class="iconfont left-nav-li" lay-tips="商品管理">&#xe6a7;</i>
        <cite>商品管理</cite>
        <i class="iconfont nav_right">&#xe697;</i>
    </a>
    <ul class="sub-menu">
        <li>
            <a onclick="xadmin.add_tab('商品添加','shangpin_add2.jsp')">
                <i class="iconfont">&#xe6a7;</i>
                <cite>商品添加</cite>
            </a>
        </li>
        <li>
            <a onclick="xadmin.add_tab('商品查询','shangpin_list_faburen.jsp')">
                <i class="iconfont">&#xe6a7;</i>
                <cite>商品查询</cite>
            </a>
        </li>
    </ul>
</li>
<li>
    <a href="javascript:;">
        <i class="iconfont left-nav-li" lay-tips="销售管理">&#xe6a7;</i>
        <cite>销售管理</cite>
        <i class="iconfont nav_right">&#xe697;</i>
    </a>
    <ul class="sub-menu">
        <li>
            <a onclick="xadmin.add_tab('销售查询','dingdanxinxishangpin_list_faburen.jsp')">
                <i class="iconfont">&#xe6a7;</i>
                <cite>销售查询</cite>
            </a>
        </li>
    </ul>
</li>
