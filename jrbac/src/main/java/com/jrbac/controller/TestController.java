package com.jrbac.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.jrbac.context.BaseReturn;
import com.jrbac.context.ErrorCode;
import com.jrbac.service.ImageService;

@Controller
@RequestMapping(value = "/admin/test")
public class TestController {
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	private String uploadPath = "/assets/upload/test/";

	/**
	 * 文件上传
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/fileupload.html", method = RequestMethod.GET)
	public String index(Model model) {
		logger.debug("-----文件上传-----");
		model.addAttribute("title", "文件上传");
		return "admin/test/fileupload";
	}

	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	@ResponseBody
	public String add(String name, @RequestParam(required = false) MultipartFile file, HttpServletRequest request)
			throws IOException {

		logger.info("-----上传文件:{}-----", name);
		if (null == file || file.isEmpty()) {
			logger.info("-----没有上传文件-----");
		} else {
			logger.info("-----文件大小:{}----- ", file.getSize());
			logger.info("-----文件类型:{}-----", file.getContentType());
			logger.info("-----表单名称:{}-----", file.getName());
			logger.info("-----文件原名:{}-----", file.getOriginalFilename());
			if (file.getSize() > 10 * 1024 * 1024) {
				return BaseReturn.response(ErrorCode.FAILURE, "图片大小不能超过10M");
			}
			if (!file.getContentType().contains("image")) {
				return BaseReturn.response(ErrorCode.UNSUPPORTED_TYPE, "不支持的图片类型：" + file.getContentType());
			}
			String image = ImageService.saveImage(request, file, uploadPath);
			return BaseReturn.response(ErrorCode.SUCCESS, image);
		}
		return BaseReturn.response(ErrorCode.SUCCESS);
	}
	@ResponseBody
	@RequestMapping("/json")
	public String testJson() {
		Map<String, Object> map = new HashMap<>();
		map.put("key", "程高伟");
		return BaseReturn.response(map);
	}

}
