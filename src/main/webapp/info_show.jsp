<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.mysql.jdbc.Driver" %>

<%@ page import="java.sql.*" %>


<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>信息发布</title>

<style type="text/css">
/* common styling */
/* set up the overall width of the menu div, the font and the margins */
*
{
 margin:0;
 padding:0;
}

.quanju{

 width:1200px;
 height:1500px;
 margin-left:100px;
border:2px solid #000;

}

.title_nav{
 widht:1200px;
 height:100px;
 text-align:center;
 background:#4169E1;
}

.title_nav h3{
margin:0 auto;
vertical-align:middle;


}

.menu {
font-family: arial, sans-serif; 
width:1200px;
height:35px;
background:#000; 
margin:0; 
margin:0px 0;
}
/* remove the bullets and set the margin and padding to zero for the unordered list */
.menu ul {
padding:0; 
margin:0;
list-style-type: none;

}
/* float the list so that the items are in a line and their position relative so that the drop down list will appear in the right place underneath each list item */
.menu ul li {
float:left; 
position:relative;
}
/* style the links to be 104px wide by 30px high with a top and right border 1px solid white. Set the background color and the font size. */
.menu ul li a{
font-family:verdana,arial,tahoma;
font-size:13px;
display:block; 
text-align:center; 
text-decoration:none; 
width:104px; 
height:35px; 
color:#fff; 
border:1px solid #fff;
border-width:1px 1px 0 0;
background:#000; 
line-height:30px; 

}

 .menu ul li a:visited{
font-family:verdana,arial,tahoma;
font-size:11px;
display:block; 
text-align:center; 
text-decoration:none; 
width:104px; 
height:35px; 
color:#fff; 
border:1px solid #fff;
border-width:1px 1px 0 0;
background:#000; 
line-height:30px; 

}
/* make the dropdown ul invisible */
.menu ul li ul {
display: none;
z-index:100;

}
/* specific to non IE browsers */
/* set the background and foreground color of the main menu li on hover */
.menu ul li:hover a {
color:#35f; 
background:#fff;
border:1px solid #35f;
}
/* make the sub menu ul visible and position it beneath the main menu list item */
.menu ul li:hover ul {
display:block; 
position:absolute; 
top:36px; 
left:0; 
width:105px;
}
/* style the background and foreground color of the submenu links */
.menu ul li:hover ul li a {
display:block; 
background:#FFFAF0; 
color:#000;
width:130px;
border:none;
}
/* style the background and forground colors of the links on hover */
.menu ul li:hover ul li a:hover {
background:#FFE7BA; 
color:#000;
width:130px;
}


.main
{
width:1200px;


}



#demo{overflow:auto; }
#yingyong_demo{overflow:auto; }
#demo li{text-align: left;line-height:1.5em; padding-left:0;background: #FFFFFF no-repeat 0 50%;display: block;margin-bottom: 1px; }
#yingyong_demo li{text-align: left;line-height:1.5em; padding-left:0;background: #FFFFFF no-repeat 0 50%;display: block;margin-bottom: 1px; }
#demo{overflow:hidden; width: 300px;height: 300px; background:#FFFFFF; margin:auto;float: left;display: inline;border:1px solid #2d90cc;}
#yingyong_demo{overflow:hidden; width: 300px;height: 300px; background:#FFFFFF; margin:auto;float: left;display: inline;border:1px solid #2d90cc;}
.guanjianjishushow h1
{width:195px; background:url(info_show_js/images/header_bg2012.gif) no-repeat;
height:32px; background-position:0 -128px;
background-repeat:repeat;font-size:14px;
font-weight:bold;padding-left:15px;
padding-top:8px;
bottom:-8px;
color:#fff; line-height:20px;
}
.yingyongshifan  h1
{width:195px; background:url(info_show_js/images/header_bg2012.gif) no-repeat;
height:32px; background-position:0 -128px;
background-repeat:repeat;font-size:14px;
font-weight:bold;padding-left:15px;
padding-top:8px;
bottom:-8px;
color:#fff; line-height:20px;
}

