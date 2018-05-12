package com.minjxu.exam.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.minjxu.exam.entity.ExamDetail;

public class ExamDetailMapper implements RowMapper<ExamDetail> {

	@Override
	public ExamDetail mapRow(ResultSet rs, int rowNum) throws SQLException {
		ExamDetail examDetail = new ExamDetail(rs.getInt(1), rs.getInt(2),
				rs.getInt(3), rs.getInt(4), rs.getInt(5));
		return examDetail;
	}

}
