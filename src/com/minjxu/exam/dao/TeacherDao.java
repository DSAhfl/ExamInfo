package com.minjxu.exam.dao;

import java.util.List;

import javax.sql.DataSource;

import com.minjxu.exam.entity.Teacher;

public interface TeacherDao {
	public void setDataSource(DataSource ds);

	public List<Teacher> listTeachers();
}
