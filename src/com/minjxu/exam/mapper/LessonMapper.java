package com.minjxu.exam.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.minjxu.exam.entity.Lesson;

public class LessonMapper implements RowMapper<Lesson> {

	@Override
	public Lesson mapRow(ResultSet rs, int rowNum) throws SQLException {
		Lesson lesson = new Lesson(rs.getInt(1), rs.getString(2), rs.getInt(3));
		return lesson;
	}

}
