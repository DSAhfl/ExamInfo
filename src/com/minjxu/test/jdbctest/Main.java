package com.minjxu.test.jdbctest;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Main {
	public static void main(String[] args) {
		ApplicationContext context = new ClassPathXmlApplicationContext(
				"Beans.xml");
		adminJDBCTemplate adminJDBCTemplate = (adminJDBCTemplate) context.getBean("adminJDBCTemplate");
		
	     List<Admin> students = adminJDBCTemplate.listAdmins();
	      for (Admin record : students) {
	         System.out.print("ID : " + record.getId() );
	      }
	}
	
}
