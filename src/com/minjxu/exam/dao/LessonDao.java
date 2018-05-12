package com.minjxu.exam.dao;

import java.util.List;

import javax.sql.DataSource;

import com.minjxu.exam.entity.Choose;
import com.minjxu.exam.entity.Lesson;
import com.minjxu.exam.entity.Student;
import com.minjxu.exam.entity.Teacher;

public interface LessonDao {
	public void setDataSource(DataSource ds);

	public List<Lesson> listLesson();
	
	public List<Lesson> listLessonByTeacher(Teacher teacher);
	
	public int add(String lessonName, int teacherId);
	
	public int delete(String lessonName);
	
	public int update( String lessonName,int teacherId );
	
	public List<Lesson> listLessonByStu(Student student);
	
	public List<Choose> listChoose();
}
