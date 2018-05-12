package com.minjxu.exam.dao;

import java.util.List;

import javax.sql.DataSource;

import com.minjxu.exam.entity.Admin;


public interface AdminDao {
	public void setDataSource(DataSource ds);

	public List<Admin> listAdmins();
	
	public int update(Admin admin);
	
}
