<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../../common/tag.jsp"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="../head/head.jsp"%>
<!-- Bootstrap-Fileinput -->
<link rel="stylesheet" href="${ctx}/assets/plugins/bootstrap-plugin/bootstrap-fileinput/css/fileinput.css" />
<!-- Easyform -->
<link rel="stylesheet" href="${ctx }/assets/plugins/easyform/easyform.css" type="text/css">
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
			<!-- 添加，修改教师的模态框 -->
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
								<div id="uploadForm">
									<div class="form-group">
										<label class="col-sm-2 control-label">教师姓名</label>
										<div class="col-sm-10">
											<input id="teacherId" name="id" type="hidden"> <input
												id="teacherName" name="name" type="text"
												class="form-control" placeholder="请输入教师姓名">
										</div>
									</div>
									<div class="form-group" id="menuUrlDiv">
										<label class="col-sm-2 control-label">教学科目</label>
										<div class="col-sm-10">
											<select id="teacherSubject" name="subject"
												class="form-control">
												<option value="0" selected="selected">---请选择教学科目---</option>
												<option value="语文">语文</option>
												<option value="数学">数学</option>
												<option value="英语">英语</option>
												<option value="政治">政治</option>
												<option value="历史">历史</option>
												<option value="地理">地理</option>
												<option value="物理">物理</option>
												<option value="化学">化学</option>
												<option value="生物">生物</option>
												<option value="音乐">音乐</option>
												<option value="体育">体育</option>
												<option value="美术">美术</option>
												<option value="数学">其他</option>
											</select>
										</div>
									</div>
									<div class="form-group" id="menuUrlDiv">
										<label class="col-sm-2 control-label">教师图片</label>
										<div class="col-sm-10">
											<input id="teacherImg" name="img" type="file" data-easytip="position:right;class:easy-blue;disappear:1500">
										</div>
									</div>
									<div class="form-group" id="menuUrlDiv">
										<label class="col-sm-2 control-label">教师简介</label>
										<div class="col-sm-10">
											<textarea id="teacherInfo" name="info" class="form-control"
												rows="3" placeholder="请输入教师简介（可以为空）"></textarea>
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label">教师排序</label>
										<div class="col-sm-10">
											<input id="teacherOrder" name="order" type="text"
												class="form-control" placeholder="请输入教师排序，序号小的在前面">
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
							<button id="addMenu" type="button" class="btn btn-success">添加教师</button>
						</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div class="dataTable_wrapper">
								<table class="table table-striped table-bordered table-hover"
									id="dataTables-example">
									<thead>
										<tr>
											<th>教师姓名</th>
											<th>教学科目</th>
											<th>教师图片</th>
											<th>教师介绍</th>
											<th>显示排序</th>
											<th>操作</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${teacherList }" var="teacher" varStatus="status">
											<tr>
												<td>${teacher.name }</td>
												<td>${teacher.subject }</td>
												<td><a href="javascript:void(0)" class="zoom-it" style="text-decoration: none" accessKey="${ctx }${teacher.img }">查看 <i class="fa fa-picture-o"></i></a></td>
												<td class="teacher-info" title="${teacher.info }">${teacher.info }</td>
												<td>${teacher.order }</td>
												<td>
													<a href="${ctx }/api/teacher/${teacher.id}" target="_blank"><button type="button" accesskey="${teacher.id }"
														class="btn btn-outline btn-primary btn-xs">数据 <i class="fa fa-file-text" aria-hidden="true"></i></button></a>
													<button type="button" accesskey="${teacher.id }"
														class="btn btn-outline btn-danger btn-xs">删除 <i class="fa fa-times" aria-hidden="true"></i></button>
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
	<div id="outerdiv" style="position:fixed;top:0;left:0;z-index:2;width:100%;height:100%;display:none;"><div id="innerdiv" style="position:absolute;"><img id="bigimg" style="border:2px solid #ddd;" src="" /></div></div>
