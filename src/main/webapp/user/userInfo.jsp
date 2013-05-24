<%@ page language="java" import="sy.pageModel.*,sy.model.*,sy.util.*,java.util.*" pageEncoding="UTF-8"%>
 <jsp:include page="../inc.jsp"></jsp:include>
 <script type="text/javascript" charset="utf-8">
	
	
           function loadRemote(){  
           //alert(1);
           		$('#userInfoForm').form('load',  
                	'userAction!userInfo.action'
         	);
           }  
          window.onload=loadRemote();
</script>
<body>  
    <h2>Basic Window</h2>  
    <div class="demo-info">  
        <div class="demo-tip icon-tip"></div>  
        <div>Window can be dragged freely on screen.</div>  
    </div>  
    <div style="margin:10px 0;">  
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="$('#w').window('open')">Open</a>  
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="$('#w').window('close')">Close</a>  
    </div>  
    <div id="w" class="easyui-window" title="Basic Window" data-options="iconCls:'icon-save'" style="width:500px;height:200px;padding:10px;">  
        The window content.  
    </div>  
</body>  
</html> 
