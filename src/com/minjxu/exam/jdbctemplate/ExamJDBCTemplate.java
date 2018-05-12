package com.minjxu.exam.jdbctemplate;

import java.util.Date;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;

import com.minjxu.exam.dao.ExamDao;
import com.minjxu.exam.entity.Clazz;
import com.minjxu.exam.entity.Exam;
import com.minjxu.exam.entity.ExamDetail;
import com.minjxu.exam.entity.Lesson;
import com.minjxu.exam.entity.Room;
import com.minjxu.exam.entity.Score;
import com.minjxu.exam.mapper.ExamDetailMapper;
import com.minjxu.exam.mapper.ExamMapper;
import com.minjxu.exam.mapper.LessonMapper;
import com.minjxu.exam.mapper.RoomMapper;
import com.minjxu.exam.mapper.ScoreMapper;

public class ExamJDBCTemplate implements ExamDao {
	private JdbcTemplate jdbcTemplateObject;

	@Override
	public void setDataSource(DataSource ds) {
		this.jdbcTemplateObject = new JdbcTemplate(ds);

	}

	@Override
	public List<Exam> listExams() {
		String SQL = "select * from exam order by examId DESC";
		List<Exam> exams = jdbcTemplateObject.query(SQL, new ExamMapper());
		return exams;
	}

	@Override
	public List<Exam> listExamByLesson(List<Lesson> teacherLessons) {
		String SQL = "select * from exam WHERE lessonId = ";
		boolean or = false;

		for (Lesson lesson : teacherLessons) {
			if (or) {
				SQL = SQL + " OR lessonId = ";
			}
			SQL = SQL + lesson.getLessonId();
			or = true;
		}
		SQL = SQL + " ORDER BY examId DESC";
		List<Exam> exams = jdbcTemplateObject.query(SQL, new ExamMapper());
		// System.out.println(SQL);
		// System.out.println(exams);
		return exams;
	}

	public int update(int examId, Date examDate, int examTime, int teacherId,
			int roomId, List<Clazz> examClazzs) {
		int res = 0;
		String SQL = "UPDATE exam SET examDate = ? , examTime = ? WHERE examId = ?";
		res = jdbcTemplateObject.update(SQL, examDate, examTime, examId);
		if (res > 0) {
			for(Clazz clazz : examClazzs){
				SQL = "UPDATE exam_detail SET roomId=? ,teacherId=? WHERE examId=? AND classId=?";
				jdbcTemplateObject.update(SQL, roomId,  teacherId, examId, clazz.getClassId());
			}
		}

		return res;
	}

	public int add(Exam exam, List<ExamDetail> addDetails) {
		int res = 0;
		String SQL = "INSERT exam VALUES(?,?,?,?)";
		res = jdbcTemplateObject.update(SQL, exam.getExamId(),
				exam.getLessonId(), exam.getExamDate(), exam.getExamTime());
		if (res > 0) {
			for (ExamDetail detail : addDetails) {
				SQL = "INSERT exam_detail VALUES(?,?,?,?,?)";
				jdbcTemplateObject.update(SQL, null, detail.getExamId(),
						detail.getClassId(), detail.getTeacherId(),
						detail.getRoomId());
			}
		}
		return res;
	}

	public int delete(int examId) {
		String SQL = "DELETE FROM exam_detail WHERE examId = ?";
		int res = jdbcTemplateObject.update(SQL, examId);
		if (res > 0) {
			SQL = "DELETE FROM exam WHERE examId = ?";
			res = jdbcTemplateObject.update(SQL, examId);

		}
		return res;
	}

	public int setScore(int lessonId, int stuId, int score) {
		String SQL = "UPDATE score SET score=? WHERE stuId = ? AND lessonId = ?";
		int res = jdbcTemplateObject.update(SQL, score, stuId, lessonId);
		return res;
	}

	public List<Score> listScore() {
		List<Score> scoreViews = null;
		String SQL = "SELECT * FROM score";
		scoreViews = jdbcTemplateObject.query(SQL, new ScoreMapper());
		return scoreViews;
	}

	public List<ExamDetail> listExamDetail() {
		List<ExamDetail> examDetails = null;
		String SQL = "SELECT * FROM exam_detail";
		examDetails = jdbcTemplateObject.query(SQL, new ExamDetailMapper());
		return examDetails;
	}

	@Override
	public List<Room> listRoom() {
		List<Room> rooms = null;
		String SQL = "SELECT * FROM room";
		rooms = jdbcTemplateObject.query(SQL, new RoomMapper());
		return rooms;
	}

	public boolean addScore(int stuId, int classId) {
		boolean res = true;
		String SQL = "SELECT lesson.lessonId, lesson.lessonName, lesson.teacherId FROM lesson, class, choose WHERE lesson.lessonId = choose.lessonId AND"
				+ " class.classId = choose.classId AND class.classId="
				+ classId;
		List<Lesson> lessons = null;
		lessons = jdbcTemplateObject.query(SQL, new LessonMapper());
		for (Lesson lesson : lessons) {
			SQL = "INSERT score VALUES(?,?,?,?)";
			if (jdbcTemplateObject.update(SQL, null, stuId,
					lesson.getLessonId(), -1) <= 0) {
				res = false;
			}
		}
		return res;

	}

}
