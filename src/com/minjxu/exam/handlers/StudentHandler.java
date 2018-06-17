package com.minjxu.exam.handlers;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.minjxu.exam.entity.Clazz;
import com.minjxu.exam.entity.Exam;
import com.minjxu.exam.entity.ExamDetail;
import com.minjxu.exam.entity.Lesson;
import com.minjxu.exam.entity.Room;
import com.minjxu.exam.entity.Score;
import com.minjxu.exam.entity.StuExamView;
import com.minjxu.exam.entity.Student;
import com.minjxu.exam.entity.Teacher;
import com.minjxu.exam.jdbctemplate.ExamJDBCTemplate;
import com.minjxu.exam.jdbctemplate.LessonJDBCTemplate;
import com.minjxu.exam.jdbctemplate.StudentJDBCTemplate;
import com.minjxu.exam.jdbctemplate.TeacherJDBCTemplate;

@Controller
@RequestMapping("/student")
public class StudentHandler {
	ApplicationContext context = new ClassPathXmlApplicationContext("Beans.xml");
	StudentJDBCTemplate studentJDBCTemplate = (StudentJDBCTemplate) context
			.getBean("studentJDBCTemplate");
	LessonJDBCTemplate lessonJDBCTemplate = (LessonJDBCTemplate) context
			.getBean("lessonJDBCTemplate");
	ExamJDBCTemplate examJDBCTemplate = (ExamJDBCTemplate) context
			.getBean("examJDBCTemplate");
	TeacherJDBCTemplate teacherJDBCTemplate = (TeacherJDBCTemplate) context
			.getBean("teacherJDBCTemplate");

	@RequestMapping("/index")
	public String studentIndex(HttpServletRequest request,
			HttpServletResponse response) throws UnsupportedEncodingException {

		HttpSession session = request.getSession(true);
		request.setCharacterEncoding("UTF-8");

		Student student = (Student) session.getAttribute("user");

		// 存储已选的课程
		List<Lesson> stuLessons = lessonJDBCTemplate.listLessonByStu(student);
		List<Teacher> teachers = teacherJDBCTemplate.listTeachers();
		List<Exam> exams = examJDBCTemplate.listExams();
		List<ExamDetail> examDetails = examJDBCTemplate.listExamDetail();
		List<Score> scores = examJDBCTemplate.listScore();
		List<Room> rooms = examJDBCTemplate.listRoom();
		List<Clazz> clazzs = studentJDBCTemplate.listClazz();

		List<StuExamView> stuExamViews = new ArrayList<StuExamView>();

		for (Lesson stuLesson : stuLessons) {
			StuExamView view = new StuExamView();
			for (Teacher teacher : teachers) {
				// 为视图设置教师名称
				if (teacher.getTeacherId() == stuLesson
						.getTeacherId()) {
					view.setLessonTeacher(teacher.getTeacherName());
				}
			}
			view.setLessonName(stuLesson.getLessonName());
			for (Exam exam : exams) {
				if (exam.getLessonId() == stuLesson.getLessonId()) {
					view.setExamDate(exam.getExamDate());
					view.setExamTime(exam.getExamTime());
					for (ExamDetail detail : examDetails) {
						if (detail.getExamId() == exam.getExamId()
								&& detail.getClassId() == student.getClassId()) {
							for (Teacher teacher : teachers) {
								// 为视图设置教师名称
								if (teacher.getTeacherId() == detail.getTeacherId()) {
									view.setExamTeacher(teacher.getTeacherName());
								}
							}
							for(Room room : rooms){
								if(room.getRoomId()==detail.getRoomId()){
									view.setRoomName(room.getRoomName());
								}
							}
						}
					}
				}
			}
			for (Score score : scores) {
				if (score.getLessonId() == stuLesson.getLessonId()
						&& score.getStuId() == student.getStuId()) {
					view.setScore(score.getScore());
				}
			}
			stuExamViews.add(view);
		}
		
//		System.out.println(stuExamViews);

		session.setAttribute("stuExamViews", stuExamViews);
		session.setAttribute("clazzs", clazzs);
		

		return "student_index";
	}

	@RequestMapping("/exam")
	public String studentExam(HttpServletRequest request,
			HttpServletResponse response) throws UnsupportedEncodingException {

		HttpSession session = request.getSession(true);
		request.setCharacterEncoding("UTF-8");

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

	/*
	@RequestMapping("/dropout")
	public String studentDropout(HttpServletRequest request,
			HttpServletResponse response) throws UnsupportedEncodingException {

		HttpSession session = request.getSession(true);
		request.setCharacterEncoding("UTF-8");

		String lessonName = request.getParameter("lessonName");
		int timeCmp = new Integer(request.getParameter("timeCmp")).intValue();

		Student student = (Student) session.getAttribute("user");
		List<ExamView> stuExams = (List<ExamView>) session
				.getAttribute("stuExams");
		List<Lesson> allLessons = (List<Lesson>) session
				.getAttribute("allLessons");

		if (timeCmp <= 0) {
			session.setAttribute("choose", "该课程已考试，无法退课！");
		} else {
			for (ExamView stuExam : stuExams) {
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
	*/
}
