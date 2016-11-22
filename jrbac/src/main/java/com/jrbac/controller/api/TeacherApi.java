package com.jrbac.controller.api;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jrbac.context.BaseReturn;
import com.jrbac.context.ErrorCode;
import com.jrbac.entity.Teacher;
import com.jrbac.service.TeacherService;

@Controller

public class TeacherApi {
	@Autowired
	private TeacherService teacherService;

	@RequestMapping("/api/teachers")
	@ResponseBody
	public String getAll() {
		List<Teacher> teacherList = teacherService.queryAll();
		if (teacherList.isEmpty()) {
			return BaseReturn.response(ErrorCode.RECORD_NULL, "暂无数据");
		} else {
			return BaseReturn.response(teacherList);
		}
	}

	@RequestMapping(value = "/api/teacher/{id}", method = RequestMethod.GET)
	@ResponseBody
	public String detial(@PathVariable String id, HttpServletRequest request) {

		if (StringUtils.isBlank(id)) {
			return BaseReturn.response(ErrorCode.PARAM_ERROR, "id不能为空");
		} else {
			Teacher teacher = teacherService.queryById(id);
			if (null != teacher) {
				return BaseReturn.response(ErrorCode.SUCCESS, teacher);
			} else {
				return BaseReturn.response(ErrorCode.RECORD_NULL, "暂无数据");
			}
		}

	}

}
