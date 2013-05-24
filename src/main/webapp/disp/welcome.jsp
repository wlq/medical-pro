<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
   </br>
   </br>
   <FONT  SIZE=5>  <B>
        &nbsp;&nbsp;    农村重点人群营养健康调研统计结果 </B>
   </FONT>
   </br>
   </br>
   </br>
   <font size=3>
      &nbsp;&nbsp; 请选择您要查询的统计信息数据项名称：
   </font>           
     <form method="post" action="action.jsp">     
     <font size=3> &nbsp;&nbsp; 请选择要查询的统计信息：<select name="choice">
                   <option value="bean" selected>豆类食用情况分类统计</option>     
                   <option value="meat">肉类食用情况分类统计</option>
                   <option value="diet">日常膳食分类统计</option>
                   <option value="edoil">烹饪油使用情况分类统计</option>                   
                   <option value="blopress">个人年均血压值统计</option>
                   </select>				   
     </font>   
   </br>
   </br>
   </br>     
      &nbsp;&nbsp;<input type="submit" value="提交"/>   <input type="reset" value="取消" />
   </form>   
  </div>
</body>
</html>