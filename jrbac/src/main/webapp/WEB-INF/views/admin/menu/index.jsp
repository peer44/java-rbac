<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../../common/tag.jsp"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="../head/head.jsp"%>
<!-- Font Awesome -->
<link rel="stylesheet" href="${ctx}/assets/plugins/bootstrap-plugin/bootstrap-iconpicker/icon-fonts/font-awesome-4.2.0/css/font-awesome.min.css" />
<!-- Bootstrap-Iconpicker -->
<link rel="stylesheet" href="${ctx}/assets/plugins/bootstrap-plugin/bootstrap-iconpicker/css/bootstrap-iconpicker.min.css" />
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
			<!-- 添加，修改菜单的模态框 -->
			<div class="modal fade" id="addEditModal" tabindex="-1" role="dialog" aria-labelledby="addEditModalTitle" aria-hidden="true">
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
								    <label class="col-sm-2 control-label">菜单类型</label>
								    <div class="col-sm-10">
								      	<label class="radio-inline">
		                                   <input type="radio" name="optionsRadiosInline" id="optionsRadiosInline1" value="1" >一级菜单
		                                </label>
		                                <label class="radio-inline">
		                                   <input type="radio" name="optionsRadiosInline" id="optionsRadiosInline2" value="2">父菜单
		                                </label>
		                                <label class="radio-inline">
		                                   <input type="radio" name="optionsRadiosInline" id="optionsRadiosInline3" value="3">父菜单下的一级菜单
		                                </label>
								    </div>
								</div>
								<div id="menuInfoDiv">
								<div class="form-group" id="menuIconDiv">
								    <label class="col-sm-2 control-label">菜单图标</label>
								    <div class="col-sm-10">
								      <button class="btn btn-default" data-iconset="fontawesome" data-icon="fa-bars" role="iconpicker"></button>
								    </div>
								</div>
								<div class="form-group" id="parentDiv">
								    <label class="col-sm-2 control-label">父菜单</label>
								    <div class="col-sm-6">
										<div class="btn-group">
											<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
											请选择父菜单<span class="caret"></span>
											</button>
											<ul class="dropdown-menu" role="menu">
												<c:forEach items="${menuList }" var="menu" varStatus="status">
													<c:if test="${empty menu.parentId and empty menu.url}">
														<li dir="${menu.id }"><a href="javascript:void(0)" style="text-decoration: none;color: #000"><i class="${menu.icon }" style="margin-right:0.5rem;"></i> ${menu.name }</a></li>
													</c:if>
												</c:forEach>
											</ul>
										</div>
								    </div>
								</div>
								<div class="form-group">
								    <label class="col-sm-2 control-label">菜单名称</label>
								    <div class="col-sm-10">
								      <input type="email" class="form-control" id="menuName" placeholder="请输入菜单名称">
								    </div>
								</div>
								<div class="form-group" id="menuUrlDiv">
								    <label class="col-sm-2 control-label">菜单地址</label>
								    <div class="col-sm-10">
								      <input type="email" class="form-control" id="menuUrl" placeholder="请输入菜单地址">
								    </div>
								</div>
								<div class="form-group">
								    <label class="col-sm-2 control-label">菜单顺序</label>
								    <div class="col-sm-10">
								      <input type="email" class="form-control" id="menuOrder" placeholder="请输入菜单顺序">
								    </div>
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
							<button id="addMenu" type="button" class="btn btn-success">添加菜单</button>
						</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div class="dataTable_wrapper">
								<table class="table table-striped table-bordered table-hover"
									id="dataTables-example">
									<thead>
										<tr>
											<th>菜单名称</th>
											<th>菜单地址</th>
											<th>菜单图标</th>
											<th>菜单顺序</th>
											<th>操作</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${menuList }" var="menu" varStatus="status">
											<tr>
												<td>${menu.name }</td>
												<td>${menu.url }</td>
												<td><i class="${menu.icon }"></i></td>
												<td>${menu.order }</td>
												<td>
													<button type="button"
														class="btn btn-outline btn-primary btn-xs">编辑</button>
													<button type="button"
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
<!-- Bootstrap-Iconpicker Iconset for Font Awesome -->
<script type="text/javascript" src="${ctx }/assets/plugins/bootstrap-plugin/bootstrap-iconpicker/js/iconset/iconset-fontawesome-4.2.0.min.js"></script>
<!-- Bootstrap-Iconpicker -->
<script type="text/javascript" src="${ctx }/assets/plugins/bootstrap-plugin/bootstrap-iconpicker/js/bootstrap-iconpicker.min.js"></script>
<script>
	$(document).ready(function() {
		
		// 隐藏菜单详情
		$("#menuInfoDiv").hide();
		
		// 添加修改的模态框
		var addEditModal = $("#addEditModal");
		
		// 点击添加按钮
		$("#addMenu").click(function() {
			$("#addEditModalTitle").text("添加菜单");
			// 显示模态框
			addEditModal.modal({
				show : true,
			});

		});
		var menuParentId = $("#menuParentId");
		// 父菜单点击的时候修改样式
		$("#parentDiv div ul li").click(function(){
			$("#parentDiv div button").html($(this).html()+' <span class="caret"></span>');
			menuParentId = $(this).attr('dir');
			console.info(menuParentId);
		})
		
		var menuParentId = $("#menuParentId");
		
		// 除了隐藏显示还得清空内容
		
		$(":radio").click(function(){
			$("#menuInfoDiv").show();
			if($(this).val()==1){
				console.info("一级菜单");
				// 没有父菜单
				$("#parentDiv").hide();
				$("#menuUrlDiv").show();
				$("#menuIconDiv").show();
				
				
			}
			if($(this).val()==2){
				// 没有父菜单，没有url
				console.info("父级菜单");
				$("#menuUrlDiv").hide();
				$("#parentDiv").hide();
				$("#menuIconDiv").show();
				
			}
			if($(this).val()==3){
				console.info("父级菜单下的一级菜单");
				// 没有图标
				$("#menuIconDiv").hide();
				$("#parentDiv").show();
				$("#menuUrlDiv").show();
				
			}
		});
		
		
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
