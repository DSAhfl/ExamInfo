package com.minjxu.exam.jdbctemplate;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;

import com.minjxu.exam.dao.LessonDao;
import com.minjxu.exam.entity.Lesson;
import com.minjxu.exam.entity.Teacher;
import com.minjxu.exam.mapper.LessonMapper;

public class LessonJDBCTemplate implements LessonDao {
	private JdbcTemplate jdbcTemplateObject;

	@Override
	public void setDataSource(DataSource ds) {
		this.jdbcTemplateObject = new JdbcTemplate(ds);

	}

	@Override
	public List<Lesson> listLesson() {
		String SQL = "SELECT * FROM lesson";
		List<Lesson> lessons = jdbcTemplateObject
				.query(SQL, new LessonMapper());
		return lessons;
	}

	public List<Lesson> listLessonByTeacher(Teacher teacher) {
		String SQL = "SELECT * FROM lesson WHERE teacherId = "
				+ teacher.getTeacherId();
		List<Lesson> lessons = jdbcTemplateObject
				.query(SQL, new LessonMapper());
		return lessons;
	}
}
