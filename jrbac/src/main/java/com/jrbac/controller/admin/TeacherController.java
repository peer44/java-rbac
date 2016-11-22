package com.jrbac.controller.admin;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.jrbac.context.BaseReturn;
import com.jrbac.context.ErrorCode;
import com.jrbac.entity.Teacher;
import com.jrbac.service.ImageService;
import com.jrbac.service.TeacherService;

/**
 * 教师素材管理
 * 
 * @author 程高伟
 * @date 2016年11月15日 上午10:03:31
 */
@Controller
@RequestMapping(value = "/admin/teacher")
public class TeacherController {
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	private String uploadPath = "/assets/upload/teacher/";
	@Autowired
	private TeacherService teacherService;

	/**
	 * 教师管理
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/index.html", method = RequestMethod.GET)
	public String index(Model model) {
		logger.debug("-----教师管理-----");
		model.addAttribute("title", "教师管理");
		model.addAttribute("teacherList", teacherService.queryAll());
		return "admin/teacher/index";
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	@ResponseBody
	public String add(Teacher teacher, @RequestParam(required = false) MultipartFile file, HttpServletRequest request)
			throws IOException {

		logger.debug("-----添加教师-----");
		logger.info("-----传过来的教师:{}-----", teacher);
		if (null == file || file.isEmpty()) {
			logger.info("-----没有上传文件-----");
		} else {
			logger.info("-----文件大小:{}----- ", file.getSize());
			logger.info("-----文件类型:{}-----", file.getContentType());
			logger.info("-----表单名称:{}-----", file.getName());
			logger.info("-----文件原名:{}-----", file.getOriginalFilename());
			if (file.getSize() > 5 * 1024 * 1024) {
				return BaseReturn.response(ErrorCode.FAILURE, "图片大小不能超过5M");
			}
			if (!file.getContentType().contains("image")) {
				return BaseReturn.response(ErrorCode.FAILURE, "不支持的图片类型：" + file.getContentType());
			}
			String image = ImageService.saveImage(request, file, uploadPath);
			teacher.setImg(image);
			teacherService.save(teacher);
		}
		return BaseReturn.response(ErrorCode.SUCCESS, teacher);

	}

	@RequestMapping(value = "/delete/{id}", method = RequestMethod.POST)
	@ResponseBody
	public String delete(@PathVariable String id, HttpServletRequest request) {

		logger.debug("-----删除教师-----");
		logger.info("-----传过来的id:{}-----", id);
		if (StringUtils.isBlank(id)) {
			return BaseReturn.response(ErrorCode.PARAM_ERROR, "id不能为空");
		} else {
			int deleteCount = 0;
			Teacher teacher = teacherService.queryById(id);
			if (null != teacher) {
				deleteCount = teacherService.delete(id);
				if(deleteCount>0){
					if(ImageService.deleteFile(request, teacher.getImg())){
						return BaseReturn.response(ErrorCode.SUCCESS, deleteCount);
					}
				}else{
					return BaseReturn.response(ErrorCode.FAILURE, "删除数据失败");
				}
			} else {
				BaseReturn.response(ErrorCode.RECORD_NULL, "找不到要删除的数据");
			}
			return BaseReturn.response(ErrorCode.SUCCESS, deleteCount);
			
		}

	}

}
