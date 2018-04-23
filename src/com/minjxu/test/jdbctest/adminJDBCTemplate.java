package com.minjxu.test.jdbctest;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;

public class adminJDBCTemplate implements AdminDAO {

	private DataSource dataSource;
	private JdbcTemplate jdbcTemplateObject;

	@Override
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
		this.jdbcTemplateObject = new JdbcTemplate(dataSource);
	}

	@Override
	public List<Admin> listAdmins() {
		String SQL = "select * from admin";
		List<Admin> admins = jdbcTemplateObject.query(SQL, new AdminMapper());
		return admins;
	}

}
