<%@ page contentType="text/html;charset=utf-8"%> 
<%@ page import = "org.jfree.chart.ChartFactory, 
              org.jfree.chart.JFreeChart, 
              org.jfree.chart.servlet.ServletUtilities, 
              org.jfree.chart.title.TextTitle, 
              org.jfree.data.time.TimeSeries, 
              org.jfree.data.time.Month, 
              java.text.*,    
              org.jfree.chart.axis.*, 
              org.jfree.chart.plot.*,  
              org.jfree.chart.plot.XYPlot,
              java.awt.Color,
org.jfree.chart.renderer.xy.XYLineAndShapeRenderer,  
org.jfree.ui.RectangleInsets,   
              org.jfree.data.time.TimeSeriesCollection, 
              java.awt.Font"%>
              
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
            &nbsp;&nbsp;农村重点人群营养健康调研统计结果 </B>
   </FONT>
  <p></p>
  <p></p>               
<% 
//访问量统计时间线 
TimeSeries timeSeries = new TimeSeries("血压月测量值", Month.class); 
//时间曲线数据集合 
TimeSeriesCollection lineDataset = new TimeSeriesCollection(); 
//构造数据集合 
timeSeries.add(new Month(1, 2012), 112); 
timeSeries.add(new Month(2, 2012), 115); 
timeSeries.add(new Month(3, 2012), 108); 
timeSeries.add(new Month(4, 2012), 120); 
timeSeries.add(new Month(5, 2012), 118); 
timeSeries.add(new Month(6, 2012), 119); 
timeSeries.add(new Month(7, 2012), 108); 
timeSeries.add(new Month(8, 2012), 110); 
timeSeries.add(new Month(9, 2012), 116); 
timeSeries.add(new Month(10, 2012), 110); 
timeSeries.add(new Month(11, 2012), 105); 
timeSeries.add(new Month(12, 2012), 108); 
lineDataset.addSeries(timeSeries); 
JFreeChart chart = ChartFactory.createTimeSeriesChart("血压月测量值折线图", "月份", "血压测量值", lineDataset, true, true, true); 
//设置子标题 

TextTitle subtitle = new TextTitle("2012年", new Font("黑体", Font.BOLD, 12)); 
chart.addSubtitle(subtitle); 
//设置主标题 
chart.setTitle(new TextTitle("XXX患者血压月测量值折线图", new Font("隶书", Font.ITALIC, 15)));        
XYPlot plot = (XYPlot) chart.getPlot();
XYLineAndShapeRenderer xylineandshaperenderer = (XYLineAndShapeRenderer)plot.getRenderer();
SimpleDateFormat format = new SimpleDateFormat("yyyy-MM");
DateAxis axis = (DateAxis) plot.getDomainAxis(); 
axis.setDateFormatOverride(format);
plot.setBackgroundPaint(Color.white);//设置网格背景颜色
plot.setDomainGridlinePaint(Color.pink);//设置网格竖线颜色
plot.setRangeGridlinePaint(Color.pink);//设置网格横线颜色
plot.setAxisOffset(new RectangleInsets(0D, 0D, 0D, 10D));//设置曲线图与xy轴的距离，即曲线与xy轴贴近的距离
xylineandshaperenderer.setBaseShapesVisible(true);//设置曲线是否显示数据点        
Font font = new Font("SimSun", 10, 20);          
plot.getRangeAxis().setLabelFont(font);  
chart.getLegend().setItemFont(font);
axis.setLabelFont(font);
chart.setAntiAlias(true); 
String filename = ServletUtilities.saveChartAsPNG(chart, 500, 300, null, session); 
String graphURL = request.getContextPath() + "/DisplayChart?filename=" + filename; 
%> 
&nbsp;&nbsp;<img src="<%= graphURL %>"width=500 height=300 border=0 usemap="#<%= filename %>"> 
 <form action="welcome.jsp">
      &nbsp;&nbsp; <input type="submit" value="返回" />
 </form>
</body>
</html>