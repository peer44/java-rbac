package com.jrbac.util;

import org.json.JSONObject;
import org.junit.Test;

public class HttpUtilTest {

	@Test
	public void testSendPostStringString() {
		String url = "http://chiq3.smart-tv.cn/chiq_webservice/services?appKey=mr3z5f&method=ch.tvmall.chiq.category.get&v=2&format=json";
		String jsonStr="{\"reqNum\":5,\"resIconType\":\"HOR_LARGE\",\"version\":5,\"providerCode\":\"chiq3\",\"safeFlag\":2,\"client\":{\"sn\":null,\"uid\":\"default_user\",\"agent_name\":\"chiq_phone_android\",\"agent_ver\":\"2.2.005\",\"device\":\"PHONE\",\"tv_version\":\"ZLM65HiS2_1.00019\"}}";
		String result = HttpUtil.sendPost(url, jsonStr);
		JSONObject jsonObj= new JSONObject(result);

		System.out.println(jsonObj.toString());
	}

}
