package com.minjxu.exam.handlers;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.minjxu.exam.entity.Lesson;
import com.minjxu.exam.entity.StuExamView;
import com.minjxu.exam.entity.Student;
import com.minjxu.exam.jdbctemplate.LessonJDBCTemplate;
import com.minjxu.exam.jdbctemplate.StudentJDBCTemplate;

@Controller
@RequestMapping("/student")
public class StudentHandler {
	ApplicationContext context = new ClassPathXmlApplicationContext("Beans.xml");
	StudentJDBCTemplate studentJDBCTemplate = (StudentJDBCTemplate) context
			.getBean("studentJDBCTemplate");

	@RequestMapping("/index")
	public String studentIndex(HttpServletRequest request,
			HttpServletResponse response) throws UnsupportedEncodingException {

		HttpSession session = request.getSession(true);
		request.setCharacterEncoding("UTF-8");

		LessonJDBCTemplate lessonJDBCTemplate = (LessonJDBCTemplate) context
				.getBean("lessonJDBCTemplate");

		Student student = (Student) session.getAttribute("user");

		// 存储已选的课程
		List<Lesson> allLessons = lessonJDBCTemplate.listLesson();
		session.setAttribute("allLessons", allLessons);

		// 存放学生的选课信息成绩等视图
		List<StuExamView> stuExams = studentJDBCTemplate.listStuExam(student);

		for (StuExamView stuExamView : stuExams) {
			if (stuExamView.getGrade() > 0) {
				session.setAttribute("recentExam", stuExamView);// 显示最近一个有成绩的考试信息
				break;
			}

		}
		// System.out.println(stuExams);
		session.setAttribute("stuExams", stuExams);

		return "student_index";
	}

	@RequestMapping("/exam")
	public String studentExam(HttpServletRequest request,
			HttpServletResponse response) throws UnsupportedEncodingException {

		HttpSession session = request.getSession(true);
		request.setCharacterEncoding("UTF-8");

		return "student_exam";
	}

	@RequestMapping("/chooseLesson")
	public String studentChooseLesson(HttpServletRequest request,
			HttpServletResponse response) throws UnsupportedEncodingException {

		HttpSession session = request.getSession(true);
		request.setCharacterEncoding("UTF-8");

		Student student = (Student) session.getAttribute("user");
		String lessonName = request.getParameter("lesson");
		// 检查课程是否已选
		boolean choose = false;
		List<StuExamView> stuExams = (List<StuExamView>) session
				.getAttribute("stuExams");
		for (StuExamView stuExam : stuExams) {
			if (stuExam.getLessonName().equals(lessonName)) {
				session.setAttribute("choose", "该课程已选！");
				choose = true;
				break;
			}
		}
		if (!choose) {
			List<Lesson> allLessons = (List<Lesson>) session
					.getAttribute("allLessons");
			// 如果没有选过，则选课
			for (Lesson lesson : allLessons) {
				if (lesson.getLessonName().equals(lessonName)) {
					// 选课
					if (studentJDBCTemplate.choose(student,
							lesson.getLessonId()) > 0) {
						session.setAttribute("choose", "选课成功！");
						stuExams = studentJDBCTemplate.listStuExam(student);
						session.setAttribute("stuExams", stuExams);
					} else {
						session.setAttribute("choose", "选课失败！");
					}
					break;
				}
			}
		}

		return "student_exam";
	}

	@RequestMapping("/chgInfo")
	public String studentChgInfo(HttpServletRequest request,
			HttpServletResponse response) throws UnsupportedEncodingException {

		HttpSession session = request.getSession(true);
		request.setCharacterEncoding("UTF-8");

		Student student = (Student) session.getAttribute("user");

		String username = request.getParameter("user");
		// System.out.println(username);

		student.setStuName(username);

		if (studentJDBCTemplate.update(student) <= 0) {
			session.setAttribute("update", "修改失败！");
		} else {
			session.setAttribute("update", "修改成功！");

		}
		// 更新用户信息
		session.setAttribute("user", student);

		return "student_index";
	}

	@RequestMapping("/chgPwd")
	public String studentChgPwd(HttpServletRequest request,
			HttpServletResponse response) throws UnsupportedEncodingException {

		HttpSession session = request.getSession(true);
		request.setCharacterEncoding("UTF-8");

		Student student = (Student) session.getAttribute("user");

		String oldPassword = request.getParameter("oldPassword");
		String newPassword = request.getParameter("newPassword");

		// 先检查旧密码是否正确，再检查是否修改成功
		if (student.getStuPwd().equals(oldPassword)) {
			student.setStuPwd(newPassword);
			if (studentJDBCTemplate.update(student) <= 0) {
				session.setAttribute("update", "修改失败！");
			} else {
				session.setAttribute("update", "修改成功！");
			}
			session.setAttribute("user", student);
		} else {
			session.setAttribute("update", "旧密码错误！修改失败！");
		}

		return "student_index";
	}

	@RequestMapping("/dropout")
	public String studentDropout(HttpServletRequest request,
			HttpServletResponse response) throws UnsupportedEncodingException {

		HttpSession session = request.getSession(true);
		request.setCharacterEncoding("UTF-8");

		String lessonName = request.getParameter("lessonName");
		int timeCmp = new Integer(request.getParameter("timeCmp")).intValue();

		Student student = (Student) session.getAttribute("user");
		List<StuExamView> stuExams = (List<StuExamView>) session
				.getAttribute("stuExams");
		List<Lesson> allLessons = (List<Lesson>) session
				.getAttribute("allLessons");

		if (timeCmp <= 0) {
			session.setAttribute("choose", "该课程已考试，无法退课！");
		} else {
			for (StuExamView stuExam : stuExams) {
				if (stuExam.getLessonName().equals(lessonName)) {
					stuExams.remove(stuExam);
					break;
				}
			}
			for (Lesson lesson : allLessons) {
				if (lesson.getLessonName().equals(lessonName)) {
					if (studentJDBCTemplate.dropout(student,
							lesson.getLessonId()) > 0) {
						session.setAttribute("choose", "退课成功！");
					} else {
						session.setAttribute("choose", "退课失败！");
					}
					break;
				}
			}
		}

		return "student_exam";
	}
}
