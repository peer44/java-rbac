<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../../common/tag.jsp"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="../head/head.jsp"%>
<link href="${ctx }/assets/plugins/ztree/css/zTreeStyle/zTreeStyle.css"
	rel="stylesheet" type="text/css">
<title>${title }</title>
</head>
<body>
	<div id="wrapper">
		<!-- 侧边导航和banner -->
		<%@include file="../head/nav.jsp"%>
		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">${title }</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- 删除提示模态框 -->
			<div id="deleteModal" class="modal fade" role="dialog"
				aria-labelledby="gridSystemModalLabel">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
							<h4 class="modal-title" id="gridSystemModalLabel">提示信息</h4>
						</div>
						<div class="modal-body">
							<div class="container-fluid">数据删除后不可回复，确定删除？</div>
						</div>

						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">取消</button>
							<button id="btnDelete" type="button" class="btn btn-primary">确定</button>
						</div>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal-dialog -->
			</div>
			<!-- 添加，修改角色的模态框 -->
			<div class="modal fade" id="addEditModal" tabindex="-1" role="dialog"
				aria-labelledby="addEditModalTitle" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
							<h4 class="modal-title" id="addEditModalTitle"></h4>
						</div>
						<div class="modal-body">
							<div class="form-horizontal">
								<div class="form-group">
									<label class="col-sm-2 control-label">角色名称</label>
									<div class="col-sm-10">
										<input id="roleId" type="hidden" >
										<input type="text" class="form-control" id="roleName"
											placeholder="请输入角色名称">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label">分配权限</label>
									<div class="col-sm-10">
										<button class="btn btn-info" id="btnAllocatePermission">
											分配权限
										</button>
									</div>
								</div>
								<div class="form-group" id="menuDiv" style="display: none">
									<div class="col-sm-10 col-sm-offset-2">
										<ul id="treeDemo" class="ztree"></ul>
									</div>
								</div>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">取消</button>
							<button id="btnSubmit" type="button" class="btn btn-primary">确定</button>
						</div>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal-dialog -->
			</div>
			<!-- /.modal -->
			<!-- /.row -->
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">
							<button id="addRole" type="button" class="btn btn-success">添加角色</button>
						</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div class="dataTable_wrapper">
								<table class="table table-striped table-bordered table-hover"
									id="dataTables-example">
									<thead>
										<tr>
											<th>角色名称</th>
											<th>角色字符串</th>
											<th>操作</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${roleList }" var="role" varStatus="status">
											<tr>
												<td>${role.name }</td>
												<td>${role.id }</td>
												<td>
													<button type="button" class="btn btn-outline btn-primary btn-xs" accesskey="${role.id }" dir="${role.name }">编辑</button>
													<button type="button" class="btn btn-outline btn-danger btn-xs" accesskey="${role.id }">删除</button>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
							<!-- /.table-responsive -->
						</div>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /#page-wrapper -->
	</div>
</body>
<script type="text/javascript"
	src="${ctx }/assets/plugins/ztree/js/jquery.ztree.core.js"></script>
<script type="text/javascript"
	src="${ctx }/assets/plugins/ztree/js/jquery.ztree.excheck.js"></script>
