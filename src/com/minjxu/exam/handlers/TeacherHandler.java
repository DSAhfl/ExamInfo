package com.minjxu.exam.handlers;

import java.io.UnsupportedEncodingException;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.minjxu.exam.entity.Choose;
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
@RequestMapping("/teacher")
public class TeacherHandler {

	ApplicationContext context = new ClassPathXmlApplicationContext("Beans.xml");
	TeacherJDBCTemplate teacherJDBCTemplate = (TeacherJDBCTemplate) context
			.getBean("teacherJDBCTemplate");
	LessonJDBCTemplate lessonJDBCTemplate = (LessonJDBCTemplate) context
			.getBean("lessonJDBCTemplate");
	ExamJDBCTemplate examJDBCTemplate = (ExamJDBCTemplate) context
			.getBean("examJDBCTemplate");
	StudentJDBCTemplate studentJDBCTemplate = (StudentJDBCTemplate) context
			.getBean("studentJDBCTemplate");

	private void init(HttpSession session) {
		List<Exam> exams = examJDBCTemplate.listExams();
		List<Lesson> lessons = lessonJDBCTemplate.listLesson();
		List<Teacher> teachers = teacherJDBCTemplate.listTeachers();
		List<ExamDetail> examDetails = examJDBCTemplate.listExamDetail();
		List<Room> rooms = examJDBCTemplate.listRoom();
		List<Clazz> clazzs = studentJDBCTemplate.listClazz();
		List<Student> students = studentJDBCTemplate.listStudents();
		
		Teacher teacher = (Teacher) session.getAttribute("user");

		// 存储该老师教授的课程
		List<Lesson> teacherLessons = lessonJDBCTemplate
				.listLessonByTeacher(teacher);
		session.setAttribute("teacherLessons", teacherLessons);
		
		List<StuExamView> stuExamViews = new ArrayList<StuExamView>();

		for (Lesson lesson : teacherLessons) {
			String lessonName = null;
			String lessonTeacher = null;
			Date examDate = null;
			int examTime = 0;
			String roomName = null;
			String examTeacher = null;
			int score = 0;
			String clazzName = null;
			boolean add = false;
			lessonName = lesson.getLessonName();
			for (Exam exam : exams) {
				if (exam.getLessonId() == lesson.getLessonId()) {
					examDate = exam.getExamDate();
					examTime = exam.getExamTime();
					for (ExamDetail detail : examDetails) {
						if (detail.getExamId() == exam.getExamId()) {
							for (Teacher tea : teachers) {
								// 为视图设置教师名称
								if (tea.getTeacherId() == detail.getTeacherId()) {
									examTeacher = tea.getTeacherName();
								}
							}
							for (Room room : rooms) {
								// 设置教室名称
								if (room.getRoomId() == detail.getRoomId()) {
									roomName = room.getRoomName();
								}
							}
							for (Clazz clazz : clazzs) {
								// 设置班级名称
								if (clazz.getClassId() == detail.getClassId()) {
									clazzName = clazz.getClassName();
									break;
								}
							}
							if (stuExamViews.size() > 0) {
								StuExamView vi = stuExamViews.get(stuExamViews
										.size() - 1);
								if (vi.getLessonName().equals(lessonName)
										&& vi.getRoomName().equals(roomName)) {
									vi.setClazzName(vi.getClazzName() + "，"
											+ clazzName);
									add = true;
									continue;
								}
							}
							stuExamViews.add(new StuExamView(lessonName,
									lessonTeacher, examDate, examTime,
									roomName, examTeacher, score, clazzName));
							add = true;
						}
					}
				}
			}
			if (!add) {
				stuExamViews.add(new StuExamView(lessonName, lessonTeacher,
						examDate, examTime, roomName, examTeacher, score,
						clazzName));
			}
		}
		session.setAttribute("stuExamViews", stuExamViews);
		session.setAttribute("lessons", lessons);
		session.setAttribute("clazzs", clazzs);
		session.setAttribute("teachers", teachers);
		session.setAttribute("students", students);
		session.setAttribute("rooms", rooms);
		session.setAttribute("exams", exams);
		session.setAttribute("examDetails", examDetails);

	}

