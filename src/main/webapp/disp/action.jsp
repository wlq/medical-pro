<%@ page language="java" import="java.sql.*,javax.sql.*" contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="java.util.*,
org.jfree.chart.ChartFactory,
org.jfree.chart.JFreeChart,
org.jfree.chart.servlet.ServletUtilities" %>
<html>
<head>
   <title>Medical Statistical Information</title>
     <link href="../css/style.css" rel="stylesheet" type="text/css"
			media="screen" />
</head>
<body>

			<div id="logo">
				<h1 align="left">
					<a href="#">农村基本医疗卫生关键技术研究与示范协同研究工作平台 </a>
				</h1>
			</div>
           			<hr />
			<!-- end #logo -->
			<div id="header">
				<div id="menu">
					<ul>
						<li class="current_page_item">
							<a href="index.jsp" class="first">首页</a>
						</li>
						<li>
							<a href="">平台介绍</a>
						</li>
						<li>
							<a href="#">近期动态</a>
						</li>
						<li>
							<a href="#">资源下载</a>
						</li>
						<li>
							<a href="#">联系我们</a>
						</li>
					</ul>
				</div>
				<!-- end #menu -->
				<div id="search">
					<form method="get" action="">
						<fieldset>
							<input type="text" name="s" id="search-text" size="15" />
							<input type="submit" id="search-submit" value="GO" />
						</fieldset>
					</form>
				</div>
				<!-- end #search -->
			</div>



  <div>
  <h2>农村医疗信息统计结果   </h2>
  <p></p>
  <p></p>
<%
  String choice=(String)request.getParameter("choice");  
  RequestDispatcher rd = null;
 
  if(choice.equals("bean"))
  {
     rd=request.getRequestDispatcher("sample1.jsp");
     rd.forward(request,response);  
     return;
  }
  else if(choice.equals("meat"))
  {  
     rd=request.getRequestDispatcher("sample2.jsp");
     rd.forward(request,response);  
     return;
  }
  else if(choice.equals("diet"))
  {  
     rd=request.getRequestDispatcher("sample3.jsp");
     rd.forward(request,response);  
     return;
  }
  else if(choice.equals("edoil"))
  {  
     rd=request.getRequestDispatcher("sample4.jsp");
     rd.forward(request,response);  
     return;
  }
  else
  { 
       rd=request.getRequestDispatcher("sample5.jsp");
       rd.forward(request,response);  
  }
%>
 <form action="welcome.jsp">
       <input type="submit" value="返回" />
 </form>
 </div>
</body>
</html>