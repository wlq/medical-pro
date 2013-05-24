<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.mysql.jdbc.Driver" %>

<%@ page import="java.sql.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'newsdetail.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
   <%
   
   String driverName="com.mysql.jdbc.Driver";
   
   String userName="root";

//密码

String userPasswd="root";

//数据库名

String dbName="ss";

//表名

String tableName="tnews";

//联结字符串
String cid = request.getParameter("id");
String url="jdbc:mysql://localhost/"+dbName+"?user="+userName+"&password="+userPasswd;

Class.forName("com.mysql.jdbc.Driver").newInstance();

Connection connection=DriverManager.getConnection(url);

Statement statement = connection.createStatement();

String sql="SELECT CDESC,CPNAME,CNAME FROM tnews WHERE CID ='"+cid+"'";
ResultSet rs = statement.executeQuery(sql);
while(rs.next()) {%>
<%
String filename = rs.getString(2);
String content = rs.getString(1);
String cname = rs.getString(3);
content = content.replaceAll("\n", "<br>");
System.out.println(content);
 %>
标题:<%=cname %>
<div>
 图片:<img src="<%=request.getContextPath()%>/servlet/showImage?filename=<%=filename%>"/>
 </div>
 <p>内容:<%=content %></p>
<%
}
ResultSetMetaData rmeta = rs.getMetaData();
rs.close();
statement.close();
connection.close(); 
%>
    
    
    
    
    
  </body>
</html>
