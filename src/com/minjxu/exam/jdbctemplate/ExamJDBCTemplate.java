package com.minjxu.exam.jdbctemplate;

import java.util.Date;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;

import com.minjxu.exam.dao.ExamDao;
import com.minjxu.exam.entity.Exam;
import com.minjxu.exam.entity.Lesson;
import com.minjxu.exam.mapper.ExamMapper;

public class ExamJDBCTemplate implements ExamDao {
	private JdbcTemplate jdbcTemplateObject;

	@Override
	public void setDataSource(DataSource ds) {
		this.jdbcTemplateObject = new JdbcTemplate(ds);

	}

	@Override
	public List<Exam> listExams() {
		String SQL = "select * from exam";
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

	public int update(Exam exam) {
		String SQL = "UPDATE exam SET beginTime = ? , endTime = ? WHERE lessonId = ?";

		int res = jdbcTemplateObject.update(SQL, new Date(exam.getBeginTime()
				.getTime()), new Date(exam.getEndTime().getTime()), exam
				.getLessonId());

		return res;
	}

}
