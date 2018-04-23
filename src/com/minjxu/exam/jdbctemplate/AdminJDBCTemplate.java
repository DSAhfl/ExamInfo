package com.minjxu.exam.jdbctemplate;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;

import com.minjxu.exam.dao.AdminDao;
import com.minjxu.exam.entity.Admin;
import com.minjxu.exam.mapper.AdminMapper;

public class AdminJDBCTemplate implements AdminDao {
	private JdbcTemplate jdbcTemplateObject;

	@Override
	public void setDataSource(DataSource dataSource) {
		this.jdbcTemplateObject = new JdbcTemplate(dataSource);
	}

	@Override
	public List<Admin> listAdmins() {
		String SQL = "select * from admin";
		List<Admin> admins = jdbcTemplateObject.query(SQL, new AdminMapper());
		return admins;
	}
}
