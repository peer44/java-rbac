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
			<!-- 重置密码模态框 -->
			<div id="resetPasswordModal" class="modal fade" role="dialog"
				aria-labelledby="gridSystemModalLabel">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
							<h4 class="modal-title" id="gridSystemModalLabel">提示信息</h4>
						</div>
						<div class="modal-body">
							<div class="container-fluid">密码将被重置为12345678，确定重置密码？</div>
						</div>

						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">取消</button>
							<button id="btnResetPassword" type="button" class="btn btn-primary">确定重置</button>
						</div>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal-dialog -->
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
							<button id="btnDelete" type="button" class="btn btn-primary">确定删除</button>
						</div>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal-dialog -->
			</div>
			<!-- 添加，修改用户的模态框 -->
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
								<input id="userid" type="hidden" >
								<div class="form-group">
									<label class="col-sm-2 control-label">真实姓名</label>
									<div class="col-sm-10">
										<input id="nickname" type="text" class="form-control"
											placeholder="请输入真实姓名">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label">用户名</label>
									<div class="col-sm-10">
										
										<input id="username" type="text" class="form-control" 
											placeholder="请输入用户名  *可以是字母，数字，下画线_或其组合)" onkeyup="this.value=this.value.replace(/[^\w_]/g,'')">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label">登录密码</label>
									<div class="col-sm-5">
										
										<input id="password" type="text" class="form-control"
											placeholder="请输入登录密码">
									</div>
									<div class="col-sm-5">
										<button id="setDefaultPwd" class="btn btn-success" onclick="document.getElementById('password').value=12345678">初始密码为12345678</button>										
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label">分配角色</label>
									<div class="col-sm-10">
										<button class="btn btn-info" id="btnAllocatePermission">
											分配角色
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
							<button id="addUser" type="button" class="btn btn-success">添加用户</button>
						</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div class="dataTable_wrapper">
								<table class="table table-striped table-bordered table-hover"
									id="dataTables-example">
									<thead>
										<tr>
											<th>用户名</th>
											<th>昵称</th>
											<th>重置密码</th>
											<th>操作</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${userList }" var="user" varStatus="status">
											<tr>
												<td>${user.username }</td>
												<td>${user.nickname }</td>
												<td><button type="button"
														class="btn btn-outline btn-success btn-xs" accesskey="${user.id }">重置密码</button></td>
												<td>
													<button type="button" accesskey="${user.id }"
														class="btn btn-outline btn-primary btn-xs">编辑</button>
													<button type="button" accesskey="${user.id }"
														class="btn btn-outline btn-danger btn-xs">删除</button>
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
		
		// 分配角色的显示和隐藏
		$("#btnAllocatePermission").click(function() {
			$("#menuDiv").toggle("fast");
		});
		
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
				url : ctx + '/admin/user/roleZtree',
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
		// 点击添加用户按钮
		var isShowPassword;
		$("#addUser").click(function() {
			isShowPassword=true;
			$("#password").parent().parent().show();
			$("#addEditModalTitle").text("添加用户");
			$("#btnSubmit").text("确定添加");
			$("#userid").val("");
			$("#username").val("");
			$("#username").attr("disabled",false);
			$("#nickname").val("");
			
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

		})
		
		
		var notRegistered;
		$("#username").blur(function(){
			if($(this).val().trim().length>0){
			checkUsername($(this).val().trim());
				if(!notRegistered){
					$("#username").parent().addClass("has-error");
					$("#username").focus();
					ShowFailure("该用户名已被注册");
					setTimeout(function() {
						$("#username").parent().removeClass("has-error");
					}, 1500);
					return;
				}
			}
		});
		
		// 编辑按钮
		$("button.btn-primary.btn-xs").click(function(){
			console.info("编辑");
			// 
			notRegistered=true;
			isShowPassword=false;
			var userid = $(this).attr("accesskey");
			console.info("userid:"+userid);
			$("#userid").val(userid);
			var tr = $(this).parent().parent();
			$(tr).each(function() {
				var td = $(this).children();
				username = $.trim(td.eq(0).text());
				$("#username").val(username);
				nickname = $.trim(td.eq(1).text());
				$("#nickname").val(nickname);
			});
			// 不允许修改用户名
			$("#username").attr("disabled",true);
			// 因为无法获取原始密码，所以密码的只能单独修改
			$("#password").val("");
			$("#password").parent().parent().hide();
			// 权限树节点数据获取
			var zNodes;
			$.ajax({
				url : ctx + '/admin/user/roleZtree?userId='+userid,
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
			
			$("#addEditModalTitle").text("修改用户");
			$("#btnSubmit").text("确定修改");
			// 显示模态框
			addEditModal.modal({
				show : true,
			});
			
		})
		
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
			var roleIds = []; 
			$(nodes).each(function(i,val) {
				// console.info(val.id);
				roleIds.push(val.id);
			}) 
			//console.info(menuIds);
			//console.info(menuIds.join(","));
			
			var id=$("#userid").val().trim();
			var username=$("#username").val().trim();
			var nickname=$("#nickname").val().trim();
			var password=$("#password").val().trim();
			if (nickname.length == 0) {
				$("#nickname").parent().addClass("has-error");
				$("#nickname").focus();
				setTimeout(function() {
					$("#nickname").parent().removeClass("has-error");
				}, 1500);
				return;
			}
			if (username.length == 0) {
				$("#username").parent().addClass("has-error");
				$("#username").focus();
				setTimeout(function() {
					$("#username").parent().removeClass("has-error");
				}, 1500);
				return;
			}else{
				if(!notRegistered){
					$("#username").parent().addClass("has-error");
					$("#username").focus();
					ShowFailure("该用户名已被注册");
					setTimeout(function() {
						$("#username").parent().removeClass("has-error");
					}, 1500);
					return;
				}
			}
			if(isShowPassword){
				if (password.length == 0) {
					$("#password").parent().addClass("has-error");
					$("#password").focus();
					setTimeout(function() {
						$("#password").parent().removeClass("has-error");
					}, 1500);
					return;
				}
			}
			nodes = treeObj.getCheckedNodes(true);
			console.info("第一次是为了获取数据,第二次是为了判断是否选择了");
			if(nodes.length==0){
				ShowFailure("请为用户分配角色");
				return;
			}
			console.info("id:"+id);
			console.info("username:"+username);
			console.info("password:"+password);
			console.info("nickname:"+nickname);
			console.info("roleIds:"+roleIds);
			addOrUpdateUser(id,username,password,nickname,roleIds)
			
		});
		
		function checkUsername(username) {
			$.ajax({
				url : ctx + '/admin/user/checkUsername',
				type : 'get',
				async : false,
				data : {
					'username' : username
				},
				success : function(result) {
					result = $.parseJSON(result);
					console.info(result);
					notRegistered=result.data;
				}
			});
		}
		
		function addOrUpdateUser(id,username,password,nickname,roleIds) {
			$.ajax({
				url : ctx + '/admin/user/add',
				type : 'post',
				data : {
					'id':id,
					'username' : username,
					'password' : password,
					'nickname' : nickname,
					'roleIds' : roleIds.join(",")
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
		
		// 重置密码的提示模态框
		var resetPasswordModal = $("#resetPasswordModal");
		var userId;
		// 重置密码按钮
		$("button.btn-success:contains('重置密码')").click(function(){
			resetPasswordModal.modal({
				show : true,
			});
			userId = $(this).attr("accesskey");
			
		})
		btnResetPassword
		// 点击确定重置密码
		$("#btnResetPassword").click(function() {
			resetPassword(userId);
			resetPasswordModal.modal('hide');
		});
		function resetPassword(id){
			$.ajax({
				url : ctx + '/admin/user/updatepassword',
				data : {
					'userId' : id
				},
				type : 'POST',
				success: function(data) {
					result = $.parseJSON(data);
					if(result.code=="0"){
						ShowSuccess("重置密码成功");
					}else{
						ShowFailure("操作失败："+result.data);
					}
						
					
				},
				error: function(data) {
					ShowFailure("操作失败："+data);
				}
			})
		}
		
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
			deleteUser(deleteId);
			deleteModal.modal('hide');
		});
		
		function deleteUser(id){
			$.ajax({
				url : ctx + '/admin/user/delete/'+id,
				type : 'POST',
				success: function(data) {
					result = $.parseJSON(data);
					ShowSuccess("成功删除"+result.data+"条数据");
					setTimeout(function() {
						window.location.reload();
					}, 1000);
				},
				error: function(data) {
					ShowFailure("操作失败："+data);
				}
			})
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
