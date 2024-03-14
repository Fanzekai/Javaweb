<%@ page language="java" import="dao.CommDAO" pageEncoding="utf-8" %>
 <%@page import="java.util.HashMap" %>
 <%@page import="util.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <title>My JSP 'adminyanzheng.jsp' starting page</title>
    </head>
    <body>
        <%
        String id, biao;
        boolean isShaxiang = false;
        if (request.getParameter("out_trade_no") != null) {
            String[] out_trade_no = request.getParameter("out_trade_no").split("\\-");
            id = out_trade_no[2];
            biao = out_trade_no[1];
            isShaxiang = true;
        } else {
            id = request.getParameter("id");
            biao = request.getParameter("biao");
        }
        HashMap order = new CommDAO().getmap(id, biao);
        String sql = "update " + biao + " set iszf='是' where id='" + id + "'";
        new CommDAO().commOper(sql);
        if ("dingdanxinxi".equals(biao)) {
            new CommDAO().commOper("update dingdanxinxi set dingdanzhuangtai='已支付' where id='" + order.get("id") + "'");
        
            new CommDAO()
                .commOper(
                    "UPDATE shangpin s,dingdanxinxishangpin ds SET s.xiaoliang=s.xiaoliang+ds.goumaishuliang,s.kucun=s.kucun-ds.goumaishuliang WHERE s.id=ds.shangpinid AND dingdanxinxiid='" +
                    order.get("id") +
                    "'"
                );
        }
        
        out.print("<script>alert('支付成功!!');opener.location.reload();window.close();</script>");
        %>

    </body>
</html>
