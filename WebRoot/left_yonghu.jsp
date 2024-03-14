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
            <a onclick="xadmin.add_tab('修改个人资料','yonghu_updtself.jsp')">
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
            <a onclick="xadmin.add_tab('我的收藏','shoucang_list_username.jsp')">
                <i class="iconfont">&#xe6a7;</i>
                <cite>我的收藏</cite>
            </a>
        </li>
        <li>
            <a onclick="xadmin.add_tab('我的留言','liuyanban_list_liuyanren.jsp')">
                <i class="iconfont">&#xe6a7;</i>
                <cite>我的留言</cite>
            </a>
        </li>
    </ul>
</li>
<li>
    <a href="javascript:;">
        <i class="iconfont left-nav-li" lay-tips="购物车管理">&#xe6a7;</i>
        <cite>购物车管理</cite>
        <i class="iconfont nav_right">&#xe697;</i>
    </a>
    <ul class="sub-menu">
        <li>
            <a onclick="xadmin.add_tab('我的购物车','gouwuche_list_goumairen.jsp')">
                <i class="iconfont">&#xe6a7;</i>
                <cite>我的购物车</cite>
            </a>
        </li>
    </ul>
</li>
<li>
    <a href="javascript:;">
        <i class="iconfont left-nav-li" lay-tips="订单信息管理">&#xe6a7;</i>
        <cite>订单信息管理</cite>
        <i class="iconfont nav_right">&#xe697;</i>
    </a>
    <ul class="sub-menu">
        <li>
            <a onclick="xadmin.add_tab('订单查询','dingdanxinxi_list_xiadanren.jsp')">
                <i class="iconfont">&#xe6a7;</i>
                <cite>订单查询</cite>
            </a>
        </li>
    </ul>
</li>
