package com.test.springmvc.jdbctest;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class AdminMapper implements RowMapper<Admin> {
	   public Admin mapRow(ResultSet rs, int rowNum) throws SQLException {
		  Admin admin = new Admin();
		  admin.setId(rs.getInt("id"));
	      return admin;
	   }
	}
