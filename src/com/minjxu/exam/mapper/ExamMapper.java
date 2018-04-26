package com.minjxu.exam.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.minjxu.exam.entity.Exam;

public class ExamMapper implements RowMapper<Exam> {

	@Override
	public Exam mapRow(ResultSet rs, int rowNum) throws SQLException {
		Exam exam = new Exam(rs.getInt(1), rs.getInt(2), rs.getTimestamp(3),
				rs.getTimestamp(4));
		return exam;
	}

}
