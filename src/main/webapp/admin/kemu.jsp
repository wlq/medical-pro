<!-- 
	author:wlq
	date:2013/5/23
 -->
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../inc.jsp"></jsp:include>
<script type="text/javascript" charset="utf-8">
	var datagrid;
	var kemuAddDialog;
	var kemuAddForm;
	var kemuEditDialog;
	var kemuEditForm;
	var cdescEdit;
	var cdescAdd;
	var showCdescDialog;
	$(function() {
		datagrid = $('#datagrid').datagrid({
			url : 'kemuAction!datagrid.action',
			title : 'kemu列表(弹窗修改模式)',
			iconCls : 'icon-save',
			pagination : true,
			pagePosition : 'bottom',
			pageSize : 10,
			pageList : [ 10, 20, 30, 40 ],
			fit : true,
			fitColumns : true,
			nowrap : false,
			border : false,
			idField : 'cid',
			sortOrder : 'desc',
			frozenColumns : [ [ {
				title : '编号',
				field : 'cid',
				width : 150,
				sortable : true,
				checkbox : true
			}, {
				title : '支出摘要',
				field : 'cname',
				width : 300
			} , {
				title : '金额（元）',
				field : 'cmoney',
				width : 150
			} , {
				title : '会计凭证号',
				field : 'ccountId',
				width : 150
			}  , {
				title : '记账时间',
				field : 'ccountTime',
				width : 150
			}, {
				title : '票据号',
				field : 'ctickets',
				width : 150
			} , {
				title : '电子凭证',
				field : 'cdatei',
				width : 150,
				formatter : function(value, rowData, rowIndex) {
					return '<span class="icon-search" style="display:inline-block;vertical-align:middle;width:16px;height:16px;"></span><a href="javascript:void(0);" onclick="showCdesc(' + rowIndex + ');">查看电子凭证</a>';
				}
			}, {
				title : '科目',
				field : 'ccourse',
				width : 150,
				sortable : true
			}] ],
			toolbar : [ {
				text : '增加',
				iconCls : 'icon-add',
				handler : function() {
					add();
				}
			}, '-', {
				text : '删除',
				iconCls : 'icon-remove',
				handler : function() {
					del();
				}
			}, '-', {
				text : '修改',
				iconCls : 'icon-edit',
				handler : function() {
					edit();
				}
			}, '-', {
				text : '取消选中',
				iconCls : 'icon-undo',
				handler : function() {
					datagrid.datagrid('unselectAll');
				}
			}, '-' ],
			onRowContextMenu : function(e, rowIndex, rowData) {
				e.preventDefault();
				$(this).datagrid('unselectAll');
				$(this).datagrid('selectRow', rowIndex);
				$('#menu').menu('show', {
					left : e.pageX,
					top : e.pageY
				});
			}
		});

		kemuAddForm = $('#kemuAddForm').form({
			url : 'kemuAction!add.action',
			success : function(data) {
				var json = $.parseJSON(data);
				if (json && json.success) {
					$.messager.show({
						title : '成功',
						msg : json.msg
					});
					datagrid.datagrid('reload');
					kemuAddDialog.dialog('close');
				} else {
					$.messager.show({
						title : '失败',
						msg : json.msg
					});
				}
			}
		});

		kemuAddDialog = $('#kemuAddDialog').show().dialog({
			title : '添加科目支出',
			modal : true,
			closed : true,
			maximizable : true,
			buttons : [ {
				text : '添加',
				handler : function() {
					kemuAddForm.submit();
				}
			} ]
		});

		kemuEditForm = $('#kemuEditForm').form({
			url : 'kemuAction!edit.action',
			success : function(data) {
				var json = $.parseJSON(data);
				if (json && json.success) {
					$.messager.show({
						title : '成功',
						msg : json.msg
					});
					datagrid.datagrid('reload');
					kemuEditDialog.dialog('close');
				} else {
					$.messager.show({
						title : '失败',
						msg : json.msg
					});
				}
			}
		});

		kemuEditDialog = $('#kemuEditDialog').show().dialog({
			title : '编辑科目支出',
			modal : true,
			closed : true,
			maximizable : true,
			buttons : [ {
				text : '编辑',
				handler : function() {
					kemuEditForm.submit();
				}
			} ]
		});

		cdescAdd = $('#cdescAdd').xheditor({
			tools : 'mini',
			html5Upload : true,
			upMultiple : 4,
			upLinkUrl : 'kemuAction!upload.action',
			upLinkExt : 'zip,rar,txt,doc,docx,xls,xlsx',
			upImgUrl : 'kemuAction!upload.action',
			upImgExt : 'jpg,jpeg,gif,png'
		});
		
		cdescEdit = $('#cdescEdit').xheditor({
			tools : 'mini',
			html5Upload : true,
			upMultiple : 4,
			upLinkUrl : 'kemuAction!upload.action',
			upLinkExt : 'zip,rar,txt,doc,docx,xls,xlsx',
			upImgUrl : 'kemuAction!upload.action',
			upImgExt : 'jpg,jpeg,gif,png'
		});

		showCdescDialog = $('#showCdescDialog').show().dialog({
			title : '电子凭证',
			modal : true,
			closed : true,
			maximizable : true
		});

	});

	function add() {
		kemuAddForm.find('input,textarea').val('');
		$('div.validatebox-tip').remove();
		kemuAddDialog.dialog('open');
	}
	function del() {
		var rows = datagrid.datagrid('getSelections');
		var ids = [];
		if (rows.length > 0) {
			$.messager.confirm('请确认', '您要删除当前所选项目？', function(r) {
				if (r) {
					for ( var i = 0; i < rows.length; i++) {
						ids.push(rows[i].cid);
					}
					$.ajax({
						url : 'kemuAction!delete.action',
						data : {
							ids : ids.join(',')
						},
						dataType : 'json',
						success : function(response) {
							datagrid.datagrid('load');
							datagrid.datagrid('unselectAll');
							$.messager.show({
								title : '提示',
								msg : '删除成功！'
							});
						}
					});
				}
			});
		} else {
			$.messager.alert('提示', '请选择要删除的记录！', 'error');
		}
	}
	function edit() {
		var rows = datagrid.datagrid('getSelections');
		if (rows.length == 1) {
			$.messager.progress({
				text : '数据加载中....',
				interval : 100
			});
			$.ajax({
				url : 'kemuAction!showDesc.action',
				data : {
					cid : rows[0].cid
				},
				dataType : 'json',
				cache : false,
				success : function(response) {
					kemuEditForm.form('load', response);
					$('div.validatebox-tip').remove();
					kemuEditDialog.dialog('open');
					$.messager.progress('close');
				}
			});
		} else {
			$.messager.alert('提示', '请选择一项要编辑的记录！', 'error');
		}
	}
	function showCdesc(index) {
		var rows = datagrid.datagrid('getRows');
		var row = rows[index];
		$.messager.progress({
			text : '数据加载中....',
			interval : 100
		});
		$.ajax({
			url : 'kemuAction!showDesc.action',
			data : {
				cid : row.cid
			},
			dataType : 'json',
			cache : false,
			success : function(response) {
				if (response && response.cdatei) {
					showCdescDialog.find('div[name=cdatei]').html(response.cdatei);
					showCdescDialog.dialog('open');
				} else {
					$.messager.alert('提示', '没有电子凭证 ！', 'error');
				}
				$.messager.progress('close');
			}
		});
		datagrid.datagrid('unselectAll');
	}
