package com.minjxu.exam.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.minjxu.exam.entity.Score;

public class ScoreMapper implements RowMapper<Score> {

	@Override
	public Score mapRow(ResultSet rs, int rowNum) throws SQLException {
		Score score = new Score(rs.getInt(1), rs.getInt(2),
				rs.getInt(3), rs.getInt(4));
		return score;
	}

}
