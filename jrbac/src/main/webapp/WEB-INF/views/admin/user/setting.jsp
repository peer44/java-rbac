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
					<h1 class="page-header">个人设置</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">基本信息</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<!-- Nav tabs -->
							<ul class="nav nav-tabs">
								<li class="active"><a href="#home" data-toggle="tab">个人信息修改</a>
								</li>
								<li><a href="#profile" data-toggle="tab">登录密码修改</a></li>
							</ul>

							<!-- Tab panes -->
							<div class="tab-content">
								<div class="tab-pane fade in active" id="home">
									<p></p>
									<div class="row">
										<div class="col-lg-6">
											<form role="form">
												<div class="form-group">
													<label>用户名</label> <input class="form-control" disabled="disabled"
														value="${loginUser.username }">
												</div>
												<div class="form-group">
													<label>昵称</label> <input class="form-control" value="${loginUser.nickname }"
														placeholder="请输入昵称">
												</div>
												<div class="form-group">
													<label>电话号码</label> <input class="form-control" value="${loginUser.telephone }"
														placeholder="请输入昵称">
												</div>
												<div class="form-group">
													<label>电子邮箱</label> <input class="form-control" value="${loginUser.email }"
														placeholder="请输入昵称">
												</div>
												
												<button type="button" class="btn btn-success">修改个人信息</button>
											</form>
										</div>
									</div>
								</div>
								<div class="tab-pane fade" id="profile">
									 <h4>Profile Tab</h4>
									<ul class="fa-ul">
										<li><i class="fa-li fa fa-check-square"></i>List icons</li>
										<li><i class="fa-li fa fa-check-square"></i>can be used</li>
										<li><i class="fa-li fa fa-spinner fa-spin"></i>as bullets</li>
										<li><i class="fa-li fa fa-square"></i>in lists</li>
										<li><i class="fa fa-audio-description fa-5x"></i></li>
									</ul> 
									<p></p>
									<div class="row">
										<div class="col-lg-6">
											<form role="form">
												<div class="form-group">
													<label>当前密码</label> <input class="form-control" placeholder="请输入当前密码">
												</div>
												<div class="form-group">
													<label>新密码</label> <input class="form-control" placeholder="请输入新密码">
												</div>
												<div class="form-group">
													<label>确认新密码</label> <input class="form-control" placeholder="请再次输入新密码">
												</div>
												<button type="button" class="btn btn-success">修改登录密码</button>
											</form>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
				</div>
			</div>
		</div>
		<!-- /#page-wrapper -->

	</div>
	<!-- /#wrapper -->

</body>

</html>
