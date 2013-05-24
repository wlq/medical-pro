<%@ page contentType="text/html;charset=utf-8"%> 
<%@ page import="org.jfree.chart.*,
                 java.awt.Font,
                 org.jfree.chart.servlet.ServletUtilities, 
                 org.jfree.util.Rotation, 
                 org.jfree.chart.title.TextTitle,
                 org.jfree.data.general.DefaultPieDataset,
                 org.jfree.chart.labels.StandardPieSectionLabelGenerator, 
                 org.jfree.chart.plot.PiePlot,
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
            &nbsp;&nbsp;农村重点人群营养健康调研统计结果 </B>
   </FONT>
  <p></p>
  <p></p>
<% 
//设置数据集 
DefaultPieDataset dataset = new DefaultPieDataset(); 
dataset.setValue("菜籽油", 0.5); 
dataset.setValue("豆油", 0.2); 
dataset.setValue("花生油", 0.2); 
dataset.setValue("动物油", 0.1); 
dataset.setValue("其他", 0.1);
//通过工厂类生成JFreeChart对象 
JFreeChart chart = ChartFactory.createPieChart3D("烹饪油使用情况分布图", dataset, true,false, false); 
//获得3D的水晶饼图对象 
/*
Font titleFont = new Font("宋体", Font.BOLD , 25) ; // 图片标题
chart.setTitle(new TextTitle(chart.getTitle().getText(),titleFont));

Font kfont = new Font("宋体",Font.PLAIN,12) ;// 底部
chart.getLegend().setItemFont(kfont);

PiePlot  pieplot = (PiePlot)chart.getPlot();
//设置图片内部字体 
pieplot.setLabelFont(kfont);
//设置开始角度 
pieplot.setStartAngle(150D); 
//设置方向为”顺时针方向“ 
pieplot.setDirection(Rotation.CLOCKWISE); 
//设置透明度，0.5F为半透明，1为不透明，0为全透明 
pieplot.setExplodePercent("豆油",0.2);
pieplot.setForegroundAlpha(1); 
pieplot.setNoDataMessage("无数据显示"); */

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
      &nbsp;&nbsp; <input type="submit" value="返回" />
 </form>
</body>
</html>
