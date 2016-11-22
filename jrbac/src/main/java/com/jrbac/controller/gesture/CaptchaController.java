package com.jrbac.controller.gesture;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jrbac.context.GeetConfig;
import com.jrbac.context.GeetestLib;
import com.jrbac.context.Param;

/**
 * 使用Get的方式返回challenge和capthca_id,此方式以实现前后端完全分离的开发模式
 *
 */
@Controller
@RequestMapping("/gesture")
public class CaptchaController {

	/**
	 * 滑动验证码接入
	 * 
	 * @param request
	 * @param response
	 */
	@ResponseBody
	@RequestMapping(value = "/start", method = RequestMethod.GET)
	public String start(HttpServletRequest request, HttpServletResponse response) {
		GeetestLib gtSdk = new GeetestLib(GeetConfig.getCaptcha_id(), GeetConfig.getPrivate_key());
		String resStr = "{}";
		// 自定义userid
		String userid = "test";
		// 进行验证预处理
		int gtServerStatus = gtSdk.preProcess(userid);
		// 将服务器状态设置到session中
		request.getSession().setAttribute(gtSdk.gtServerStatusSessionKey, gtServerStatus);
		// 将userid设置到session中
		request.getSession().setAttribute(Param.SESSION_GEET_USERID, userid);

		resStr = gtSdk.getResponseStr();

		return resStr;
	}

	@RequestMapping(value = "/verify", method = RequestMethod.GET)
	public void verify(HttpServletRequest request, HttpServletResponse response) throws IOException {
		GeetestLib gtSdk = new GeetestLib(GeetConfig.getCaptcha_id(), GeetConfig.getPrivate_key());
		String challenge = request.getParameter(GeetestLib.fn_geetest_challenge);
		String validate = request.getParameter(GeetestLib.fn_geetest_validate);
		String seccode = request.getParameter(GeetestLib.fn_geetest_seccode);
		// 从session中获取gt-server状态
		int gt_server_status_code = (Integer) request.getSession().getAttribute(gtSdk.gtServerStatusSessionKey);

		// 从session中获取userid
		String userid = (String) request.getSession().getAttribute(Param.SESSION_GEET_USERID);

		int gtResult = 0;

		if (gt_server_status_code == 1) {
			// gt-server正常，向gt-server进行二次验证

			gtResult = gtSdk.enhencedValidateRequest(challenge, validate, seccode, userid);
			System.out.println(gtResult);
		} else {
			// gt-server非正常情况下，进行failback模式验证

			System.out.println("failback:use your own server captcha validate");
			gtResult = gtSdk.failbackValidateRequest(challenge, validate, seccode);
			System.out.println(gtResult);
		}

		if (gtResult == 1) {
			// 验证成功
			PrintWriter out = response.getWriter();
			JSONObject data = new JSONObject();
			try {
				data.put("status", "success");
				data.put("version", gtSdk.getVersionInfo());
			} catch (JSONException e) {
				e.printStackTrace();
			}
			out.println(data.toString());
		} else {
			// 验证失败
			JSONObject data = new JSONObject();
			try {
				data.put("status", "fail");
				data.put("version", gtSdk.getVersionInfo());
			} catch (JSONException e) {
				e.printStackTrace();
			}
			PrintWriter out = response.getWriter();
			out.println(data.toString());
		}

	}
}