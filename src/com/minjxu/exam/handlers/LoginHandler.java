package com.minjxu.exam.handlers;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.minjxu.exam.entity.Admin;
import com.minjxu.exam.entity.Student;
import com.minjxu.exam.entity.Teacher;
import com.minjxu.exam.jdbctemplate.AdminJDBCTemplate;
import com.minjxu.exam.jdbctemplate.StudentJDBCTemplate;
import com.minjxu.exam.jdbctemplate.TeacherJDBCTemplate;
import com.minjxu.exam.utils.CookieUtils;

@Controller
public class LoginHandler {

	@RequestMapping("/login")
	public String login(HttpServletRequest request, HttpServletResponse response)
			throws UnsupportedEncodingException {

		ApplicationContext context = new ClassPathXmlApplicationContext(
				"Beans.xml");

		HttpSession session = request.getSession(true);
		request.setCharacterEncoding("UTF-8");

		String rtn = "redirect:/index.jsp";
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String type = request.getParameter("inlineRadioOptions");

		if (type.equals("admin")) {
			AdminJDBCTemplate adminJDBCTemplate = (AdminJDBCTemplate) context
					.getBean("adminJDBCTemplate");
			List<Admin> admins = adminJDBCTemplate.listAdmins();
			for (Admin admin : admins) {
				if (admin.getAdminName().equals(username)
						&& admin.getAdminPwd().equals(password)) {
					// 登录成功用session记录
					session.setAttribute("user", admin);
					rtn = "redirect:/admin/index";
				}
			}
		} else if (type.equals("student")) {
			StudentJDBCTemplate studentJDBCTemplate = (StudentJDBCTemplate) context
					.getBean("studentJDBCTemplate");
			List<Student> students = studentJDBCTemplate.listStudents();
			for (Student student : students) {
				if (username.equals(student.getStuId()+"")
						&& student.getStuPwd().equals(password)) {
					session.setAttribute("user", student);
					rtn = "redirect:/student/index";
				}
			}
		} else if (type.equals("teacher")) {
			TeacherJDBCTemplate teacherJDBCTemplate = (TeacherJDBCTemplate) context
					.getBean("teacherJDBCTemplate");
			List<Teacher> teachers = teacherJDBCTemplate.listTeachers();
			for (Teacher teacher : teachers) {
				if (username.equals(teacher.getTeacherId()+"")
						&& teacher.getTeacherPwd().equals(password)) {
					session.setAttribute("user", teacher);
					rtn = "redirect:/teacher/index";
				}
			}
		}
		if (rtn.equals("redirect:/index.jsp")) {
			// 登录失败用session传递
			session.setAttribute("msg", "用户名或密码错误");
		}
		return rtn;
	}
}
