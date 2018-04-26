package com.minjxu.exam.handlers;

import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.minjxu.exam.entity.Exam;
import com.minjxu.exam.entity.Lesson;
import com.minjxu.exam.entity.Student;
import com.minjxu.exam.entity.Teacher;
import com.minjxu.exam.jdbctemplate.ExamJDBCTemplate;
import com.minjxu.exam.jdbctemplate.LessonJDBCTemplate;
import com.minjxu.exam.jdbctemplate.TeacherJDBCTemplate;

@Controller
@RequestMapping("/teacher")
public class TeacherHandler {

	ApplicationContext context = new ClassPathXmlApplicationContext("Beans.xml");
	TeacherJDBCTemplate teacherJDBCTemplate = (TeacherJDBCTemplate) context
			.getBean("teacherJDBCTemplate");
	LessonJDBCTemplate lessonJDBCTemplate = (LessonJDBCTemplate) context
			.getBean("lessonJDBCTemplate");
	ExamJDBCTemplate examJDBCTemplate = (ExamJDBCTemplate) context
			.getBean("examJDBCTemplate");

	@RequestMapping("/index")
	public String index(HttpServletRequest request, HttpServletResponse response)
			throws UnsupportedEncodingException {
		HttpSession session = request.getSession(true);
		request.setCharacterEncoding("UTF-8");

		Teacher teacher = (Teacher) session.getAttribute("user");

		// 存储该老师课程
		List<Lesson> teacherLessons = lessonJDBCTemplate
				.listLessonByTeacher(teacher);
		session.setAttribute("teacherLessons", teacherLessons);
		// System.out.println(teacherLessons);

		List<Exam> teacherExams = examJDBCTemplate
				.listExamByLesson(teacherLessons);
		session.setAttribute("teacherExams", teacherExams);
		// System.out.println(teacherExams);

		return "teacher_index";
	}

	@RequestMapping("/exam")
	public String adminExam(HttpServletRequest request,
			HttpServletResponse response) throws UnsupportedEncodingException {
		HttpSession session = request.getSession(true);
		request.setCharacterEncoding("UTF-8");
		
		List<Lesson> teacherLessons = (List<Lesson>) session
				.getAttribute("teacherLessons");
		
		List<Exam> teacherExams = examJDBCTemplate
				.listExamByLesson(teacherLessons);
		session.setAttribute("teacherExams", teacherExams);

		return "teacher_exam";
	}

	@RequestMapping("/chgInfo")
	public String teacherChgInfo(HttpServletRequest request,
			HttpServletResponse response) throws UnsupportedEncodingException {

		HttpSession session = request.getSession(true);
		request.setCharacterEncoding("UTF-8");

		Teacher teacher = (Teacher) session.getAttribute("user");

		String username = request.getParameter("user");
		// System.out.println(username);

		teacher.setTeacherName(username);

		if (teacherJDBCTemplate.update(teacher) <= 0) {
			session.setAttribute("update", "修改失败！");
		} else {
			session.setAttribute("update", "修改成功！");

		}
		// 更新用户信息
		session.setAttribute("user", teacher);

		return "teacher_index";
	}

	@RequestMapping("/chgPwd")
	public String teacherChgPwd(HttpServletRequest request,
			HttpServletResponse response) throws UnsupportedEncodingException {

		HttpSession session = request.getSession(true);
		request.setCharacterEncoding("UTF-8");

		Teacher teacher = (Teacher) session.getAttribute("user");

		String oldPassword = request.getParameter("oldPassword");
		String newPassword = request.getParameter("newPassword");

		// 先检查旧密码是否正确，再检查是否修改成功
		if (teacher.getTeacherPwd().equals(oldPassword)) {
			teacher.setTeacherPwd(newPassword);
			if (teacherJDBCTemplate.update(teacher) <= 0) {
				session.setAttribute("update", "修改失败！");
			} else {
				session.setAttribute("update", "修改成功！");
			}
			session.setAttribute("user", teacher);
		} else {
			session.setAttribute("update", "旧密码错误！修改失败！");
		}

		return "teacher_index";
	}

	@RequestMapping("/editExam")
	public String teacherEditExam(HttpServletRequest request,
			HttpServletResponse response) throws UnsupportedEncodingException,
			ParseException {

		HttpSession session = request.getSession(true);
		request.setCharacterEncoding("UTF-8");

		Teacher teacher = (Teacher) session.getAttribute("user");

		String examName = request.getParameter("examName");

		DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = null;
		String str = null;

		str = request.getParameter("beginTime");
		date = format.parse(str);
		Timestamp beginTime = new Timestamp(date.getTime());

		str = request.getParameter("endTime");
		date = format.parse(str);
		Timestamp endTime = new Timestamp(date.getTime());

		List<Lesson> teacherLessons = (List<Lesson>) session
				.getAttribute("teacherLessons");

		int lessonId = 0;

		for (Lesson lesson : teacherLessons) {
			if (lesson.getLessonName().equals(examName)) {
				lessonId = lesson.getLessonId();
				break;
			}
		}

		Exam exam = new Exam(0, lessonId, beginTime, endTime);
		// 先检查旧密码是否正确，再检查是否修改成功
		if (beginTime.compareTo(endTime) <= 0
				&& beginTime.compareTo(new Date()) >= 0) {
			if (examJDBCTemplate.update(exam) <= 0) {
				session.setAttribute("update", "修改失败！");
			} else {
				session.setAttribute("update", "修改成功！");
			}
		} else {
			session.setAttribute("update", "日期有误！");
		}

		return "teacher_exam";
	}

}
