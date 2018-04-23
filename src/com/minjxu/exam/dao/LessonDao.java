package com.minjxu.exam.dao;

import java.util.List;

import javax.sql.DataSource;

import com.minjxu.exam.entity.Lesson;

public interface LessonDao {
	public void setDataSource(DataSource ds);

	public List<Lesson> listLesson();
}
