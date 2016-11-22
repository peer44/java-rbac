<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/tag.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="${ctx }/assets/admin/login/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="${ctx }/assets/admin/login/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="${ctx }/assets/admin/login/css/bootstrap-theme.min.css" rel="stylesheet" type="text/css">
<link href="${ctx }/assets/admin/login/css/bootstrap-social.css" rel="stylesheet" type="text/css">
<link href="${ctx }/assets/admin/login/css/templatemo_style.css" rel="stylesheet" type="text/css">
<link href="${ctx }/assets/plugins/easyform/easyform.css" rel="stylesheet" type="text/css">
<title>${title }</title>
</head>
<body class="templatemo-bg-image">
	<div class="container">
		<div class="col-md-12">
			<div id="loginform" class="form-horizontal templatemo-login-form-2" role="form">
				<div class="row">
					<div class="col-md-12">
						<h1>用户登录</h1>
					</div>
				</div>
				<div class="row">
					<div class="templatemo-one-signin">
						<div class="form-group">
							<div class="col-md-12">
								<label for="username" class="control-label">用户名</label>
								<div class="templatemo-input-icon-container">
									<i class="fa fa-user"></i> 
									<input type="text" class="form-control" id="username" value="${username }" placeholder="请输入用户名"
										data-easytip="position:top;class:easy-blue;disappear:1500">
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="col-md-12">
								<label for="password" class="control-label">密码</label>
								<div class="templatemo-input-icon-container">
									<i class="fa fa-lock"></i> 
									<input type="password" class="form-control" id="password" placeholder="请输入密码"
										data-easytip="position:top;class:easy-blue;disappear:1500">
								</div>
							</div>
						</div>
						<div id="popup-captcha"></div>
						<div class="form-group">
							<div class="col-md-12">
								<div class="checkbox">
									<label> 
										<input id="rememberMe" type="checkbox">记住我
									</label>
									<label>
										<button class="btn btn-success" id="captcha" data-easytip="position:right;class:easy-blue;disappear:1500">
											<i class="fa fa-image"></i> 验证码
										</button>
									</label>
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="col-md-12">
								<input type="button" value="登录" id="login-btn" 	class="btn btn-warning" disabled="disabled">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div style="display: none">
		<form id="postForm" action="<c:url value='/doLogin.html'/>"	method="post">
			<input id="postUsername" name="usernamePost"> 
			<input id="postPassword" name="passwordPost">
		</form>
		<input type="hidden" id="ctx" value='${ctx }'>
		<input type="hidden" id="msg" value='${msg }'>
		<input type="hidden" id="key" value='${loginDesKey }'>
	</div>
