package com.minjxu.exam.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.minjxu.exam.entity.StuExamView;

public class StuExamMapper implements RowMapper<StuExamView> {

	@Override
	public StuExamView mapRow(ResultSet rs, int rowNum) throws SQLException {
		StuExamView stuExam = new StuExamView(rs.getString(1), rs.getTimestamp(2),
				rs.getTimestamp(3), rs.getString(4), rs.getInt(5));
		return stuExam;
	}

}
