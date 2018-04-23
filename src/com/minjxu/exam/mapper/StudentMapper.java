package com.minjxu.exam.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.minjxu.exam.entity.Student;

public class StudentMapper implements RowMapper<Student> {

	@Override
	public Student mapRow(ResultSet rs, int rowNum) throws SQLException {
		Student student = new Student(rs.getInt(1), rs.getString(2),
				rs.getString(3), rs.getString(4));
		return student;
	}

}
