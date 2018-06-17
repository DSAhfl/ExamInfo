package com.minjxu.exam.handlers;

import java.io.UnsupportedEncodingException;
import java.sql.Date;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Queue;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.minjxu.exam.entity.Admin;
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
import com.minjxu.exam.jdbctemplate.AdminJDBCTemplate;
import com.minjxu.exam.jdbctemplate.ExamJDBCTemplate;
import com.minjxu.exam.jdbctemplate.LessonJDBCTemplate;
import com.minjxu.exam.jdbctemplate.StudentJDBCTemplate;
import com.minjxu.exam.jdbctemplate.TeacherJDBCTemplate;

@Controller
@RequestMapping("/admin")
public class AdminHandler {

	ApplicationContext context = new ClassPathXmlApplicationContext("Beans.xml");

	TeacherJDBCTemplate teacherJDBCTemplate = (TeacherJDBCTemplate) context
			.getBean("teacherJDBCTemplate");
	LessonJDBCTemplate lessonJDBCTemplate = (LessonJDBCTemplate) context
			.getBean("lessonJDBCTemplate");
	ExamJDBCTemplate examJDBCTemplate = (ExamJDBCTemplate) context
			.getBean("examJDBCTemplate");
	AdminJDBCTemplate adminJDBCTemplate = (AdminJDBCTemplate) context
			.getBean("adminJDBCTemplate");
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

		List<StuExamView> stuExamViews = new ArrayList<StuExamView>();

		for (Lesson lesson : lessons) {
			String lessonName = null;
			String lessonTeacher = null;
			Date examDate = null;
			int examTime = 0;
			String roomName = null;
			String examTeacher = null;
			int score = 0;
			String clazzName = null;
			boolean add = false;
			for (Teacher teacher : teachers) {
				// 为视图设置教师名称
				if (teacher.getTeacherId() == lesson.getTeacherId()) {
					lessonTeacher = teacher.getTeacherName();
					break;
				}
			}
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
			if (!add & examDate!=null) {
				stuExamViews.add(new StuExamView(lessonName, lessonTeacher,
						examDate, examTime, roomName, examTeacher, score,
						clazzName));
			}
		}
//		System.out.println(exams);
//		System.out.println(stuExamViews);
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

