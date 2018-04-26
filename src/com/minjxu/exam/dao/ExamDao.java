package com.minjxu.exam.dao;

import java.util.List;

import javax.sql.DataSource;

import com.minjxu.exam.entity.Exam;
import com.minjxu.exam.entity.Lesson;

public interface ExamDao {
	public void setDataSource(DataSource ds);

	public List<Exam> listExams();
	
	
	public List<Exam> listExamByLesson(List<Lesson> teacherLessons);
}
