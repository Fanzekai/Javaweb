<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
 <%@ page language="java" import="java.util.*" %>
 <%@page import="util.*" %>


<li>
    <a href="javascript:;">
        <i class="iconfont left-nav-li" lay-tips="账号管理">&#xe6a7;</i>
        <cite>账号管理</cite>
        <i class="iconfont nav_right">&#xe697;</i>
    </a>
    <ul class="sub-menu">
        <li>
            <a onclick="xadmin.add_tab('管理员账号管理','admins_list.jsp')">
                <i class="iconfont">&#xe6a7;</i>
                <cite>管理员账号管理</cite>
            </a>
        </li>
        <li>
            <a onclick="xadmin.add_tab('管理员账号添加','admins_add.jsp')">
                <i class="iconfont">&#xe6a7;</i>
                <cite>管理员账号添加</cite>
            </a>
        </li>
        <li>
            <a onclick="xadmin.add_tab('密码修改','mod.jsp')">
                <i class="iconfont">&#xe6a7;</i>
                <cite>密码修改</cite>
            </a>
        </li>
    </ul>
</li>
<li>
    <a href="javascript:;">
        <i class="iconfont left-nav-li" lay-tips="用户管理">&#xe6a7;</i>
        <cite>用户管理</cite>
        <i class="iconfont nav_right">&#xe697;</i>
    </a>
    <ul class="sub-menu">
        <li>
            <a onclick="xadmin.add_tab('用户添加','yonghu_add.jsp')">
                <i class="iconfont">&#xe6a7;</i>
                <cite>用户添加</cite>
            </a>
        </li>
        <li>
            <a onclick="xadmin.add_tab('用户查询','yonghu_list.jsp')">
                <i class="iconfont">&#xe6a7;</i>
                <cite>用户查询</cite>
            </a>
        </li>
    </ul>
</li>
<li>
    <a href="javascript:;">
        <i class="iconfont left-nav-li" lay-tips="农户管理">&#xe6a7;</i>
        <cite>农户管理</cite>
        <i class="iconfont nav_right">&#xe697;</i>
    </a>
    <ul class="sub-menu">
        <li>
            <a onclick="xadmin.add_tab('农户添加','nonghu_add.jsp')">
                <i class="iconfont">&#xe6a7;</i>
                <cite>农户添加</cite>
            </a>
        </li>
        <li>
            <a onclick="xadmin.add_tab('农户查询','nonghu_list.jsp')">
                <i class="iconfont">&#xe6a7;</i>
                <cite>农户查询</cite>
            </a>
        </li>
    </ul>
</li>
<li>
    <a href="javascript:;">
        <i class="iconfont left-nav-li" lay-tips="摊位管理">&#xe6a7;</i>
        <cite>摊位管理</cite>
        <i class="iconfont nav_right">&#xe697;</i>
    </a>
    <ul class="sub-menu">
        <li>
            <a onclick="xadmin.add_tab('区域添加','quyu_add.jsp')">
                <i class="iconfont">&#xe6a7;</i>
                <cite>区域添加</cite>
            </a>
        </li>
        <li>
            <a onclick="xadmin.add_tab('区域查询','quyu_list.jsp')">
                <i class="iconfont">&#xe6a7;</i>
                <cite>区域查询</cite>
            </a>
        </li>
        <li>
            <a onclick="xadmin.add_tab('摊位添加','tanwei_add.jsp')">
                <i class="iconfont">&#xe6a7;</i>
                <cite>摊位添加</cite>
            </a>
        </li>
        <li>
            <a onclick="xadmin.add_tab('摊位查询','tanwei_list.jsp')">
                <i class="iconfont">&#xe6a7;</i>
                <cite>摊位查询</cite>
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
            <a onclick="xadmin.add_tab('分类添加','fenlei_add.jsp')">
                <i class="iconfont">&#xe6a7;</i>
                <cite>分类添加</cite>
            </a>
        </li>
        <li>
            <a onclick="xadmin.add_tab('分类查询','fenlei_list.jsp')">
                <i class="iconfont">&#xe6a7;</i>
                <cite>分类查询</cite>
            </a>
        </li>
        <li>
            <a onclick="xadmin.add_tab('商品添加','shangpin_add.jsp')">
                <i class="iconfont">&#xe6a7;</i>
                <cite>商品添加</cite>
            </a>
        </li>
        <li>
            <a onclick="xadmin.add_tab('商品查询','shangpin_list.jsp')">
                <i class="iconfont">&#xe6a7;</i>
                <cite>商品查询</cite>
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
            <a onclick="xadmin.add_tab('订单查询','dingdanxinxi_list.jsp')">
                <i class="iconfont">&#xe6a7;</i>
                <cite>订单查询</cite>
            </a>
        </li>
        <li>
            <a onclick="xadmin.add_tab('销售查询','dingdanxinxishangpin_list.jsp')">
                <i class="iconfont">&#xe6a7;</i>
                <cite>销售查询</cite>
            </a>
        </li>
    </ul>
</li>
<li>
    <a href="javascript:;">
        <i class="iconfont left-nav-li" lay-tips="公告消息管理">&#xe6a7;</i>
        <cite>公告消息管理</cite>
        <i class="iconfont nav_right">&#xe697;</i>
    </a>
    <ul class="sub-menu">
        <li>
            <a onclick="xadmin.add_tab('发布公告','gonggaoxiaoxi_add.jsp')">
                <i class="iconfont">&#xe6a7;</i>
                <cite>发布公告</cite>
            </a>
        </li>
        <li>
            <a onclick="xadmin.add_tab('公告查询','gonggaoxiaoxi_list.jsp')">
                <i class="iconfont">&#xe6a7;</i>
                <cite>公告查询</cite>
            </a>
        </li>
    </ul>
</li>
<li>
    <a href="javascript:;">
        <i class="iconfont left-nav-li" lay-tips="系统管理">&#xe6a7;</i>
        <cite>系统管理</cite>
        <i class="iconfont nav_right">&#xe697;</i>
    </a>
    <ul class="sub-menu">
        <li>
            <a onclick="xadmin.add_tab('留言管理','liuyanban_list.jsp')">
                <i class="iconfont">&#xe6a7;</i>
                <cite>留言管理</cite>
            </a>
        </li>
        <li>
            <a onclick="xadmin.add_tab('轮播图添加','lunbotu_add.jsp')">
                <i class="iconfont">&#xe6a7;</i>
                <cite>轮播图添加</cite>
            </a>
        </li>
        <li>
            <a onclick="xadmin.add_tab('轮播图查询','lunbotu_list.jsp')">
                <i class="iconfont">&#xe6a7;</i>
                <cite>轮播图查询</cite>
            </a>
        </li>
        <li>
            <a onclick="xadmin.add_tab('友情连接添加','youqinglianjie_add.jsp')">
                <i class="iconfont">&#xe6a7;</i>
                <cite>友情连接添加</cite>
            </a>
        </li>
        <li>
            <a onclick="xadmin.add_tab('友情连接查询','youqinglianjie_list.jsp')">
                <i class="iconfont">&#xe6a7;</i>
                <cite>友情链接查询</cite>
            </a>
        </li>

        <li>
            <a onclick="xadmin.add_tab('销售报表','xiaoshoubaobiaosss.jsp')">
                <i class="iconfont">&#xe6a7;</i>
                <cite>销售报表</cite>
            </a>
        </li>
    </ul>
</li>