		return "admin_index";
	}

	@RequestMapping("/exam")
	public String adminExam(HttpServletRequest request,
			HttpServletResponse response) throws UnsupportedEncodingException {

		HttpSession session = request.getSession(true);
		request.setCharacterEncoding("UTF-8");

		return "admin_exam";
	}

	@RequestMapping("/score")
	public String adminScore(HttpServletRequest request,
			HttpServletResponse response) throws UnsupportedEncodingException {
		HttpSession session = request.getSession(true);
		request.setCharacterEncoding("UTF-8");

		List<Score> scores = examJDBCTemplate.listScore();
		session.setAttribute("scores", scores);

		return "admin_score";
	}

	@RequestMapping("/lesson")
	public String adminLesson(HttpServletRequest request,
			HttpServletResponse response) throws UnsupportedEncodingException {
		HttpSession session = request.getSession(true);
		request.setCharacterEncoding("UTF-8");

		return "admin_lesson";
	}

	@RequestMapping("/student")
	public String adminStudent(HttpServletRequest request,
			HttpServletResponse response) throws UnsupportedEncodingException {
		HttpSession session = request.getSession(true);
		request.setCharacterEncoding("UTF-8");

		return "admin_student";
	}

	@RequestMapping("/teacher")
	public String adminTeacher(HttpServletRequest request,
			HttpServletResponse response) throws UnsupportedEncodingException {
		HttpSession session = request.getSession(true);
		request.setCharacterEncoding("UTF-8");

		List<Teacher> teachers = (List<Teacher>) session
				.getAttribute("teachers");
		List<ExamDetail> examDetails = (List<ExamDetail>) session
				.getAttribute("examDetails");

		HashMap<Integer, Integer> teaMap = new HashMap<Integer, Integer>();
		// 初始化Map
		for (Teacher teacher : teachers) {
			teaMap.put(teacher.getTeacherId(), 0);
		}

		for (ExamDetail detail : examDetails) {
			teaMap.replace(detail.getTeacherId(),
					teaMap.get(detail.getTeacherId()) + 1);
		}

		session.setAttribute("teaMap", teaMap);

		return "admin_teacher";
	}

	@RequestMapping("/chgPwd")
	public String teacherChgPwd(HttpServletRequest request,
			HttpServletResponse response) throws UnsupportedEncodingException {

		HttpSession session = request.getSession(true);
		request.setCharacterEncoding("UTF-8");

		Admin admin = (Admin) session.getAttribute("user");

		String oldPassword = request.getParameter("oldPassword");
		String newPassword = request.getParameter("newPassword");

		// 先检查旧密码是否正确，再检查是否修改成功
		if (admin.getAdminPwd().equals(oldPassword)) {
			admin.setAdminPwd(newPassword);
			if (adminJDBCTemplate.update(admin) <= 0) {
				session.setAttribute("msg", "修改失败！");
			} else {
				session.setAttribute("msg", "修改成功！");
			}
			session.setAttribute("user", admin);
		} else {
			session.setAttribute("msg", "旧密码错误！修改失败！");
		}

		return "admin_index";
	}

	@RequestMapping("/createExam")
	public String adminCreateExam(HttpServletRequest request,
			HttpServletResponse response) throws UnsupportedEncodingException,
			ParseException {

		HttpSession session = request.getSession(true);
		request.setCharacterEncoding("UTF-8");

		//获取表单的值
		String examName = request.getParameter("createExamName");
		String dateStr = request.getParameter("createExamDate");
		String editExamTime = request.getParameter("createExamTime");

		//将字符串转为Date类型
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date date = format.parse(dateStr);
		Date examDate = new Date(date.getTime());

		//考试日期必须在明天或者更久以后，否则提示错误
		if (examDate.compareTo(new java.util.Date()) <= 0) {
			session.setAttribute("msg", "日期有误,创建失败!");
			return "admin_exam";
		}

		//取得数据库中各类信息
		List<Lesson> lessons = (List<Lesson>) session.getAttribute("lessons");
		List<Teacher> teachers = (List<Teacher>) session
				.getAttribute("teachers");
		List<Exam> exams = (List<Exam>) session.getAttribute("exams");
		List<ExamDetail> examDetails = (List<ExamDetail>) session
				.getAttribute("examDetails");
		List<Room> rooms = (List<Room>) session.getAttribute("rooms");

		int lessonId = 0, teacherId = 0, examId = 0, examTime = 0, roomId = 0;

		//取得当前考试课程的Id
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

		//检测该课程考试是否已经安排
		for (Exam exam : exams) {
			if (exam.getLessonId() == lessonId) {
				session.setAttribute("msg", "该考试已存在,创建失败!");
				return "admin_exam";
			}
			if (exam.getExamDate().compareTo(examDate) == 0
					&& exam.getExamTime() == examTime) {
				//检测该时间是否有部分班级以及安排了考试
				for (ExamDetail detail : examDetails) {
					if (examClassIds.contains(new Integer(detail.getClassId()))) {
						session.setAttribute("msg", "该时间和部分班级的其他考试有冲突,创建失败!");
						return "admin_exam";
					}
				}
			}
			examId = examId > exam.getExamId() ? examId : exam.getExamId() + 1;
		}
		if(examId==0){
			examId = 1;
		}

		Exam exam = new Exam(examId, lessonId, examDate, examTime);

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
		// 初始化已经在考试中出现的监考老师和教室的次数
		for (ExamDetail detail : examDetails) {
			teaMap.replace(detail.getTeacherId(),
					teaMap.get(detail.getTeacherId()) + 1);
			roomMap.replace(detail.getRoomId(),
					roomMap.get(detail.getRoomId()) + 1);
		}
		//对教师和教室进行排序
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
		//检测每个班级，如果需要考试，则为其分配考场和监考老师
		for (Integer examClassId : examClassIds) {
			ExamDetail detail = new ExamDetail();
			detail.setClassId(examClassId.intValue());
			detail.setExamId(exam.getExamId());

			do {
				if (teaIndex == teaList.size()) {
					session.setAttribute("msg", "监考教师数量不足，无法分配,创建失败!");
					return "admin_exam";
				}
				// 检查该教师是否有空监考
				boolean free = true;
				for (ExamDetail detail2 : examDetails) {
					if (detail2.getTeacherId() == teaList.get(teaIndex)
							.getKey()) {
						for (Exam exam2 : exams) {
							if (exam2.getExamId() == detail2.getExamId()
									&& exam2.getExamDate().compareTo(examDate) == 0
									&& exam2.getExamTime() == examTime) {
								//如果在该时间该老师已经被安排了监考，则检测下一个老师
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
					//如果有空，则在考试细节表设置监考教师Id
					detail.setTeacherId(teaList.get(teaIndex).getKey());
				} else {
					++teaIndex;
				}
			} while (detail.getTeacherId() == 0);

			do {
				if (roomIndex == roomList.size()) {
					session.setAttribute("msg", "考试教室数量不足，无法分配,创建失败!");
					return "admin_exam";
				}
				// 检查该教室是否有空
				boolean free = true;
				for (ExamDetail detail2 : examDetails) {
					if (detail2.getRoomId() == roomList.get(roomIndex).getKey()) {
						for (Exam exam2 : exams) {
							if (exam2.getExamId() == detail2.getExamId()
									&& exam2.getExamDate().compareTo(examDate) == 0
									&& exam2.getExamTime() == examTime) {
								//如果该时段教室被占用，则检测下一个
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
			if (examJDBCTemplate.add(exam, addDetails) > 0) {
				session.setAttribute("msg", "创建成功!");
				init(session);
			} else {
				session.setAttribute("msg", "创建失败!");
			}
		} else {
			session.setAttribute("msg", "考试教室或监考教师数量不足，无法分配,创建失败!");
		}

		return "admin_exam";
	}

	@RequestMapping("/deleteExam")
	public String adminDeleteExam(HttpServletRequest request,
			HttpServletResponse response) throws UnsupportedEncodingException {

		HttpSession session = request.getSession(true);
		request.setCharacterEncoding("UTF-8");

		String lessonName = request.getParameter("lessonName");

		int timeCmp = new Integer(request.getParameter("timeCmp")).intValue();

		List<Lesson> lessons = (List<Lesson>) session.getAttribute("lessons");
		List<Exam> exams = (List<Exam>) session.getAttribute("exams");

		int lessonId = 0, examId = 0;

		if (timeCmp <= 0) {
			session.setAttribute("msg", "该考试已进行，无法删除！");
		} else {
			for (Lesson lesson : lessons) {
				if (lesson.getLessonName().equals(lessonName)) {
					lessonId = lesson.getLessonId();
					break;
				}
			}
			for (Exam exam : exams) {
				if (exam.getLessonId() == lessonId) {
					examId = exam.getExamId();
				}
			}

			if (examJDBCTemplate.delete(examId) <= 0) {
				session.setAttribute("msg", "删除失败！");
			} else {
				session.setAttribute("msg", "删除成功！");
				init(session);
			}
		}

		return "admin_exam";
	}

	@RequestMapping("/editExam")
	public String adminEditExam(HttpServletRequest request,
			HttpServletResponse response) throws UnsupportedEncodingException,
			ParseException {

		HttpSession session = request.getSession(true);
		request.setCharacterEncoding("UTF-8");

		String examName = request.getParameter("examName");
		String dateStr = request.getParameter("editExamDate");
		String editExamTime = request.getParameter("editExamTime");
		String editExamRoom = request.getParameter("editExamRoom");
		String editExamTeacher = request.getParameter("editExamTeacher");
		String editExamClass = request.getParameter("editExamClass");

		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date date = format.parse(dateStr);
		Date examDate = new Date(date.getTime());

		List<Lesson> lessons = (List<Lesson>) session.getAttribute("lessons");
		List<Teacher> teachers = (List<Teacher>) session
				.getAttribute("teachers");
		List<Exam> exams = (List<Exam>) session.getAttribute("exams");
		List<ExamDetail> examDetails = (List<ExamDetail>) session
				.getAttribute("examDetails");
		List<Room> rooms = (List<Room>) session.getAttribute("rooms");
		List<Clazz> clazzs = (List<Clazz>) session.getAttribute("clazzs");

		int lessonId = 0, teacherId = 0, examId = 0, examTime = 0, roomId = 0;
		List<Clazz> examClazzs = new ArrayList<Clazz>();

		for (Clazz clazz : clazzs) {
			if (editExamClass.contains(clazz.getClassName())) {
				examClazzs.add(clazz);
			}
		}

		for (Lesson lesson : lessons) {
			if (lesson.getLessonName().equals(examName)) {
				lessonId = lesson.getLessonId();
				break;
			}
		}
		for (Room room : rooms) {
			if (room.getRoomName().equals(editExamRoom)) {
				roomId = room.getRoomId();
				break;
			}
		}
		for (Teacher teacher : teachers) {
			if (teacher.getTeacherName().equals(editExamTeacher)) {
				teacherId = teacher.getTeacherId();
				break;
			}
		}
		System.out.println(editExamTeacher+teacherId);
		if (editExamTime.equals("第1-2节课")) {
			examTime = 12;
		} else if (editExamTime.equals("第3-4节课")) {
			examTime = 34;
		} else if (editExamTime.equals("第5-6节课")) {
			examTime = 56;
		} else if ((editExamTime.equals("第7-8节课"))) {
			examTime = 78;
		}

		// 获取考试id并检查地点,监考教师,班级的其他课程考试是否冲突
		boolean same = false;
		for (Exam exam : exams) {
			if (same) {
				break;
			}
			if (exam.getLessonId() == lessonId) {
				examId = exam.getExamId();
			} else {
				if (exam.getExamDate().compareTo(examDate) == 0
						&& exam.getExamTime() == examTime) {
					for (ExamDetail detail : examDetails) {
						if (detail.getExamId() == exam.getExamId()) {
							if (detail.getRoomId() == roomId) {
								same = true;
								session.setAttribute("msg", "考试地点冲突，修改失败！");
							} else if (detail.getTeacherId() == teacherId) {
								same = true;
								session.setAttribute("msg", "监考教师冲突，修改失败！");
							}
							for(Clazz clazz : examClazzs){
								if(clazz.getClassId()==detail.getClassId()){
									same = true;
									session.setAttribute("msg", "部分班级考试冲突，修改失败！");
									break;
								}
							}
						}
						if (same) {
							break;
						}
					}
				}
			}
		}
		if (!same) {
			if (examDate.compareTo(new java.util.Date()) > 0) {
				if (examJDBCTemplate.update(examId, examDate, examTime,
						teacherId, roomId,examClazzs) <= 0) {
					session.setAttribute("msg", "修改失败！");
				} else {
					session.setAttribute("msg", "修改成功！");
					init(session);
				}
			} else {
				session.setAttribute("msg", "日期有误,修改失败!");
			}
		}
		return "admin_exam";
	}

	@RequestMapping("/setScore")
	public String adminSetScore(HttpServletRequest request,
			HttpServletResponse response) throws UnsupportedEncodingException {

		HttpSession session = request.getSession(true);
		request.setCharacterEncoding("UTF-8");

		String examName = request.getParameter("examName");
		int stuId = new Integer(request.getParameter("stuId")).intValue();
		int score = new Integer(request.getParameter("score")).intValue();

		List<Lesson> lessons = (List<Lesson>) session.getAttribute("lessons");

		int lessonId = 0;

		for (Lesson lesson : lessons) {
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

		return "admin_score";
	}

	@RequestMapping("/createLesson")
	public String adminCreateLesson(HttpServletRequest request,
			HttpServletResponse response) throws UnsupportedEncodingException {

		HttpSession session = request.getSession(true);
		request.setCharacterEncoding("UTF-8");

		String lessonName = request.getParameter("lessonName");
		String teacherName = request.getParameter("teacherName");
		// System.out.println(lessonName+teacherName);
		List<Lesson> lessons = (List<Lesson>) session.getAttribute("lessons");
		List<Teacher> teachers = (List<Teacher>) session
				.getAttribute("teachers");

		boolean exist = false;
		for (Lesson lesson : lessons) {
			if (lesson.getLessonName().equals(lessonName)) {
				exist = true;
				break;
			}
		}
		if (exist) {
			session.setAttribute("msg", "该课程已存在！");
		} else {
			int teacherId = 0;
			for (Teacher teacher : teachers) {
				if (teacher.getTeacherName().equals(teacherName)) {
					teacherId = teacher.getTeacherId();
				}
			}
			if (teacherId == 0) {
				session.setAttribute("msg", "不存在该教师！");
			} else if (lessonJDBCTemplate.add(lessonName, teacherId) <= 0) {
				session.setAttribute("msg", "添加失败！");
			} else {
				lessons = lessonJDBCTemplate.listLesson();
				session.setAttribute("lessons", lessons);
				session.setAttribute("msg", "添加成功！");
			}
		}

		return "admin_lesson";
	}

	@RequestMapping("/updateLesson")
	public String adminUpdateLesson(HttpServletRequest request,
			HttpServletResponse response) throws UnsupportedEncodingException {

		HttpSession session = request.getSession(true);
		request.setCharacterEncoding("UTF-8");

		String lessonName = request.getParameter("lessonName");
		String teacherName = request.getParameter("teacherName");
		// System.out.println(lessonName+teacherName);
		List<Lesson> lessons = (List<Lesson>) session.getAttribute("lessons");
		List<Teacher> teachers = (List<Teacher>) session
				.getAttribute("teachers");

		int teacherId = 0, lessonId = 0;
		for (Teacher teacher : teachers) {
			if (teacher.getTeacherName().equals(teacherName)) {
				teacherId = teacher.getTeacherId();
				break;
			}
		}
		if (teacherId == 0) {
			session.setAttribute("msg", "不存在该教师！");
		} else if (lessonJDBCTemplate.update(lessonName, teacherId) <= 0) {
			session.setAttribute("msg", "修改失败！");
		} else {
			lessons = lessonJDBCTemplate.listLesson();
			session.setAttribute("lessons", lessons);
			session.setAttribute("msg", "修改成功！");
		}

		return "admin_lesson";
	}

	@RequestMapping("/deleteLesson")
	public String deleteLesson(HttpServletRequest request,
			HttpServletResponse response) throws UnsupportedEncodingException {

		HttpSession session = request.getSession(true);
		request.setCharacterEncoding("UTF-8");

		String lessonName = request.getParameter("lessonName");
		int timeCmp = 1;

		List<Exam> exams = examJDBCTemplate.listExams();
		List<Lesson> lessons = (List<Lesson>) session.getAttribute("lessons");

		for (Lesson lesson : lessons) {
			if (lesson.getLessonName().equals(lessonName)) {
				for (Exam exam : exams) {
					if (exam.getLessonId() == lesson.getLessonId()) {
						timeCmp = exam.getExamDate().compareTo(
								new java.util.Date());
					}
				}
			}
		}

		if (timeCmp <= 0) {
			session.setAttribute("msg", "该课程已考试，无法删除！");
		} else {
			if (lessonJDBCTemplate.delete(lessonName) > 0) {
				lessons = lessonJDBCTemplate.listLesson();
				session.setAttribute("lessons", lessons);
				session.setAttribute("msg", "删除课程成功！");
			} else {
				session.setAttribute("msg", "删除课程失败！");
			}
		}

		return "admin_lesson";
	}

	@RequestMapping("/deleteStudent")
	public String deleteStudent(HttpServletRequest request,
			HttpServletResponse response) throws UnsupportedEncodingException {

		HttpSession session = request.getSession(true);
		request.setCharacterEncoding("UTF-8");

		int studentId = new Integer(request.getParameter("studentId"))
				.intValue();

		List<Score> scoreViews = examJDBCTemplate.listScore();

		boolean del = true;

		// 如果没有考试，则可以删除学生
		for (Score scoreView : scoreViews) {
			if (scoreView.getStuId() == studentId) {
				del = false;
				session.setAttribute("msg", "该学生已进行考试，无法删除！");
				break;
			}
		}
		if (del) {
			if (studentJDBCTemplate.delete(studentId) > 0) {
				List<Student> students = studentJDBCTemplate.listStudents();
				session.setAttribute("students", students);
				session.setAttribute("msg", "删除学生成功！");
			} else {
				session.setAttribute("msg", "删除学生失败！");
			}
		}

		return "admin_student";
	}

	@RequestMapping("/updateStudent")
	public String adminUpdateStudent(HttpServletRequest request,
			HttpServletResponse response) throws UnsupportedEncodingException {

		HttpSession session = request.getSession(true);
		request.setCharacterEncoding("UTF-8");

		int stuId = new Integer(request.getParameter("stuId")).intValue();
		String stuName = request.getParameter("stuName");
		String stuIC = request.getParameter("stuIC");
		String stuClass = request.getParameter("stuClass");

		List<Student> students = (List<Student>) session
				.getAttribute("students");
		List<Clazz> clazzs = (List<Clazz>) session.getAttribute("clazzs");

		int classId = 0;
		for (Clazz clazz : clazzs) {
			if (clazz.getClassName().equals(stuClass)) {
				classId = clazz.getClassId();
				break;
			}
		}
		if (classId == 0) {
			session.setAttribute("msg", "不存在该班级，修改失败！");
		} else {
			if (studentJDBCTemplate.update(new Student(stuId, stuName, null,
					stuIC, classId)) <= 0) {
				session.setAttribute("msg", "修改失败！");
			} else {
				students = studentJDBCTemplate.listStudents();
				session.setAttribute("students", students);
				session.setAttribute("msg", "修改成功！");
			}
		}
		return "admin_student";
	}

	@RequestMapping("/addStudent")
	public String adminAddStudent(HttpServletRequest request,
			HttpServletResponse response) throws UnsupportedEncodingException {

		HttpSession session = request.getSession(true);
		request.setCharacterEncoding("UTF-8");

		String stuName = request.getParameter("stuName");
		String stuIC = request.getParameter("stuIC");
		String stuClass = request.getParameter("stuClass");

		List<Student> students = (List<Student>) session
				.getAttribute("students");
		List<Clazz> clazzs = (List<Clazz>) session.getAttribute("clazzs");

		boolean ICexist = false;
		for (Student student : students) {
			if (student.getStuIC().equals(stuIC)) {
				ICexist = true;
				break;
			}
		}
		int classId = 0;
		for (Clazz clazz : clazzs) {
			if (clazz.getClassName().equals(stuClass)) {
				classId = clazz.getClassId();
				break;
			}
		}
		if (ICexist) {
			session.setAttribute("msg", "身份证已存在，添加失败！");
		} else if (classId == 0) {
			session.setAttribute("msg", "不存在该班级，添加失败！");
		} else {
			if (studentJDBCTemplate.add(stuName, stuIC, classId) <= 0) {
				session.setAttribute("msg", "添加失败！");
			} else {
				students = studentJDBCTemplate.listStudents();
				Student stu = students.get(students.size() - 1);
				if (examJDBCTemplate.addScore(stu.getStuId(), stu.getClassId())) {
					session.setAttribute("students", students);
					session.setAttribute("msg", "添加成功！密码为身份证后六位");
				}
			}
		}

		return "admin_student";
	}

	@RequestMapping("/deleteTeacher")
	public String deleteTeacher(HttpServletRequest request,
			HttpServletResponse response) throws UnsupportedEncodingException {

		HttpSession session = request.getSession(true);
		request.setCharacterEncoding("UTF-8");

		int teacherId = new Integer(request.getParameter("teacherId"))
				.intValue();

		List<Lesson> lessons = (List<Lesson>) session.getAttribute("lessons");
		boolean del = true;

		// 如果没有课程，则可以删除教师
		for (Lesson lesson : lessons) {
			if (lesson.getTeacherId() == teacherId) {
				del = false;
				session.setAttribute("msg", "该教师正在授课，无法删除！");
				break;
			}
		}
		if (del) {
			if (teacherJDBCTemplate.delete(teacherId) > 0) {
				List<Teacher> teachers = teacherJDBCTemplate.listTeachers();
				session.setAttribute("teachers", teachers);
				session.setAttribute("msg", "删除教师成功！");
			} else {
				session.setAttribute("msg", "删除教师失败！");
			}
		}

		return "admin_teacher";
	}

	@RequestMapping("/updateTeacher")
	public String adminUpdateTeacher(HttpServletRequest request,
			HttpServletResponse response) throws UnsupportedEncodingException {

		HttpSession session = request.getSession(true);
		request.setCharacterEncoding("UTF-8");

		int teacherId = new Integer(request.getParameter("updateTeacherId"))
				.intValue();
		String teacherName = request.getParameter("updateTeacherName");
		String teacherIC = request.getParameter("updateTeacherIC");

		List<Teacher> teachers = (List<Teacher>) session
				.getAttribute("teachers");

		if (teacherJDBCTemplate.update(teacherId, teacherName, teacherIC) <= 0) {
			session.setAttribute("msg", "修改失败！");
		} else {
			teachers = teacherJDBCTemplate.listTeachers();
			session.setAttribute("teachers", teachers);
			session.setAttribute("msg", "修改成功！");
		}

		return "admin_teacher";
	}

	@RequestMapping("/addTeacher")
	public String adminAddTeacher(HttpServletRequest request,
			HttpServletResponse response) throws UnsupportedEncodingException {

		HttpSession session = request.getSession(true);
		request.setCharacterEncoding("UTF-8");

		String teacherName = request.getParameter("addTeacherName");
		String teacherIC = request.getParameter("addTeacherIC");

		List<Teacher> teachers = (List<Teacher>) session
				.getAttribute("teachers");

		boolean ICexist = false;
		for (Teacher teacher : teachers) {
			if (teacher.getTeacherIC().equals(teacherIC)) {
				ICexist = true;
				break;
			}
		}
		if (ICexist) {
			session.setAttribute("msg", "身份证已存在，添加失败！");
		} else {

			if (teacherJDBCTemplate.add(teacherName, teacherIC) <= 0) {
				session.setAttribute("msg", "添加失败！");
			} else {
				teachers = teacherJDBCTemplate.listTeachers();
				session.setAttribute("teachers", teachers);
				session.setAttribute("msg", "添加成功！");
			}
		}

		return "admin_teacher";
	}

}
