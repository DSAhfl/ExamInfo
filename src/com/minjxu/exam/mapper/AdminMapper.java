package com.minjxu.exam.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.minjxu.exam.entity.Admin;

public class AdminMapper implements RowMapper<Admin> {
	public Admin mapRow(ResultSet rs, int rowNum) throws SQLException {
		Admin admin = new Admin(rs.getInt(1), rs.getString(2), rs.getString(3));
		return admin;
	}
}
