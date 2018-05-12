package com.minjxu.exam.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.minjxu.exam.entity.Room;


public class RoomMapper implements RowMapper<Room>{
	@Override
	public Room mapRow(ResultSet rs, int rowNum) throws SQLException {
		Room room = new Room(rs.getInt(1), rs.getString(2));
		return room;
	}
}
