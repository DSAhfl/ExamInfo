package com.minjxu.exam.jdbctemplate;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;

import com.minjxu.exam.dao.TeacherDao;
import com.minjxu.exam.entity.Teacher;
import com.minjxu.exam.mapper.TeacherMapper;

public class TeacherJDBCTemplate implements TeacherDao {
	private JdbcTemplate jdbcTemplateObject;

	@Override
	public void setDataSource(DataSource ds) {
		this.jdbcTemplateObject = new JdbcTemplate(ds);

	}

	@Override
	public List<Teacher> listTeachers() {
		String SQL = "select * from teacher";
		List<Teacher> teachers = jdbcTemplateObject.query(SQL,
				new TeacherMapper());
		return teachers;
	}

}
