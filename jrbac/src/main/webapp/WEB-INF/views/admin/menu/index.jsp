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
<!-- easyform -->
<link href="${ctx }/assets/plugins/easyform/easyform.css" rel="stylesheet" type="text/css">
<link href="${ctx }/assets/plugins/ztree/css/zTreeStyle/zTreeStyle.css" rel="stylesheet" type="text/css">
<link href="${ctx }/assets/mobile/weui/css/weui.css" rel="stylesheet" type="text/css">
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
							<button id="btnDelete" type="button" class="btn btn-primary">确定删除</button>
						</div>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal-dialog -->
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
								      <button id="menuIcon" class="btn btn-default" data-iconset="fontawesome" data-icon="fa-bars" role="iconpicker"></button>
								    </div>
								</div>
								<div class="form-group" id="parentDiv">
								    <label class="col-sm-2 control-label">父菜单</label>
								    <div class="col-sm-6">
										<div class="btn-group">
											<button id="parentButtonTip" type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" data-easytip="position:right;class:easy-blue;disappear:1500">
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
								    	<input id="menuId" type="hidden">
								      	<input id="menuName" type="text" class="form-control" placeholder="请输入菜单名称">
								    </div>
								</div>
								<div class="form-group" id="menuUrlDiv">
								    <label class="col-sm-2 control-label">菜单地址</label>
								    <div class="col-sm-10">
								      <input type="text" class="form-control" id="menuUrl" placeholder="请输入菜单地址">
								    </div>
								</div>
								<div class="form-group">
								    <label class="col-sm-2 control-label">菜单顺序</label>
								    <div class="col-sm-10">
								      <input type="text" class="form-control" id="menuOrder" placeholder="请输入菜单顺序" onkeyup="if(/\D/.test(this.value)){ShowFailure('只能是数字');this.value='';}else{if(this.value>250){ShowFailure('不能大于200');this.value='';}}">
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
							<div class="form-group" id="menuDiv">
								<div class="col-sm-4">
									<ul id="treeDemo" class="ztree"></ul>
								</div>
								<div class="col-sm-8" >
									<!-- loading toast -->
									<div id="loadingToast" class="weui_loading_toast" style="display:none;">
									    <div class="weui_mask_transparent"></div>
									    <div class="weui_toast" style="top:320px;left:62%">
									        <div class="weui_loading">
									            <div class="weui_loading_leaf weui_loading_leaf_0"></div>
									            <div class="weui_loading_leaf weui_loading_leaf_1"></div>
									            <div class="weui_loading_leaf weui_loading_leaf_2"></div>
									            <div class="weui_loading_leaf weui_loading_leaf_3"></div>
									            <div class="weui_loading_leaf weui_loading_leaf_4"></div>
									            <div class="weui_loading_leaf weui_loading_leaf_5"></div>
									            <div class="weui_loading_leaf weui_loading_leaf_6"></div>
									            <div class="weui_loading_leaf weui_loading_leaf_7"></div>
									            <div class="weui_loading_leaf weui_loading_leaf_8"></div>
									            <div class="weui_loading_leaf weui_loading_leaf_9"></div>
									            <div class="weui_loading_leaf weui_loading_leaf_10"></div>
									            <div class="weui_loading_leaf weui_loading_leaf_11"></div>
									        </div>
									        <p class="weui_toast_content">数据加载中</p>
									    </div>
									</div>
									<div class="col-lg-8" id="menuEditDiv" style="display: none">
                                        <div class="form-group">
                                            <label>菜单名称</label>
                                            <input id="editMenuName" class="form-control" type="text" placeholder="请输入菜单名称">
                                        </div>
                                        <div class="form-group">
                                            <label>菜单图标</label>
                                            <button id="editMenuIcon" class="btn btn-default" data-iconset="fontawesome" data-icon="fa-bars" role="iconpicker"></button>
                                        </div>
                                        <div class="form-group">
                                            <label>父菜单</label>
                                            <i class="fa fa-square"></i> <span id="editMenuParent"></span>
                                        </div>
                                        
                                        <div class="form-group">
                                            <label>菜单地址</label>
                                             <input id="editMenuUrl" class="form-control" type="text" placeholder="请输入菜单地址">
                                        </div>
                                        <div class="form-group">
                                            <label>菜单顺序</label>
                                             <input id="editMenuOrder" class="form-control" type="text" placeholder="请输入菜单顺序" onkeyup="if(/\D/.test(this.value)){ShowFailure('只能是数字');this.value='';}else{if(this.value>250){ShowFailure('不能大于200');this.value='';}}">
                                        </div>
                                        <button id="btnSubmitEdit" class="btn btn-info">确定修改</button>
                                	</div>
								</div>
							</div>
							<%-- <div class="dataTable_wrapper">
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
							</div> --%>
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
<!-- easyform -->
<script src="${ctx }/assets/plugins/easyform/easyform.js"></script>
<script type="text/javascript" src="${ctx }/assets/plugins/ztree/js/jquery.ztree.core.js"></script>
<script type="text/javascript" src="${ctx }/assets/plugins/ztree/js/jquery.ztree.excheck.js"></script>
<script type="text/javascript" src="${ctx }/assets/plugins/ztree/js/jquery.ztree.exedit.js"></script>
<script>
	$(document).ready(function() {
		
		var ctx = $("#ctx").val().trim();
		var zTree; 
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
			edit: {
				enable: true,
				removeTitle : '删除',
				renameTitle : '编辑'
			},
			data: {
				simpleData: {
					enable: true
				}
			},
			callback: {
				beforeRemove:beforeRemove,//点击删除时触发，用来提示用户是否确定删除  
                beforeEditName: beforeEditName,//点击编辑时触发，用来判断该节点是否能编辑  
                beforeRename:beforeRename,//编辑结束时触发，用来验证输入的数据是否符合要求  
                onRemove:onRemove,//删除节点后触发，用户后台操作  
                onRename:onRename,//编辑后触发，用于操作后台  
                beforeDrag:beforeDrag,//用户禁止拖动节点  
                onClick:clickNode//点击节点触发的事件
			}
		};
		function beforeRemove(e,treeNode){  
			if(treeNode.isParent){
				console.info("父菜单");
				if(treeNode.children.length>0){
					console.info("有孩子");
					ShowFailure("要删除父菜单请先删除父菜单的所有子菜单");
					return false;
				}
			}else{
				console.info("子菜单");
				console.info(treeNode.id);
				deleteId=treeNode.id;
				deleteModal.modal({
					show : true,
				});
				return false;
			}
	        return false;  
	    }  
	    function onRemove(e,treeId,treeNode){  
	        if(treeNode.isParent){  
	            var childNodes = zTree.removeChildNodes(treeNode);  
	            var paramsArray = new Array();  
	            for(var i = 0; i < childNodes.length; i++){  
	                paramsArray.push(childNodes[i].id);  
	            }  
	            //alert("删除父节点的id为："+treeNode.id+"\r\n他的孩子节点有："+paramsArray.join(","));  
	            return;  
	        }  
	        //alert("你点击要删除的节点的名称为："+treeNode.name+"\r\n"+"节点id为："+treeNode.id);  
	    }  
	    
	 	// 删除的提示模态框
		var deleteModal = $("#deleteModal");
		var deleteId;
		// 点击确定删除按钮
		$("#btnDelete").click(function() {
			deleteMenu(deleteId);
			deleteModal.modal('hide');
		});
		
		function deleteMenu(id){
			$.ajax({
				url : ctx + '/admin/menu/delete/'+id,
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
	    
	    // 点击编辑的时候
	    function beforeEditName(treeId,treeNode){  
	      	showEditMenu(treeNode)
	        return false;  
	    }  
	    function beforeRename(treeId,treeNode,newName,isCancel){  
	        if(newName.length < 3){  
	            alert("名称不能少于3个字符！");  
	            return false;  
	        }  
	        return true;  
	    }  
	    function onRename(e,treeId,treeNode,isCancel){  
	        alert("修改节点的id为："+treeNode.id+"\n修改后的名称为："+treeNode.name);  
	    }  
	    function clickNode(e,treeId,treeNode){  
	    	showEditMenu(treeNode);
	    }
		function beforeDrag(treeId, treeNodes) {
			return false;
		}
		
		var zNodes;
		
		function initZtree(){
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
		initZtree();
		// console.info(zNodes);
		zTree = $.fn.zTree.init($("#treeDemo"), setting, zNodes);
		
		// addOrUpdateMenu(id,name,order,icon,url,parentId)
		var editMenuId;
		var editMenuName;
		var editMenuOrder;
		var editMenuIcon;
		var editMenuUrl;
		var editMenuParentId;
		var hasUrl = false;
		function showEditMenu(treeNode){
			console.info(treeNode);
			console.info(treeNode.getParentNode())
			var editMenu
			$('#loadingToast').show();
			$.ajax({
				url : ctx + '/admin/menu/detial/'+treeNode.id,
				type : 'get',
				async : false,
				success : function(result) {
					result = $.parseJSON(result);
					editMenu =  result.data;
				}
			});
			console.info(editMenu)
			// 显示编辑菜单
			editMenuId = editMenu.id;
			
			$("#menuEditDiv").show();
			$("#editMenuName").val(editMenu.name);
			if(typeof(editMenu.icon) != "null"&&typeof(editMenu.icon) != "undefined"&&editMenu.icon.length>0){
				$("#editMenuIcon").parent().show();
				$("#editMenuIcon").find('i').attr("class", editMenu.icon);
				editMenuIcon=editMenu.icon;
			}else{
				$("#editMenuIcon").parent().hide();
				editMenuIcon='';
			}
			if(typeof(editMenu.parentId) != "null"&&typeof(editMenu.parentId) != "undefined"&&editMenu.parentId.length>0){
				$("#editMenuParent").text(treeNode.getParentNode().name);
				$("#editMenuParent").parent().find('i').attr("class", treeNode.getParentNode().icon);
				$("#editMenuParent").parent().show();
				editMenuParentId=treeNode.getParentNode().id;
			}else{
				$("#editMenuParent").parent().hide();
				editMenuParentId="";
			}
			if(editMenu.url.length>0){
				$("#editMenuUrl").parent().show();
				$("#editMenuUrl").val(editMenu.url);
				hasUrl=true;
			}else{
				$("#editMenuUrl").parent().hide();
				$("#editMenuUrl").val("");
				hasUrl=false;
			}
			$("#editMenuOrder").val(editMenu.order);
			$('#loadingToast').hide();
		}
		
		$("#btnSubmitEdit").click(function(){
			var name=$("#editMenuName").val().trim();
			var order=$("#editMenuOrder").val().trim();
			var url = $("#editMenuUrl").val().trim();
			// TODO 判空还没做
			console.info("修改");
			console.info("id:"+editMenuId);
			console.info("name:"+name);
			console.info("icon:"+editMenuIcon);
			console.info("url:"+url);
			console.info("parentId:"+editMenuParentId);
			console.info("order:"+order);
			
			if(name.length==0){
				$("#editMenuName").parent().addClass("has-error");
				$("#editMenuName").focus();
				setTimeout(function() {
					$("#editMenuName").parent().removeClass("has-error");
				}, 1500);
				return;	
			}
			if(hasUrl){
				if(url.length==0){
					$("#editMenuUrl").parent().addClass("has-error");
					$("#editMenuUrl").focus();
					setTimeout(function() {
						$("#editMenuUrl").parent().removeClass("has-error");
					}, 1500);
					return;	
				}
			}
			
			if(order.length==0){
				$("#editMenuOrder").parent().addClass("has-error");
				$("#editMenuOrder").focus();
				setTimeout(function() {
					$("#editMenuOrder").parent().removeClass("has-error");
				}, 1500);
				return;	
			}
			addOrUpdateMenu(editMenuId,name,order,editMenuIcon,url,editMenuParentId)
		})
		
		// 隐藏菜单详情
		$("#menuInfoDiv").hide();
		
		// 添加修改的模态框
		var addEditModal = $("#addEditModal");
		
		// 点击添加按钮
		$("#addMenu").click(function() {
			$("#addEditModalTitle").text("添加菜单");
			$("#btnSubmit").text("确定添加");
			// 显示模态框
			addEditModal.modal({
				show : true,
			});
		});
		var menuParentId;
		// 父菜单点击的时候修改样式
		$("#parentDiv div ul li").click(function(){
			$("#parentDiv div button").html($(this).html()+' <span class="caret"></span>');
			menuParentId = $(this).attr('dir');
			console.info("父菜单id："+menuParentId);
		})
		
		// 选择图标的时候
		var menuIcon = "fa fa-bars";
		$('#menuIcon').on('change', function(e) {
			console.log(e.icon);
			menuIcon ='fa '+ e.icon
		});
		$('#editMenuIcon').on('change', function(e) {
			console.log(e.icon);
			menuIconEdit ='fa '+ e.icon
		});
		
		var menuStyle;
		// 除了隐藏显示还得清空内容
		$(":radio").click(function(){
			$("#menuInfoDiv").show();
			if($(this).val()==1){
				// console.info("一级菜单");
				// 没有父菜单
				menuStyle=1;
				
				$("#parentDiv").hide();
				$("#menuUrlDiv").show();
				$("#menuIconDiv").show();
				
				
			}
			if($(this).val()==2){
				// 没有父菜单，没有url
				// console.info("父级菜单");
				menuStyle=2;
				$("#menuUrlDiv").hide();
				$("#parentDiv").hide();
				$("#menuIconDiv").show();
				
			}
			if($(this).val()==3){
				menuStyle=3;
				// console.info("父级菜单下的一级菜单");
				// 没有图标
				$("#menuIconDiv").hide();
				$("#parentDiv").show();
				$("#menuUrlDiv").show();
				
			}
		});
		
		$("#btnSubmit").click(function(){
			console.log("提交");
			if(isNaN(menuStyle)){
				ShowFailure("请选择菜单类型");
			}else{
				
				//   id,名称,顺序
				var menuId = $("#menuId").val().trim();
				var menuName = $("#menuName").val().trim();
				var menuOrder = $("#menuOrder").val().trim();
				var menuUrl = $("#menuUrl").val().trim();
				
				// 父菜单id,地址,图标
				if(menuStyle==3){// 父菜单下的子菜单
					if(typeof(menuParentId) == "undefined"||menuParentId.length==0){
						var parentButtonTip = $("#parentButtonTip").easytip();
						parentButtonTip.show("请选择父菜单");
						return;
					}
					if(menuName.length==0){
						$("#menuName").parent().addClass("has-error");
						$("#menuName").focus();
						setTimeout(function() {
							$("#menuName").parent().removeClass("has-error");
						}, 1500);
						return;	
					}
					if(menuUrl.length==0){
						$("#menuUrl").parent().addClass("has-error");
						$("#menuUrl").focus();
						setTimeout(function() {
							$("#menuUrl").parent().removeClass("has-error");
						}, 1500);
						return;	
					}
					if(menuOrder.length==0){
						$("#menuOrder").parent().addClass("has-error");
						$("#menuOrder").focus();
						setTimeout(function() {
							$("#menuOrder").parent().removeClass("has-error");
						}, 1500);
						return;	
					}
					addOrUpdateMenu('',menuName,menuOrder,'',menuUrl,menuParentId);
					
					// id,name,order,url,fatherid
				}else if(menuStyle==2){// 没父菜单，没url
					// id,name,order,icon
					if(menuName.length==0){
						$("#menuName").parent().addClass("has-error");
						$("#menuName").focus();
						setTimeout(function() {
							$("#menuName").parent().removeClass("has-error");
						}, 1500);
						return;	
					}
					if(menuOrder.length==0){
						$("#menuOrder").parent().addClass("has-error");
						$("#menuOrder").focus();
						setTimeout(function() {
							$("#menuOrder").parent().removeClass("has-error");
						}, 1500);
						return;	
					}
					addOrUpdateMenu(menuId,menuName,menuOrder,menuIcon,'','');
					
				}else{// 一级菜单
					// id,name,order,icon,url
					if(menuName.length==0){
						$("#menuName").parent().addClass("has-error");
						$("#menuName").focus();
						setTimeout(function() {
							$("#menuName").parent().removeClass("has-error");
						}, 1500);
						return;	
					}
					if(menuUrl.length==0){
						$("#menuUrl").parent().addClass("has-error");
						$("#menuUrl").focus();
						setTimeout(function() {
							$("#menuUrl").parent().removeClass("has-error");
						}, 1500);
						return;	
					}
					if(menuOrder.length==0){
						$("#menuOrder").parent().addClass("has-error");
						$("#menuOrder").focus();
						setTimeout(function() {
							$("#menuOrder").parent().removeClass("has-error");
						}, 1500);
						return;	
					}
					addOrUpdateMenu(menuId,menuName,menuOrder,menuIcon,menuUrl,'');
				}
				console.info("菜单类型："+menuStyle);
				console.info("菜单id："+menuId);
				console.info("菜单名称："+menuName);
				console.info("菜单顺序："+menuOrder);
				console.info("菜单地址："+menuUrl);
				console.info("父菜单id："+menuParentId);
				console.info("菜单图标："+menuIcon);
			}
		})
		
		function addOrUpdateMenu(id,name,order,icon,url,parentId){
			$.ajax({
				url : ctx + '/admin/menu/add',
				type : 'post',
				data : {
					'id':id,
					'name' : name,
					'order' : order,
					'icon' : icon,
					'url' : url,
					'parentId' : parentId
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
