package com.jrbac.service;

import java.util.List;

import com.jrbac.entity.Teacher;

/**
 * @author 程高伟
 *
 * @date 2016年6月16日 下午9:27:47
 */
public interface TeacherService {
	/**
	 * 查询所有的教师
	 * 
	 * @return
	 */
	public List<Teacher> queryAll();

	/**
	 * 根据id查询教师
	 * 
	 * @return
	 */
	public Teacher queryById(String id);

	/**
	 * 保存老师
	 * 
	 * @param teacher
	 * @return
	 */
	public int save(Teacher teacher);

	/**
	 * 删除老师
	 * 
	 * @param id
	 * @return
	 */
	public int delete(String id);

}