</body>
<!-- Bootstrap-Fileinput -->
<script type="text/javascript" src="${ctx }/assets/plugins/bootstrap-plugin/bootstrap-fileinput/js/fileinput.js"></script>
<script type="text/javascript" src="${ctx }/assets/plugins/bootstrap-plugin/bootstrap-fileinput/js/locales/zh.js"></script>
<!-- easyform和提示 -->
<script src="${ctx }/assets/plugins/easyform/easyform.js"></script>
<script>
	$(document).ready(function() {
		
		
		//限制字符个数
		$(".teacher-info").each(function(){
		var maxwidth=15;
		if($(this).text().length>maxwidth){
			$(this).text($(this).text().substring(0,maxwidth));
			$(this).html($(this).html()+'…');
			}
		});
		
		// 下面是处理图片显示的
		
		$(".zoom-it").click(function(){  
		    var _this = $(this);//将当前的pimg元素作为_this传入函数  
		    imgShow("#outerdiv", "#innerdiv", "#bigimg", _this);  
		});
		 
		function imgShow(outerdiv, innerdiv, bigimg, _this){  
		    var src = _this.attr("accessKey");//获取当前点击元素中的accessKey属性  
		    $(bigimg).attr("src", src);//设置#bigimg元素的src属性  
		  
		    /*获取当前点击图片的真实大小，并显示弹出层及大图*/  
		    $("<img/>").attr("src", src).load(function(){  
		        var windowW = $(window).width();//获取当前窗口宽度  
		        var windowH = $(window).height();//获取当前窗口高度  
		        var realWidth = this.width;//获取图片真实宽度  
		        var realHeight = this.height;//获取图片真实高度  
		        var imgWidth, imgHeight;  
		        var scale = 0.8;//缩放尺寸，当图片真实宽度和高度大于窗口宽度和高度时进行缩放  
		          
		        if(realHeight>windowH*scale) {//判断图片高度  
		            imgHeight = windowH*scale;//如大于窗口高度，图片高度进行缩放  
		            imgWidth = imgHeight/realHeight*realWidth;//等比例缩放宽度  
		            if(imgWidth>windowW*scale) {//如宽度扔大于窗口宽度  
		                imgWidth = windowW*scale;//再对宽度进行缩放  
		            }  
		        } else if(realWidth>windowW*scale) {//如图片高度合适，判断图片宽度  
		            imgWidth = windowW*scale;//如大于窗口宽度，图片宽度进行缩放  
		                        imgHeight = imgWidth/realWidth*realHeight;//等比例缩放高度  
		        } else {//如果图片真实高度和宽度都符合要求，高宽不变  
		            imgWidth = realWidth;  
		            imgHeight = realHeight;  
		        }  
		        
		        $(bigimg).css("width",imgWidth);//以最终的宽度对图片缩放  
		          
		        var w = (windowW-imgWidth)/2;//计算图片与窗口左边距  
		        var h = (windowH-imgHeight)/2;//计算图片与窗口上边距  
		        $(innerdiv).css({"top":h, "left":w});//设置#innerdiv的top和left属性  
		        $(outerdiv).fadeIn("fast");//淡入显示#outerdiv及.pimg  
		    });  
		      
		    $(outerdiv).click(function(){//再次点击淡出消失弹出层  
		        $(this).fadeOut("fast");  
		    });  
		}

		
		var ctx = $("#ctx").val().trim();

		// 下面是处理教师图片的
		var imageInput = $("#teacherImg");

		imageInput.fileinput({
			language : 'zh', //设置语言
			// allowedFileExtensions : [ 'jpg', 'png', 'gif' ],//接受的文件后缀
			showUpload : false, //是否显示上传按钮
			showCaption : false,//是否显示标题
			showPreview : true,// 是否预览
			browseClass : "btn btn-info", //选择文件按钮样式             
			previewFileIcon : "<i class='fa fa-image'></i>",// 不正确的文件扩展名时显示的
		});
		
		// 添加修改的模态框
		var addEditModal = $("#addEditModal");
		
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
			deleteTeacher(deleteId);
			deleteModal.modal('hide');
		});
		
		function deleteTeacher(id){
			$.ajax({
				url : ctx + '/admin/teacher/delete/'+id,
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
			

		// 点击添加按钮
		$("#addMenu").click(function() {
			
			if (window.applicationCache) {
				$("#addEditModalTitle").text("添加教师");
				$("#btnSubmit").text("确定添加");
				// 显示模态框
				addEditModal.modal({
					show : true,
				});
            } else {
                alert("你的浏览器版本过低，建议使用chrome，firefox最新版");
            }

		});

		// 确定按钮
		$("#btnSubmit").click(function() {
			var id, name, subject, info, order;
			if ($("#btnSubmit").text().indexOf("添加") > 0) {
				console.log("添加");
				id="";
				name = $("#teacherName").val().trim();
				subject = $("#teacherSubject").val().trim();
				info = $("#teacherInfo").val().trim();
				order = $("#teacherOrder").val().trim();
				if(checkNameAndSubject()){
					if (!$('#teacherImg')[0].files[0]) {
						var teacherImgTip = $("#teacherImg").easytip();
						// easyfrom还有点问题
						teacherImgTip.show("请为老师选择图片");
						return;
					}
					if(checkOrder()){
						// console.info("name:"+name +" subject:"+ subject +" info:"+ info +" order:"+ order);
						console.info("可以提交了");
						addTeacher(id,name,subject,info,order);
					}
				}
			} else {
				console.log("修改");
			}
			
			function addTeacher(id,name,subject,info,order){
				console.info("进入添加方法");
				var formData = new FormData();
				formData.append('file', $('#teacherImg')[0].files[0]);
				formData.append('id',id);
				formData.append('name', name);
				formData.append('subject',subject);
				formData.append('info',info);
				formData.append('order',order);
				function onprogress(evt) {
					// 写要实现的内容
			        if (evt.lengthComputable) {
			            var completePercent = Math.round(evt.loaded / evt.total * 100);
			            // console.info(completePercent);
			            $("#btnSubmit").text("正在处理 " + completePercent+"%");
			        }
				};
				
				var xhr_provider = function() {
				    var xhr = jQuery.ajaxSettings.xhr();
				    if(onprogress && xhr.upload) {
				        xhr.upload.addEventListener('progress', onprogress, false);
				    }
				    return xhr;
				};
				$.ajax({
					url : ctx + '/admin/teacher/add',
					type : 'POST',
					cache : false,
					data : formData,
					processData : false,
					contentType : false,
					xhr: xhr_provider,
					success: function(data) {
						console.info(data);
						result = $.parseJSON(data);
						if(result.code=="0"){
							$("#btnSubmit").text("添加成功");
							window.location.reload();
						}else{
							$("#btnSubmit").text(result.data);
							ShowFailure(result.data);
						}
					},
					error: function(data) {
						ShowFailure("操作失败"+data);
					}
				})
			}
			
			function checkNameAndSubject(){
				if (name.length == 0) {
					$("#teacherName").parent().addClass("has-error");
					$("#teacherName").focus();
					setTimeout(function() {
						$("#teacherName").parent().removeClass("has-error");
					}, 1500);
					return false;
				}
				if (subject == 0) {
					$("#teacherSubject").parent().addClass("has-error");
					$("#teacherSubject").focus();
					setTimeout(function() {
						$("#teacherSubject").parent().removeClass("has-error");
					}, 1500);
					return false;
				}
				return true;
			}
			function checkOrder(){
				if (order.length == 0) {
					$("#teacherOrder").parent().addClass("has-error");
					$("#teacherOrder").focus();
					setTimeout(function() {
						$("#teacherOrder").parent().removeClass("has-error");
					}, 1500);
					return false;
				} else {
					// console.info(order);
					if (isNaN(order)) {
						$("#teacherOrder").parent().addClass("has-error");
						ShowFailure("教师排序必须是数字");
						$("#teacherOrder").focus();
						setTimeout(function() {
							$("#teacherOrder").parent().removeClass("has-error");
						}, 1500);
						return false;
					}
				}
				return true;
			}
			
		});

		// 表格居中
		$('td').attr("class", "text-center");
		$('th').attr("class", "text-center");
		// 分页插件
		$('#dataTables-example').DataTable({
			"columnDefs":[{
                orderable:false,//禁用排序
                targets:[2,3,5]   //指定的列
            }],
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
