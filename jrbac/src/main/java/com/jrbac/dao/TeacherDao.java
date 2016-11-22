package com.jrbac.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jrbac.entity.Teacher;

/**
 * @author 程高伟
 * @date 2016年11月17日 上午10:25:22
 */
public interface TeacherDao {

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
	 * 新增教师
	 * 
	 * @param teacher
	 * @return
	 */
	public int add(@Param("teacher") Teacher teacher);

	/**
	 * 修改教师
	 * 
	 * @param teacher
	 * @return
	 */
	public int update(@Param("teacher") Teacher teacher);

	
	/**
	 * 删除教师
	 * @param id
	 * @return
	 */
	public int delete( String id);
}