<script>
	$(document).ready(function() {
						var ctx = $("#ctx").val().trim();
						
						// ztree需要的
						function disabledNode(e) {
							var zTree = $.fn.zTree.getZTreeObj("treeDemo"), disabled = e.data.disabled, nodes = zTree
									.getSelectedNodes(), inheritParent = false, inheritChildren = false;
							if (nodes.length == 0) {
								alert("请先选择一个节点");
							}
							if (disabled) {
								inheritParent = $("#py").attr("checked");
								inheritChildren = $("#sy").attr("checked");
							} else {
								inheritParent = $("#pn").attr("checked");
								inheritChildren = $("#sn").attr("checked");
							}

							for (var i = 0, l = nodes.length; i < l; i++) {
								zTree.setChkDisabled(nodes[i], disabled,
										inheritParent, inheritChildren);
							}
						}
						// ztree需要的
						var setting = {
								check: {
									enable: true,
									chkDisabledInherit: true
								},
								data: {
									simpleData: {
										enable: true
									}
								}
						};
						
						
						var zNodes;
						
						function initZtree(){
							var data;
							$.ajax({
								url : ctx + '/admin/role/menuZtree',
								type : 'get',
								async : false,
								success : function(result) {
									result = $.parseJSON(result);
									zNodes =  result.data;
								}
							});
						}
						
						// 添加修改的模态框
						var addEditModal = $("#addEditModal");

						// 点击添加角色按钮
						$("#addRole").click(function() {
							$("#addEditModalTitle").text("添加角色");
							$("#btnSubmit").text("确定添加");
							$("#roleId").val("");
							$("#roleName").val("");
							// 让zNodes有值
							initZtree();
							console.info(zNodes);
							$.fn.zTree.init($("#treeDemo"), setting, zNodes);
							$("#disabledTrue").bind("click", {disabled: true}, disabledNode);
							$("#disabledFalse").bind("click", {disabled: false}, disabledNode);
							// 重新分配
							var treeObj= $.fn.zTree.getZTreeObj("treeDemo");
							treeObj.checkAllNodes(false);
							// 显示模态框
							addEditModal.modal({
								show : true,
							});

						});
						
						// 编辑按钮
						$("button.btn-primary.btn-xs").click(function(){
							console.info("编辑");
							var roleId = $(this).attr("accesskey");
							console.info(roleId);
							// 菜单树节点数据获取
							var zNodes;
							$.ajax({
								url : ctx + '/admin/role/menuZtree?roleId='+roleId,
								type : 'get',
								async : false,
								success : function(result) {
									result = $.parseJSON(result);
									zNodes = result.data;
								}
							});
							console.info(zNodes);
							$.fn.zTree.init($("#treeDemo"), setting, zNodes);
							$("#disabledTrue").bind("click", {disabled: true}, disabledNode);
							$("#disabledFalse").bind("click", {disabled: false}, disabledNode);
							
							$("#roleId").val(roleId);
							$("#roleName").val($(this).attr("dir"));
							$("#addEditModalTitle").text("修改角色");
							$("#btnSubmit").text("确定修改");
							// 显示模态框
							addEditModal.modal({
								show : true,
							});
							
						})
						
						// 删除的提示模态框
						var deleteModal = $("#deleteModal");
						var deleteId;
						// 删除按钮
						$("button.btn-danger").click(function(){
							deleteModal.modal({
								show : true,
							});
							deleteId = $(this).attr("accesskey");
							
						})
						// 点击确定删除按钮
						$("#btnDelete").click(function() {
							deleteRole(deleteId);
							deleteModal.modal('hide');
						});
						
						function deleteRole(id){
							$.ajax({
								url : ctx + '/admin/role/delete/'+id,
								type : 'POST',
								success: function(data) {
									result = $.parseJSON(data);
									ShowSuccess("成功删除"+result.data+"条数据");
									setTimeout(function() {
										window.location.reload();
									}, 1000);
								},
								error: function(data) {
									ShowFailure("操作失败"+data);
								}
							})
						}
						
						// 分配权限的显示和隐藏
						$("#btnAllocatePermission").click(function() {
							$("#menuDiv").toggle("fast");
						});
						
						// 点击确定添加按钮
						$("#btnSubmit").click(function() {
							treeObj= $.fn.zTree.getZTreeObj("treeDemo");
							// 遍历所有节点，恢复禁用状态为活动状态
							var dsblNodes = treeObj.getNodesByParam("chkDisabled", true);

							// 遍历节点取消禁用状态
							for (var i=0, l=dsblNodes.length; i < l; i++) {

							    // 取消禁用状态
							    treeObj.setChkDisabled(dsblNodes[i], false);
							}
							// 取得选中的节点
							var nodes = treeObj.getCheckedNodes(true);

							// 遍历节点恢复禁用状态
							for (var i=0, l=dsblNodes.length; i < l; i++) {
							    // 恢复禁用状态
							    treeObj.setChkDisabled(dsblNodes[i], true);
							}
							console.info(nodes);
							var menuIds = []; 
							$(nodes).each(function(i,val) {
								// console.info(val.id);
								menuIds.push(val.id);
							}) 
							//console.info(menuIds);
							//console.info(menuIds.join(","));
							
							var id=$("#roleId").val().trim();
							var name=$("#roleName").val().trim();
							if (name.length == 0) {
								$("#roleName").parent().addClass("has-error");
								$("#roleName").focus();
								setTimeout(function() {
									$("#roleName").parent().removeClass("has-error");
								}, 1500);
								return;
							}
							nodes = treeObj.getCheckedNodes(true);
							console.info("第一次是为了获取数据,第二次是为了判断是否选择了");
							if(nodes.length==0){
								ShowFailure("请为角色分配权限");
								return;
							}
							console.info("id:"+id);
							console.info("name:"+name);
							console.info("menuIds:"+menuIds);
							addRole(id,name,menuIds);
							
						});
						
						
						function addRole(id,name,menuIds) {
							$.ajax({
								url : ctx + '/admin/role/add',
								type : 'post',
								data : {
									'id':id,
									'name' : name,
									'menuIds' : menuIds.join(",")
								},
								success : function(result) {
									console.info(result);
									result = $.parseJSON(result);
									if(result.code=="0"){
										$("#btnSubmit").attr("disabled",true);
										if(id.length>0){
											$("#btnSubmit").text("修改成功");
											ShowSuccess("修改成功");
										}else{
											$("#btnSubmit").text("添加成功");
											ShowSuccess("添加成功");
										}
										setTimeout(function() {
											window.location.reload();
										}, 500);
										
									}else{
										$("#btnSubmit").text(result.data);
										ShowFailure(result.data);
									}
								}
							});
						}
					

						// 表格居中
						$('td').attr("class", "text-center");
						$('th').attr("class", "text-center");
						// 分页插件
						$('#dataTables-example').DataTable({
							bSort : false,
							"sPaginationType" : "full_numbers",
							"oLanguage" : {
								"sLengthMenu" : "每页显示 _MENU_ 条记录",
								"sZeroRecords" : "抱歉， 没有找到",
								"sInfo" : "从 _START_ 到 _END_ /共 _TOTAL_ 条数据",
								"sInfoEmpty" : "没有数据",
								"sInfoFiltered" : "(从 _MAX_ 条数据中检索)",
								"sZeroRecords" : "没有检索到数据",
								"sSearch" : "搜索:",
								"oPaginate" : {
									"sFirst" : "首页",
									"sPrevious" : "上一页",
									"sNext" : "下一页",
									"sLast" : "尾页"
								}
							}
						});
					});
</script>

</html>