.xinweizhuanqu h4{ width:528px; background:url(info_show_js/images/sf_centerbg01.jpg) no-repeat; height:26px; line-height:26px; color:#fff; padding-left:15px; font-size:14px; border-bottom:2px solid #2491bd;}

 .l{width:540px;border:1px solid red;border-top:none;height:600px;}
/* 焦点图 */
.focus img{border:none;}
.focus{margin-left:50px;width:426px;height:240px;border:1px solid #EEE;position:relative;margin-top:6px;float:left}
.f426x240{width:426px;height:240px;overflow:hidden}
.f426x240 img{width:426px;height:240px}

.rslides{width:426px;position:relative;list-style:none;padding:0}
.rslides_nav{height:51px;width:31px;position:absolute;-webkit-tap-highlight-color:rgba(0,0,0,0);top:50%;left:0;opacity:0.5;text-indent:-9999px;overflow:hidden;text-decoration:none;background:url(info_show_js/images/i.png) no-repeat 0 -560px;margin-top:-28px}
.rslides_nav:active{opacity:1.0}
.rslides_nav.next{left:auto;background-position:-31px -560px;right:0}
.rslides_tabs{margin:12px auto;clear:both;text-align:center}
.rslides_tabs li{display:inline;float:none;_float:left;*float:left;margin-right:5px}
.rslides_tabs a{text-indent:-9999px;overflow:hidden;-webkit-border-radius:15px;-moz-border-radius:15px;border-radius:15px;background:rgba(0,0,0, .2);background:#DDD;display:inline-block;_display:block;*display:block;width:9px;height:9px}
.rslides_tabs .rslides_here a{background:rgba(0,0,0, .6);background:#390}

.news table td  a 
{
	font-size:14px;
	text-decoration:none;
	
}
.news table
{
	
	border-top-width: 1px;
	border-right-width: 1px;
	border-bottom-width: 1px;
	border-left-width: 1px;
	border-top-style: none;
	border-right-style: none;
	border-bottom-style: dotted;
	border-left-style: none;
	border-bottom-color: #a8a8a8;
}
</style>
<!--[if lte IE 6]>
<style type="text/css">
/* styling specific to Internet Explorer IE5.5 and IE6. Yet to see if IE7 handles li:hover */
/* Get rid of any default table style */
table {
border-collapse:collapse;
margin:0; 
padding:0;
}
/* ignore the link used by 'other browsers' */
.menu ul li a.hide, .menu ul li a:visited.hide {
display:none;
}
/* set the background and foreground color of the main menu link on hover */
.menu ul li a:hover {
color:#fff; 
background:#b3ab79;
}
/* make the sub menu ul visible and position it beneath the main menu list item */
.menu ul li a:hover ul {
display:block; 
position:absolute; 
top:32px; 
left:0; 
width:105px;
}
/* style the background and foreground color of the submenu links */
.menu ul li a:hover ul li a {
background:#faeec7; 
color:#000;
}
/* style the background and forground colors of the links on hover */
.menu ul li a:hover ul li a:hover {
background:#dfc184; 
color:#000;
}
</style>
<![endif]-->

<script type="text/javascript" src="js/jquery.js">
</script>
<script type="text/javascript" src="js/lrtk.js"></script>

<script type="text/javascript" src="<%=basePath%>/info_show_js/jquery.js" charset="utf-8"></script>
<script type="text/javascript" src="<%=basePath%>/info_show_js/lrtk.js" charset="utf-8"></script>

</head>
<body>

<div class="quanju"><!--全局div开始   <!-->

<div class="title_nav"><!--title_nva开始   <!-->
<h1>
信息发布
</h1>
</div><!--title_nav结束  <!-->



<div class="menu"><!--menu开始  <!-->
<ul>
<li><a class="hide" href="#">首页</a>
<!--[if lte IE 6]>
<a href="../menu/index.html">DEMOS
<table><tr><td>
<![endif]-->

<!--[if lte IE 6]>
</td></tr></table>
</a>
<![endif]-->
</li>
<li><a class="hide" href="#">关键技术研究</a>
<!--[if lte IE 6]>
<a href="index.html">MENUS
<table><tr><td>
<![endif]-->
    <ul>
    <li><a href="#" title="changjianbing">常见病</a></li>
    <li><a href="#" title="jizhengjiuzhi">急诊救治</a></li>
    <li><a href="#" title="maixingbingkongzhi">慢性病控制</a></li>
    <li><a href="#" title="xinnaoxieguanfangzhi">心脑血管防治</a></li>
    <li><a href="#" title="zhongniufangzhi">肿瘤防治</a></li>
    <li><a href="#" title="shuziyiliaoyiqi">数字医疗仪器</a></li>
    <li><a href="#" title="yiliaoweishengfuwu">医疗卫生服务</a></li>
     <li><a href="#" title="yiliaoweishengfuwu">综合示范</a></li>
    </ul>
<!--[if lte IE 6]>
</td></tr></table>
</a>
<![endif]-->
</li>
<li><a class="hide" href="#">应用示范</a>
<!--[if lte IE 6]>
<a href="../layouts/index.html">LAYOUTS
<table><tr><td>
<![endif]-->
    <ul>
    <li><a href="#" title="shifan1">应用示范1</a></li>
    <li><a href="#" title="shifan2">应用示范2</a></li>
    <li><a href="#" title="shifan3">应用示范3</a></li>
    <li><a href="#" title="shifan4">应用示范4</a></li>
    <li><a href="#" title="shifan5">应用示范5</a></li>
    <li><a href="#" title="shifan3">应用示范6</a></li>
    <li><a href="#" title="shifan4">应用示范7</a></li>
    <li><a href="#" title="shifan5">应用示范8</a></li>
    </ul>
<!--[if lte IE 6]>
</td></tr></table>
</a>
<![endif]-->
</li>




</ul>
<!-- clear the floats if required -->
<div class="clear"> </div>
</div><!--men结束  <!-->
<div class="main" style="margin-top:20px;width:1200px;height:1300px;"><!--men begin   <!-->

<div class="main_left" style="width:300px;height:1300px;margin-left:15px;float:left;">

<div class="guanjianjishushow" style="width:300px;height:500px;">

<h1>关键技术展示</h1>


<div id="demo" style="width:300px;position:relative;overflow:scroll;overflow-y:hidden;overflow-x:hidden;margin-top:-8px;">
<div id="demo1">
    <h4>关键技术1</h4>
    <li><P><FONT color=#ff0000>&nbsp;&nbsp;&nbsp;</FONT><FONT color=#000000>&nbsp;&nbsp;&nbsp;&nbsp; 关键技术描述<A href="http://www.yzb.bupt.cn/"></A>描述内容</FONT></P>
<P>&nbsp;</P>
<P>&nbsp;</P>

 </li>
    <h4>关键技术2</h4>
    <li><P><FONT color=#ff0000>&nbsp;&nbsp;&nbsp;</FONT><FONT color=#000000>&nbsp;&nbsp;&nbsp;&nbsp; 关键技术描述<A href="#"></A>描述内容</FONT></P>
<P>&nbsp;</P>
<P>&nbsp;</P>
 </li>
     <h4>关键技术3</h4>
    <li><P><FONT color=#ff0000>&nbsp;&nbsp;&nbsp;</FONT><FONT color=#000000>&nbsp;&nbsp;&nbsp;&nbsp; 关键技术描述<A href="#"></A>描述内容</FONT></P>
<P>&nbsp;</P>
<P>&nbsp;</P>
 </li>
     <h4>关键技术4</h4>
    <li><P><FONT color=#ff0000>&nbsp;&nbsp;&nbsp;</FONT><FONT color=#000000>&nbsp;&nbsp;&nbsp;&nbsp; 关键技术描述<A href="#"></A>描述内容</FONT></P>
<P>&nbsp;</P>
<P>&nbsp;</P>
 </li>
     <h4>关键技术5</h4>
    <li><P><FONT color=#ff0000>&nbsp;&nbsp;&nbsp;</FONT><FONT color=#000000>&nbsp;&nbsp;&nbsp;&nbsp; 关键技术描述<A href="#"></A>描述内容</FONT></P>
<P>&nbsp;</P>
<P>&nbsp;</P>
 </li>
      <h4>关键技术6</h4>
    <li><P><FONT color=#ff0000>&nbsp;&nbsp;&nbsp;</FONT><FONT color=#000000>&nbsp;&nbsp;&nbsp;&nbsp; 关键技术描述<A href="#"></A>描述内容</FONT></P>
<P>&nbsp;</P>
<P>&nbsp;</P>
 </li>
      <h4>关键技术7</h4>
    <li><P><FONT color=#ff0000>&nbsp;&nbsp;&nbsp;</FONT><FONT color=#000000>&nbsp;&nbsp;&nbsp;&nbsp; 关键技术描述<A href="#"></A>描述内容</FONT></P>
<P>&nbsp;</P>
<P>&nbsp;</P>
 </li>
       <h4>关键技术8</h4>
    <li><P><FONT color=#ff0000>&nbsp;&nbsp;&nbsp;</FONT><FONT color=#000000>&nbsp;&nbsp;&nbsp;&nbsp; 关键技术描述<A href="#"></A>描述内容</FONT></P>
<P>&nbsp;</P>
<P>&nbsp;</P>
 </li>
    </div>
<div id="demo2"> </div>
<script type="text/javascript">
 //无间断滚动代码，兼容IE、Firefox、Opera
 var speed=20;
 var FGDemo=document.getElementById('demo');
 var FGDemo1=document.getElementById('demo1');
 var FGDemo2=document.getElementById('demo2');
 FGDemo2.innerHTML=FGDemo1.innerHTML
 function Marquee1(){
 if(FGDemo2.offsetHeight-FGDemo.scrollTop<=0)
 FGDemo.scrollTop-=FGDemo1.offsetHeight
 else{
 FGDemo.scrollTop++
 }
 }
 var MyMar1=setInterval(Marquee1,speed)
 FGDemo.onmouseover=function() {clearInterval(MyMar1)}
 FGDemo.onmouseout=function() {MyMar1=setInterval(Marquee1,speed)}
</script> 
</div>
</div>
</div>
   
<div class="main_middle" style="width:550px;height:1300px;margin-left:15px;float:left;">

<div class="xinweizhuanqu" style="width:540px;">

<h4>新闻专区</h4>

<div class="l" style="width:540px" >
<div class="focus">
    <ul class="rslides f426x240">
        <li><a href="http://www.lanrentuku.com/" target="_blank"><img src="info_show_js/images/news_1.png" alt="懒人图库全新改版" /></a></li>
        <li><a href="http://www.lanrentuku.com/js/" target="_blank"><img src="info_show_js/images/news_2.png" alt="JS代码" /></a></li>
        <li><a href="http://www.lanrentuku.com/zt/book/" target="_blank"><img src="info_show_js/images/news_3.png" alt="读。书。" /></a></li>
        <li><a href="http://www.lanrentuku.com/bg/" target="_blank"><img src="info_show_js/images/news_4.png" alt="网页背景" /></a></li>
    </ul>
</div>


<div class="news" style="clear:both;padding-top:100px;margin-top:30px;margin-left:10px;width:520px;">
<%

//驱动程序名

String driverName="com.mysql.jdbc.Driver";

//数据库用户名

String userName="root";

//密码

String userPasswd="root";

//数据库名

String dbName="ss";

//表名

String tableName="tnews";

//联结字符串

String url="jdbc:mysql://localhost/"+dbName+"?user="+userName+"&password="+userPasswd;

Class.forName("com.mysql.jdbc.Driver").newInstance();

Connection connection=DriverManager.getConnection(url);

Statement statement = connection.createStatement();

String sql="SELECT * FROM "+tableName;

ResultSet rs = statement.executeQuery(sql);

//获得数据结果集合

ResultSetMetaData rmeta = rs.getMetaData();
//确定数据集的列数，亦字段数

int numColumns=rmeta.getColumnCount();

// 输出每一个数据值
while(rs.next()) {%>

<table width="515" height="22" border="0" cellpadding="0" cellspacing="0" class="bk-1">

					<tr>
					  <td width="13" align="left" valign="middle"><img src="info_show_js/images/home_70.gif" width="3" height="5" /></td>
					  <td width="405" align="left" valign="middle"><a href="newsdetail.jsp?id=<%= rs.getString(1) %>" target="_blank" title=''><%= 
rs.getString(4)%></a></td>
					  <td width="97" align="left" valign="middle"><span class="STYLE2"><%= 
rs.getString(2)%></span></td>
					</tr>
					</table>


<% 
}



rs.close();

statement.close();

connection.close();

%> 
 </div>   
</div>
</div>
</div>


<div class="main_right"style="width:300px;height:1300px;margin-left:10px;float:left;">

<div class="yingyongshifan" style="width:300px;height:500px;">
<h1>应用示范</h1>


<div id="yingyong_demo" style="width:300px;position:relative;overflow:scroll;overflow-y:hidden;overflow-x:hidden;margin-top:-8px;">
<div id="yingyong_demo1">
    <h4>应用示范1</h4>
    <li><P><FONT color=#ff0000>&nbsp;&nbsp;&nbsp;</FONT><FONT color=#000000>&nbsp;&nbsp;&nbsp;&nbsp; 应用示范描述<A href="http://www.yzb.bupt.cn/"></A>描述内容</FONT></P>
<P>&nbsp;</P>
<P>&nbsp;</P>

 </li>
    <h4>应用示范2</h4>
    <li><P><FONT color=#ff0000>&nbsp;&nbsp;&nbsp;</FONT><FONT color=#000000>&nbsp;&nbsp;&nbsp;&nbsp; 应用示范描述<A href="#"></A>描述内容</FONT></P>
<P>&nbsp;</P>
<P>&nbsp;</P>
 </li>
     <h4>应用示范3</h4>
    <li><P><FONT color=#ff0000>&nbsp;&nbsp;&nbsp;</FONT><FONT color=#000000>&nbsp;&nbsp;&nbsp;&nbsp; 应用示范描述<A href="#"></A>描述内容</FONT></P>
<P>&nbsp;</P>
<P>&nbsp;</P>
 </li>
     <h4>应用示范4</h4>
    <li><P><FONT color=#ff0000>&nbsp;&nbsp;&nbsp;</FONT><FONT color=#000000>&nbsp;&nbsp;&nbsp;&nbsp; 应用示范描述<A href="#"></A>描述内容</FONT></P>
<P>&nbsp;</P>
<P>&nbsp;</P>
 </li>
     <h4>应用示范5</h4>
    <li><P><FONT color=#ff0000>&nbsp;&nbsp;&nbsp;</FONT><FONT color=#000000>&nbsp;&nbsp;&nbsp;&nbsp; 应用示范描述<A href="#"></A>描述内容</FONT></P>
<P>&nbsp;</P>
<P>&nbsp;</P>
 </li>
      <h4>应用示范6</h4>
    <li><P><FONT color=#ff0000>&nbsp;&nbsp;&nbsp;</FONT><FONT color=#000000>&nbsp;&nbsp;&nbsp;&nbsp; 应用示范描述<A href="#"></A>描述内容</FONT></P>
<P>&nbsp;</P>
<P>&nbsp;</P>
 </li>
      <h4>应用示范7</h4>
    <li><P><FONT color=#ff0000>&nbsp;&nbsp;&nbsp;</FONT><FONT color=#000000>&nbsp;&nbsp;&nbsp;&nbsp; 应用示范描述<A href="#"></A>描述内容</FONT></P>
<P>&nbsp;</P>
<P>&nbsp;</P>
 </li>
       <h4>应用示范8</h4>
    <li><P><FONT color=#ff0000>&nbsp;&nbsp;&nbsp;</FONT><FONT color=#000000>&nbsp;&nbsp;&nbsp;&nbsp; 应用示范描述<A href="#"></A>描述内容</FONT></P>
<P>&nbsp;</P>
<P>&nbsp;</P>
 </li>
    </div>
<div id="yingyong_demo2"> </div>
<script type="text/javascript">
 //无间断滚动代码，兼容IE、Firefox、Opera
  var speed_1=20;
 var FG_Demo=document.getElementById('yingyong_demo');
 var FG_Demo1=document.getElementById('yingyong_demo1');
 var FG_Demo2=document.getElementById('yingyong_demo2');
 FG_Demo2.innerHTML=FG_Demo1.innerHTML
 function Marquee_1(){
 if(FG_Demo2.offsetHeight-FG_Demo.scrollTop<=0)
 FG_Demo.scrollTop-=FG_Demo1.offsetHeight
 else{
 FG_Demo.scrollTop++
 }
 }
 var MyMar_1=setInterval(Marquee_1,speed_1)
 FG_Demo.onmouseover=function() {clearInterval(MyMar_1)}
 FG_Demo.onmouseout=function() {MyMar_1=setInterval(Marquee_1,speed_1)}
</script> 
</div>

</div>
</div>
</div><!--men end   <!-->

</div> <!--全局div结束    !-->


 <script>

var sample  =   new  ScrollObj( " scroollBody " , " scroollBox " , 25 , 300 , 19 , 63 , 50 );

</script> 

</body>
</html>