</body>
<script src="${ctx }/assets/common/jquery.min.js"></script>
<script src="${ctx }/assets/plugins/jquery-cookie/jquery.cookie.js"></script>
<!-- 下面两个是md5加密 -->
<script src="${ctx }/assets/plugins/cryptojs/core.js"></script>
<script src="${ctx }/assets/plugins/cryptojs/md5.js"></script>
<!-- 下面两个是des加密 -->
<script src="${ctx }/assets/plugins/cryptojs/tripledes.js"></script>
<script src="${ctx }/assets/plugins/cryptojs/mode-ecb.js"></script>
<!-- easyform和提示 -->
<script src="${ctx }/assets/plugins/easyform/easyform.js"></script>
<script src="${ctx }/assets/common/showTip.js"></script>
<!-- 引入封装了failback的接口--initGeetest -->
<script src="http://static.geetest.com/static/tools/gt.js"></script>
<script>
	$(function() {
		$("#login-btn").attr("disabled", false);
		var ctx = $("#ctx").val().trim();
		var msg = $("#msg").val().trim();
		var key = $("#key").val().trim();
		// 显示后台传过来的消息
		if (msg == '') {
			// console.info('啥也没有');
		} else {
			var jsonStr = $.parseJSON(msg);
			console.info(jsonStr);
			if (jsonStr.code == "0") {
				ShowSuccess(jsonStr.data);
			} else {
				ShowFailure(jsonStr.data);
			}
			// $("#password").focus();
		}
		
		// console.info("记住我cookie:" + $.cookie("rembermeCookie"));
		if ($.cookie("rembermeCookie") == "true") {
			$("#rememberMe").attr("checked", true);
			$("#username").val($.cookie("usernameCookie"));
		}
		
		// 记住用户名
		function rememberUsername() {
			// 如果选中了记住我
			if ($('#rememberMe').is(':checked') == true) {
				var usernameCookie = $("#username").val().trim();
				$.cookie("rembermeCookie", "true", {
					expires : 7
				}); // 存储一个带7天期限的 cookie
				$.cookie("usernameCookie", usernameCookie, {
					expires : 7
				}); // 存储一个带7天期限的 cookie
			} else {
				$.cookie("rembermeCookie", "false", {
					expires : -1
				});
				$.cookie("usernameCookie", "", {
					expires : -1
				});
			}
		}

		var handlerPopup = function(captchaObj) {
			$("#login-btn").click(function() {
				// 先验证用户名密码是否为空
				var username = $("#username").val().trim();
				var password = $("#password").val().trim();
				var validate = captchaObj.getValidate();
				if (username.length > 0 && password.length > 0 && validate) {
					// console.info("可以登录了");
					// 密码进行两次md5
					var passwordMd5 = CryptoJS.MD5(password);
					passwordMd5 = CryptoJS.MD5(passwordMd5);
					// console.info("md5:" + passwordMd5);
					$(this).val("正在登录...");
					$(this).attr("disabled", true);
					// 用户名des加密
					username = encryptByDES(username, key);
					// 填充表单并提交表单
					$("#postUsername").val(username);
					$('#postPassword').val(passwordMd5);
					// 提交之前写cookie
					rememberUsername();
					$('#postForm').submit();
				} else {
					if (username.length == 0) {
						var usernameTip = $("#username").easytip();
						// easyfrom还有点问题
						usernameTip.show("请输入用户名");
						$("#username").focus()
						return;
						//$("#username").easyform();
					}
					if (password.length == 0) {
						var passwordTip = $("#password").easytip();
						passwordTip.show("请输入密码");
						$("#password").focus()
						return;
					}
	
					if (!validate) {
						var captchaTip = $("#captcha").easytip();
						captchaTip.show("点击验证码完成验证");
						return;
					}
				}
	
			});
			// 弹出式需要绑定触发验证码弹出按钮
			captchaObj.bindOn("#captcha");
			// 将验证码加到id为captcha的元素里
			captchaObj.appendTo("#popup-captcha");
			// 更多接口参考：http://www.geetest.com/install/sections/idx-client-sdk.html
		};

		$.ajax({
			// 获取id，challenge，success（是否启用failback）
			url : ctx + "/gesture/start",
			type : "get",
			dataType : "json",
			success : function(data) {
				// 使用initGeetest接口
				// 参数1：配置参数
				// 参数2：回调，回调的第一个参数验证码对象，之后可以使用它做appendTo之类的事件
				initGeetest({
					gt : data.gt,
					challenge : data.challenge,
					product : "popup", // 产品形式，包括：float，embed，popup。注意只对PC版验证码有效
					offline : !data.success
				// 表示用户后台检测极验服务器是否宕机，一般不需要关注
				}, handlerPopup);
			}
		});
		
		// DES加密
		function encryptByDES(message, key) {
			var keyHex = CryptoJS.enc.Utf8.parse(key);
			var encrypted = CryptoJS.DES.encrypt(message, keyHex, {
				mode : CryptoJS.mode.ECB,
				padding : CryptoJS.pad.Pkcs7
			});
			return encrypted.toString();
		}
	})
</script>
</html>
