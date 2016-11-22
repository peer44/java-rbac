package com.jrbac.service.impl;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jrbac.dao.TeacherDao;
import com.jrbac.entity.Teacher;
import com.jrbac.service.TeacherService;
import com.jrbac.util.UUIDGenerator;

@Service
public class TeacherServiceImpl implements TeacherService {

	@Autowired
	private TeacherDao teacherDao;

	@Override
	public Teacher queryById(String id) {
		return teacherDao.queryById(id);
	}

	@Override
	public List<Teacher> queryAll() {
		return teacherDao.queryAll();
	}

	@Override
	public int save(Teacher teacher) {
		if (StringUtils.isBlank(teacher.getId())) {
			teacher.setId(UUIDGenerator.getUUID());
			return teacherDao.add(teacher);
		} else {
			return teacherDao.update(teacher);
		}
	}

	@Override
	public int delete(String id) {
		return teacherDao.delete(id);
	}

}
