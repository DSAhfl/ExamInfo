package com.minjxu.exam.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.minjxu.exam.entity.Choose;

public class ChooseMapper implements RowMapper<Choose> {

	@Override
	public Choose mapRow(ResultSet rs, int rowNum) throws SQLException {
		Choose choose = new Choose(rs.getInt(1), rs.getInt(2), rs.getInt(3));
		return choose;
	}

}
