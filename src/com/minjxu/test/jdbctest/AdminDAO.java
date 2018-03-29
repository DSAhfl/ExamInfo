package com.minjxu.test.jdbctest;

import java.util.List;

import javax.sql.DataSource;

public interface AdminDAO {
	public void setDataSource(DataSource ds);
	 public List<Admin> listAdmins();
}
