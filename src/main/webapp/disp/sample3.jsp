<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="org.jfree.chart.ChartFactory, 
org.jfree.chart.JFreeChart,
org.jfree.chart.servlet.ServletUtilities,
org.jfree.chart.plot.PlotOrientation,
org.jfree.data.category.CategoryDataset,
org.jfree.data.general.DatasetUtilities,
org.jfree.chart.plot.*,
org.jfree.chart.labels.*,
org.jfree.chart.renderer.category.BarRenderer3D,
java.awt.*,
java.awt.Font,
org.jfree.ui.*,
org.jfree.chart.title.TextTitle,
org.jfree.chart.axis.AxisLocation"%>
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
           &nbsp;&nbsp; 农村重点人群营养健康调研统计结果 </B>
   </FONT>
  <p></p>
  <p></p>
<%
double[][] data = new double[][]{{1310,1220,1110,1000},
{720,700,680,640},
{1130,1020,980,800},
{440,400,360,300}};
String[] rowKeys = {"谷物类","豆类","蔬菜","水果"};
String[] columnKeys = {"<=18","19--35","35--60",">=61"};
CategoryDataset dataset = DatasetUtilities.createCategoryDataset(rowKeys,columnKeys,data);
JFreeChart chart=ChartFactory.createBarChart3D("不同年龄人群日常膳食统计图", "年龄段", "摄入量", dataset, PlotOrientation.VERTICAL, true, true, false);

CategoryPlot plot= chart.getCategoryPlot();
//设置网格背景颜色
plot.setBackgroundPaint(Color.white);
//设置网格竖线颜色
plot.setDomainGridlinePaint(Color.pink);
//设置网格横线颜色
plot.setRangeGridlinePaint(Color.pink);
//显示每个柱的数值，并修改该数值的字体属性

Font titleFont = new Font("宋体", Font.BOLD , 25) ; // 图片标题
chart.setTitle(new TextTitle(chart.getTitle().getText(),titleFont));

Font kfont = new Font("宋体",Font.PLAIN,15) ;// 底部
chart.getLegend().setItemFont(kfont);
chart.getCategoryPlot().getRangeAxis().setLabelFont(kfont);
chart.getCategoryPlot().getDomainAxis().setLabelFont(kfont);

BarRenderer3D renderer = new BarRenderer3D();
//renderer.setBaseItemLabelGenerator(new StandardCategoryItemLabelGenerator());
renderer.setBaseItemLabelGenerator(new StandardCategoryItemLabelGenerator());
renderer.setBaseItemLabelsVisible(true);
//默认的数字显示在柱子中，通过如下两句可调整数字的显示
//注意：此句很关键，若无此句，那数字的显示会被覆盖，给人数字没有显示出来的问题
renderer.setBasePositiveItemLabelPosition(new ItemLabelPosition(ItemLabelAnchor.OUTSIDE12,TextAnchor.BASELINE_LEFT));
plot.setRenderer(renderer);
//设置地区、销量的显示位置，将下方的”肉类“放到上方
plot.setDomainAxisLocation(AxisLocation.TOP_OR_RIGHT);
//将默认放在左边的”销量“放到右边
plot.setRangeAxisLocation(AxisLocation.BOTTOM_OR_RIGHT);

String filename = ServletUtilities.saveChartAsPNG(chart, 700, 400, null, session);
String graphURL=request.getContextPath()+"/DisplayChart?filename="+filename;
 %>
&nbsp;&nbsp;<img src="<%=graphURL %>"width=700 height=400 border=0 usemap="#"<%=filename %>>
 <form action="welcome.jsp">
       &nbsp;&nbsp;<input type="submit" value="返回" />
 </form>
</body>
</html>










