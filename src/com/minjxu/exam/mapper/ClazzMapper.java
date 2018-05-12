package com.minjxu.exam.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
import com.minjxu.exam.entity.Clazz;

public class ClazzMapper implements RowMapper<Clazz>{

	@Override
	public Clazz mapRow(ResultSet rs, int rowNum) throws SQLException {
		Clazz clazz = new Clazz(rs.getInt(1), rs.getString(2));
		return clazz;
	}

}
