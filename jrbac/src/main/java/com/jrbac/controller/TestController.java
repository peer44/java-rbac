package com.jrbac.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jrbac.context.BaseReturn;

@Controller
public class TestController {
	@ResponseBody
	@RequestMapping("/test/json")
	public String testJson() {
		Map<String, Object> map = new HashMap<>();
		map.put("key", "程高伟");
		return BaseReturn.response(map);
	}

}
