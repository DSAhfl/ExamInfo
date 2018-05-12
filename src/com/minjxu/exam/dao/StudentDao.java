package com.minjxu.exam.dao;

import java.util.List;

import javax.sql.DataSource;

import com.minjxu.exam.entity.Clazz;
import com.minjxu.exam.entity.Student;

public interface StudentDao {
	public void setDataSource(DataSource ds);
	
	public List<Student> listStudents();
	
	public int update(Student student);

	
	public int choose(Student student,int lessonId);

	public int dropout(Student student, int lessonId);
	
	public int delete(int studentId);
	
	public int add(String stuName, String stuIC, int classId);
	
	public List<Clazz> listClazz();
}