</script>
</head>
<body class="easyui-layout">
	<div region="center" border="false">
		<table id="datagrid"></table>
	</div>

	<div id="menu" class="easyui-menu" style="width:120px;display: none;">
		<div onclick="add();" iconCls="icon-add">增加</div>
		<div onclick="del();" iconCls="icon-remove">删除</div>
		<div onclick="edit();" iconCls="icon-edit">编辑</div>
	</div>

	<div id="kemuAddDialog" style="display: none;width: 500px;height: 300px;" align="center">
		<form id="kemuAddForm" method="post">
			<table class="tableForm">
				<tr>
					<th>科目支出摘要</th>
					<td><input name="cname" class="easyui-validatebox" required="true" missingMessage="请填写科目支出摘要" /></td>					
				
					<th>金额</th>
					<td><input name="cmoney" class="easyui-validatebox" required="true" missingMessage="请填写科目支出金额" /></td>
				</tr>
				<tr>
					<th>会计凭证号</th>
					<td><input name="ccountId" class="easyui-validatebox" required="true"   missingMessage="请填写会计凭证号" /></td>
				
					<th>记账时间</th>
					<td><input name="ccountTime" class="easyui-datetimebox" editable="false" style="width: 155px;" /></td>
				</tr>
				<tr>
					<th>票据号</th>
					<td><input name="ctickets" class="easyui-validatebox" required="true" missingMessage="请填写票据号" /></td>	
				
					<th>科目</th>
					<td>
						<select  name="ccourse">
						   <option value="购置设备费">购置设备费</option>
						   <option value="材料费">材料费</option>
						   <option value="劳务费">劳务费</option>
						</select>
					</td>					
				</tr>
				<tr>
					<th>电子凭证</th>
					<td colspan="3">
					<textarea id="cdescAdd" name="cdatei"  rows="12" cols="80" style="width: 80%"></textarea>
					</td>
				</tr>
			</table>
		</form>
	</div>

	<div id="kemuEditDialog" style="display: none;width: 500px;height: 300px;" align="center">
		<form id="kemuEditForm" method="post">
			<input type="hidden" name="cid" />
			<table class="tableForm">
				<tr>
					<th>科目支出摘要</th>
					<td><input name="cname" class="easyui-validatebox" required="true" missingMessage="请填写科目支出摘要" /></td>					
				
					<th>金额</th>
					<td><input name="cmoney" class="easyui-validatebox" required="true" missingMessage="请填写科目支出金额" /></td>
				</tr>
				<tr>
					<th>会计凭证号</th>
					<td><input name="ccountId" class="easyui-validatebox" required="true"   missingMessage="请填写会计凭证号" /></td>
				
					<th>记账时间</th>
					<td><input name="ccountTime" class="easyui-datetimebox" editable="false" style="width: 155px;" /></td>
				</tr>
				<tr>
					<th>票据号</th>
					<td><input name="ctickets" class="easyui-validatebox" required="true" missingMessage="请填写票据号" /></td>	
				
					<th>科目</th>
					<td>
						<select  name="ccourse">
						   <option value="购置设备费">购置设备费</option>
						   <option value="材料费">材料费</option>
						   <option value="劳务费">劳务费</option>
						</select>
					</td>					
				</tr>
				<tr>
					<th>电子凭证</th>
					<td colspan="3">
					<textarea id="cdescEdit" name="cdatei"  rows="12" cols="80" style="width: 80%"></textarea>
					</td>
				</tr>
			</table>
		</form>
	</div>

	<div id="showCdescDialog" style="display: none;overflow: auto;width: 500px;height: 400px;">
		<div name="cdatei"></div>
	</div>

</body>
</html>