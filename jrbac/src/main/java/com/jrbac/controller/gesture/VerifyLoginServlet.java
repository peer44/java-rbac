package com.jrbac.controller.gesture;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONException;
import org.json.JSONObject;

import com.jrbac.context.GeetestLib;
import com.jrbac.context.GeetConfig;


/**
 * 使用post方式，返回验证结果, request表单中必须包含challenge, validate, seccode
 */
public class VerifyLoginServlet extends HttpServlet {

	private static final long serialVersionUID = 244554953219893949L;

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		GeetestLib gtSdk = new GeetestLib(GeetConfig.getCaptcha_id(), GeetConfig.getPrivate_key());
			
		String challenge = request.getParameter(GeetestLib.fn_geetest_challenge);
		String validate = request.getParameter(GeetestLib.fn_geetest_validate);
		String seccode = request.getParameter(GeetestLib.fn_geetest_seccode);
			
		//从session中获取gt-server状态
		int gt_server_status_code = (Integer) request.getSession().getAttribute(gtSdk.gtServerStatusSessionKey);
		
		//从session中获取userid
		String userid = (String)request.getSession().getAttribute("userid");
		
		int gtResult = 0;

		if (gt_server_status_code == 1) {
			//gt-server正常，向gt-server进行二次验证
				
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
		}
		else {
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