	@RequestMapping("/index")
	public String index(HttpServletRequest request, HttpServletResponse response)
			throws UnsupportedEncodingException {
		HttpSession session = request.getSession(true);
		request.setCharacterEncoding("UTF-8");

		init(session);
		




		return "teacher_index";
	}

	@RequestMapping("/exam")
	public String teacherExam(HttpServletRequest request,
			HttpServletResponse response) throws UnsupportedEncodingException {
		HttpSession session = request.getSession(true);
		request.setCharacterEncoding("UTF-8");

		return "teacher_exam";
	}

	@RequestMapping("/score")
	public String teacherScore(HttpServletRequest request,
			HttpServletResponse response) throws UnsupportedEncodingException {
		HttpSession session = request.getSession(true);
		request.setCharacterEncoding("UTF-8");

		List<Score> scores = examJDBCTemplate.listScore();
		session.setAttribute("scores", scores);

		List<Student> students = studentJDBCTemplate.listStudents();
		session.setAttribute("students", students);

		return "teacher_score";
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

	/*
	 * @RequestMapping("/editExam") public String
	 * teacherEditExam(HttpServletRequest request, HttpServletResponse response)
	 * throws UnsupportedEncodingException, ParseException {
	 * 
	 * HttpSession session = request.getSession(true);
	 * request.setCharacterEncoding("UTF-8");
	 * 
	 * String examName = request.getParameter("examName");
	 * 
	 * DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); Date
	 * date = null; String str = null;
	 * 
	 * str = request.getParameter("beginTime"); date = format.parse(str);
	 * Timestamp beginTime = new Timestamp(date.getTime());
	 * 
	 * str = request.getParameter("endTime"); date = format.parse(str);
	 * Timestamp endTime = new Timestamp(date.getTime());
	 * 
	 * List<Lesson> teacherLessons = (List<Lesson>) session
	 * .getAttribute("teacherLessons");
	 * 
	 * int lessonId = 0;
	 * 
	 * for (Lesson lesson : teacherLessons) { if
	 * (lesson.getLessonName().equals(examName)) { lessonId =
	 * lesson.getLessonId(); break; } }
	 * 
	 * Exam exam = new Exam(); if (beginTime.compareTo(endTime) <= 0 &&
	 * beginTime.compareTo(new Date()) >= 0) { if (examJDBCTemplate.update(exam)
	 * <= 0) { session.setAttribute("msg", "修改失败！"); } else {
	 * session.setAttribute("msg", "修改成功！"); List<Exam> teacherExams =
	 * examJDBCTemplate .listExamByLesson(teacherLessons);
	 * session.setAttribute("teacherExams", teacherExams); } } else {
	 * session.setAttribute("msg", "日期有误！"); }
	 * 
	 * return "teacher_exam"; }
	 */

	@RequestMapping("/createExam")
	public String teacherCreateExam(HttpServletRequest request,
			HttpServletResponse response) throws UnsupportedEncodingException,
			ParseException {

		HttpSession session = request.getSession(true);
		request.setCharacterEncoding("UTF-8");

		String examName = request.getParameter("createExamName");
		String dateStr = request.getParameter("createExamDate");
		String editExamTime = request.getParameter("createExamTime");

		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date date = format.parse(dateStr);
		Date examDate = new Date(date.getTime());

		if (examDate.compareTo(new java.util.Date()) <= 0) {
			session.setAttribute("msg", "日期有误,创建失败!");
			return "teacher_exam";
		}

		List<Lesson> lessons = (List<Lesson>) session.getAttribute("lessons");
		List<Teacher> teachers = (List<Teacher>) session
				.getAttribute("teachers");
		List<Exam> exams = (List<Exam>) session.getAttribute("exams");
		List<ExamDetail> examDetails = (List<ExamDetail>) session
				.getAttribute("examDetails");
		List<Room> rooms = (List<Room>) session.getAttribute("rooms");

		int lessonId = 0, teacherId = 0, examId = 0, examTime = 0, roomId = 0;

		for (Lesson lesson : lessons) {
			if (lesson.getLessonName().equals(examName)) {
				lessonId = lesson.getLessonId();
				break;
			}
		}

		if (editExamTime.equals("第1-2节课")) {
			examTime = 12;
		} else if (editExamTime.equals("第3-4节课")) {
			examTime = 34;
		} else if (editExamTime.equals("第5-6节课")) {
			examTime = 56;
		} else if ((editExamTime.equals("第7-8节课"))) {
			examTime = 78;
		}

		// 列表需要考试的班级
		List<Choose> chooses = lessonJDBCTemplate.listChoose();
		List<Integer> examClassIds = new ArrayList<Integer>();
		for (Choose choose : chooses) {
			if (choose.getLessonId() == lessonId) {
				examClassIds.add(new Integer(choose.getClassId()));
			}
		}

		for (Exam exam : exams) {
			if (exam.getLessonId() == lessonId) {
				session.setAttribute("msg", "该考试已存在,创建失败!");
				return "teacher_exam";
			}
			if (exam.getExamDate().compareTo(examDate) == 0
					&& exam.getExamTime() == examTime) {
				for (ExamDetail detail : examDetails) {
					if (examClassIds.contains(new Integer(detail.getClassId()))) {
						session.setAttribute("msg", "该时间和部分班级的其他考试有冲突,创建失败!");
						return "teacher_exam";
					}
				}
			}
			examId = examId > exam.getExamId() ? examId : exam.getExamId() + 1;
		}

		Exam exam = new Exam(examId, lessonId, examDate, examTime);
		// System.out.println(exams);
		// System.out.println(exam);
		// 列表并排序教师和考场
		HashMap<Integer, Integer> teaMap = new HashMap<Integer, Integer>();
		HashMap<Integer, Integer> roomMap = new HashMap<Integer, Integer>();
		// 初始化Map
		for (Teacher teacher : teachers) {
			teaMap.put(teacher.getTeacherId(), 0);
		}
		for (Room room : rooms) {
			roomMap.put(room.getRoomId(), 0);
		}
		// 设定已经在考试中出现的监考老师和教室的次数
		for (ExamDetail detail : examDetails) {
			teaMap.replace(detail.getTeacherId(),
					teaMap.get(detail.getTeacherId()) + 1);
			roomMap.replace(detail.getRoomId(),
					roomMap.get(detail.getRoomId()) + 1);
		}
		// 进行排序
		List<Map.Entry<Integer, Integer>> teaList = new ArrayList<Map.Entry<Integer, Integer>>(
				teaMap.entrySet());
		Collections.sort(teaList,
				new Comparator<Map.Entry<Integer, Integer>>() {
					public int compare(Map.Entry<Integer, Integer> o1,
							Map.Entry<Integer, Integer> o2) {
						return (o1.getValue()).toString().compareTo(
								o2.getValue().toString());
					}
				});

		List<Map.Entry<Integer, Integer>> roomList = new ArrayList<Map.Entry<Integer, Integer>>(
				roomMap.entrySet());
		Collections.sort(roomList,
				new Comparator<Map.Entry<Integer, Integer>>() {
					public int compare(Map.Entry<Integer, Integer> o1,
							Map.Entry<Integer, Integer> o2) {
						return (o1.getValue()).toString().compareTo(
								o2.getValue().toString());
					}
				});
		// System.out.println(teaList);
		// System.out.println(roomList);

		// 分配考场，分配监考老师
		int teaIndex = 0, roomIndex = 0, classCnt = 0;
		List<ExamDetail> addDetails = new ArrayList<ExamDetail>();
		for (Integer examClassId : examClassIds) {
			ExamDetail detail = new ExamDetail();
			detail.setClassId(examClassId.intValue());
			detail.setExamId(exam.getExamId());

			do {
				if (teaIndex == teaList.size()) {
					session.setAttribute("msg", "监考教师数量不足，无法分配,创建失败!");
					return "teacher_exam";
				}
				System.out.println(teaList);
				// 检查该教师是否有空监考
				boolean free = true;
				for (ExamDetail detail2 : examDetails) {
					if (detail2.getTeacherId() == teaList.get(teaIndex)
							.getKey()) {
						for (Exam exam2 : exams) {
							if (exam2.getExamId() == detail2.getExamId()
									&& exam2.getExamDate().compareTo(examDate) == 0
									&& exam2.getExamTime() == examTime) {
								free = false;
								break;
							}
						}
					}
					if (!free) {
						break;
					}
				}
				if (free) {
					detail.setTeacherId(teaList.get(teaIndex).getKey());
				} else {
					++teaIndex;
				}
			} while (detail.getTeacherId() == 0);

			do {
				if (roomIndex == roomList.size()) {
					session.setAttribute("msg", "考试教室数量不足，无法分配,创建失败!");
					return "teacher_exam";
				}
				// 检查该教室是否有空
				boolean free = true;
				for (ExamDetail detail2 : examDetails) {
					if (detail2.getRoomId() == roomList.get(roomIndex).getKey()) {
						for (Exam exam2 : exams) {
							if (exam2.getExamId() == detail2.getExamId()
									&& exam2.getExamDate().compareTo(examDate) == 0
									&& exam2.getExamTime() == examTime) {
								free = false;
								break;
							}
						}
					}
					if (!free) {
						break;
					}
				}
				if (free) {
					detail.setRoomId(roomList.get(roomIndex).getKey());
				} else {
					++roomIndex;
				}
			} while (detail.getRoomId() == 0);

			addDetails.add(detail);

			++classCnt;
			if (classCnt > 0 && classCnt % 2 == 0) {
				++teaIndex;
				++roomIndex;
			}
		}

		if (addDetails.size() == examClassIds.size()) {
			// System.out.println(exam);
			// System.out.println(addDetails);
			if (examJDBCTemplate.add(exam, addDetails) > 0) {
				session.setAttribute("msg", "创建成功!");
				init(session);
			} else {
				session.setAttribute("msg", "创建失败!");
			}
		} else {
			session.setAttribute("msg", "考试教室或监考教师数量不足，无法分配,创建失败!");
		}

		return "teacher_exam";
	}

	/*
	 * @RequestMapping("/deleteExam") public String
	 * teacherDeleteExam(HttpServletRequest request, HttpServletResponse
	 * response) throws UnsupportedEncodingException, ParseException {
	 * 
	 * HttpSession session = request.getSession(true);
	 * request.setCharacterEncoding("UTF-8");
	 * 
	 * String lessonName = request.getParameter("lessonName");
	 * 
	 * int timeCmp = new Integer(request.getParameter("timeCmp")).intValue();
	 * 
	 * List<Lesson> teacherLessons = (List<Lesson>) session
	 * .getAttribute("teacherLessons"); List<Exam> teacherExams =
	 * examJDBCTemplate .listExamByLesson(teacherLessons);
	 * 
	 * int lessonId = 0;
	 * 
	 * if (timeCmp <= 0) { session.setAttribute("msg", "该课程已考试，无法删除！"); } else {
	 * for (Lesson lesson : teacherLessons) { if
	 * (lesson.getLessonName().equals(lessonName)) { lessonId =
	 * lesson.getLessonId(); break; } }
	 * 
	 * if (examJDBCTemplate.delete(lessonId) <= 0) { session.setAttribute("msg",
	 * "删除失败！"); } else { session.setAttribute("msg", "删除成功！"); teacherExams =
	 * examJDBCTemplate .listExamByLesson(teacherLessons);
	 * session.setAttribute("teacherExams", teacherExams); } }
	 * 
	 * return "teacher_exam"; }
	 */
	@RequestMapping("/setScore")
	public String teacherSetScore(HttpServletRequest request,
			HttpServletResponse response) throws UnsupportedEncodingException,
			ParseException {

		HttpSession session = request.getSession(true);
		request.setCharacterEncoding("UTF-8");

		String examName = request.getParameter("examName");
		int stuId = new Integer(request.getParameter("stuId")).intValue();
		int score = new Integer(request.getParameter("score")).intValue();

		List<Lesson> teacherLessons = (List<Lesson>) session
				.getAttribute("teacherLessons");

		int lessonId = 0;

		for (Lesson lesson : teacherLessons) {
			if (lesson.getLessonName().equals(examName)) {
				lessonId = lesson.getLessonId();
				break;
			}
		}

		if (examJDBCTemplate.setScore(lessonId, stuId, score) <= 0) {
			session.setAttribute("msg", "修改失败！");
		} else {
			List<Score> scores = examJDBCTemplate.listScore();
			session.setAttribute("scores", scores);
			session.setAttribute("msg", "修改成功！");
		}

		return "teacher_score";
	}

}
