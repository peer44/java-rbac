<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../../common/tag.jsp"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="../head/head.jsp"%>
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
			<!-- /.row -->
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">带进度条的文件上传</div>
						<div class="panel-body">
							<div class="row">
								<div class="col-lg-6">
									<form role="form" action="javascript:void(0)">
										<div class="form-group">
											<label>文件选择</label> <input id="file" name="file" type="file">
										</div>
										<div class="progress progress-striped active" style="display: none">
											<div id="progressBar" class="progress-bar progress-bar-info"
												role="progressbar" aria-valuemin="0" aria-valuenow="0"
												aria-valuemax="100" style="width: 0%"></div>
										</div>

										<div class="form-group">
											<button id="uploadBtn" type="submit" class="btn btn-success">上传文件</button>
										</div>


										<div class="form-group">
											<img id="imageUpload" alt="上传的后图片" src="" width="100%">
										</div>

									</form>
								</div>
							</div>
							<!-- /.row (nested) -->
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
	<!-- /#wrapper -->
</body>
<script type="text/javascript">
	$(function() {
		//上传文件按钮
		var ctx = $("#ctx").val().trim();
		$("#uploadBtn").click(function() {
			// 进度条归零
			$("#progressBar").width("0%");
			// 上传按钮禁用
			$("#uploadBtn").attr("disabled", true);
			// 进度条显示
			$("#progressBar").parent().show();
			$("#progressBar").parent().addClass("active");
			upload("带进度条的文件上传");
		})
		function refreshBtn(){
			setTimeout(function() {
				$("#uploadBtn").text("上传文件");
				$("#uploadBtn").removeAttr("disabled");
			}, 1500);
		}

		function upload(name) {
			var formData = new FormData();
			formData.append('file', $('#file')[0].files[0]);
			formData.append('name', name);
			function onprogress(evt) {
				// 写要实现的内容
				var progressBar = $("#progressBar");
				if (evt.lengthComputable) {
					var completePercent = Math.round(evt.loaded / evt.total * 100);
					progressBar.width(completePercent + "%");
					$("#progressBar").text(completePercent + "%");
				}
			}
			var xhr_provider = function() {
				var xhr = jQuery.ajaxSettings.xhr();
				if (onprogress && xhr.upload) {
					xhr.upload.addEventListener('progress', onprogress, false);
				}
				return xhr;
			};
			$.ajax({
				url : ctx + '/admin/test/upload',
				type : 'POST',
				cache : false,
				data : formData,
				processData : false,
				contentType : false,
				xhr : xhr_provider,
				success : function(data) {
					console.info(data);
					result = $.parseJSON(data);
					if (result.code == "0") {
						$("#uploadBtn").text("上传成功");
						$("#imageUpload").attr("src", ctx + result.data);
						setTimeout(function() {
							$("#uploadBtn").text("上传文件");
						}, 1000);
					} else if(result.code=="-4"){
						$("#uploadBtn").text("不支持的文件类型");
						ShowFailure("操作失败：" + result.data);
					} else {
						$("#uploadBtn").text(result.data);
						ShowFailure("操作失败：" + result.data);
					}
					// 进度条隐藏
					$("#progressBar").parent().hide();
					refreshBtn();
				},
				error : function(data) {
					console.info(data);
					ShowFailure("操作失败：" + data);
					refreshBtn();
				}
			})
		}
	})
</script>

</html>
