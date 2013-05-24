<%@ page language="java" import="java.sql.*,javax.sql.*" pageEncoding="utf-8" %>
<%@ page import="java.util.*,
org.jfree.chart.ChartFactory,
java.awt.Font,
org.jfree.util.Rotation, 
org.jfree.chart.title.TextTitle,
org.jfree.chart.JFreeChart,
org.jfree.chart.plot.PlotOrientation,
org.jfree.chart.servlet.ServletUtilities,
org.jfree.data.category.CategoryDataset,
org.jfree.data.general.DatasetUtilities,
org.jfree.chart.plot.*,
org.jfree.chart.labels.*,
org.jfree.chart.renderer.category.BarRenderer3D,
java.awt.*,
java.awt.Font,
org.jfree.ui.*,
org.jfree.chart.title.TextTitle,
org.jfree.chart.axis.AxisLocation,
org.jfree.data.jdbc.JDBCPieDataset, 
org.jfree.chart.plot.PiePlot,
org.jfree.chart.plot.PlotOrientation,
org.jfree.chart.labels.StandardPieSectionLabelGenerator,
java.text.NumberFormat"%>

<html>
<head>
    <title>Statistical Information</title>
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

   </br>
   </br>			
 <FONT  SIZE=5>  <B>
        &nbsp;&nbsp;    农村重点人群营养健康调研统计结果 </B>
   </FONT>
  <p></p>
  <p></p>
<%
     //jdbc.mysql operation
 	 	 
	 JFreeChart chart=null;
     JDBCPieDataset dataset = null;
 	 
	 try{
		Class.forName("com.mysql.jdbc.Driver");
		 String userName="root";
//密码
  String userPasswd="root";

//数据库名

String dbName="health";
String url="jdbc:mysql://localhost/"+dbName+"?user="+userName+"&password="+userPasswd;
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection conn=DriverManager.getConnection(url);
         
         dataset=new JDBCPieDataset(conn);
         
         String sql="select name,num from meat";		 
		 dataset.executeQuery(sql);
		 
	 }catch (SQLException e){
		 out.println(e);
	 }	 
	 
	 //jfreechart operation
        chart = ChartFactory.createPieChart3D("肉类食用情况分布图", // 图表标题  
                dataset,// 数据集合  
                true,// 是否显示图例标识  
                false,// 是否显示tooltips  
                false);// 是否支持超链接  
        chart.getTitle().setFont(new Font("隶书", Font.BOLD, 25)); // 设置标题字体  
        chart.getLegend().setItemFont(new Font("宋体", Font.BOLD, 15)); // 设置图例类别字体  
  
        PiePlot plot = (PiePlot) chart.getPlot(); // 获取绘图区对象  
        plot.setForegroundAlpha(0.9F); // 设置绘图区前景色透明度  
        plot.setLabelFont(new Font("宋体", Font.PLAIN, 12)); // 设置分类标签的字体  
        plot.setCircular(true);// 设置饼形为正圆  
        // 设置分类标签的格式  
        plot.setLabelGenerator(new StandardPieSectionLabelGenerator(  
                "{0} = {2}", NumberFormat.getNumberInstance(), NumberFormat  
                        .getPercentInstance()));        
      String filename = ServletUtilities.saveChartAsPNG(chart, 500, 300, null, session);
      String graphURL = request.getContextPath() + "/DisplayChart?filename=" + filename;  
%>
&nbsp;&nbsp;<img src="<%= graphURL %>"width=500 height=300 border=0 usemap="#<%= filename %>">

 <form action="welcome.jsp">
    &nbsp;&nbsp;   <input type="submit" value="返回" />
 </form>
</body>
</html>
