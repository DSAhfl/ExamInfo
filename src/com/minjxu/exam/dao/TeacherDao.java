package com.minjxu.exam.dao;

import java.util.List;

import javax.sql.DataSource;

import com.minjxu.exam.entity.Teacher;

public interface TeacherDao {
	public void setDataSource(DataSource ds);

	public List<Teacher> listTeachers();
	
	public int update(Teacher teacher);
	
	public int delete(int teacherId);
	
	public int add(String teacherName, String teacherIC);
	
	public int update(int teacherId, String teacherName, String teacherIC);
}
