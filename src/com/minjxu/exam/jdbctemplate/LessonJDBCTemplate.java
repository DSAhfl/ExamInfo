package com.minjxu.exam.jdbctemplate;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;

import com.minjxu.exam.dao.LessonDao;
import com.minjxu.exam.entity.Choose;
import com.minjxu.exam.entity.Lesson;
import com.minjxu.exam.entity.Student;
import com.minjxu.exam.entity.Teacher;
import com.minjxu.exam.mapper.ChooseMapper;
import com.minjxu.exam.mapper.LessonMapper;

public class LessonJDBCTemplate implements LessonDao {
	private JdbcTemplate jdbcTemplateObject;

	@Override
	public void setDataSource(DataSource ds) {
		this.jdbcTemplateObject = new JdbcTemplate(ds);

	}

	@Override
	public List<Lesson> listLesson() {
		String SQL = "SELECT * FROM lesson";
		List<Lesson> lessons = jdbcTemplateObject
				.query(SQL, new LessonMapper());
		return lessons;
	}

	public List<Lesson> listLessonByTeacher(Teacher teacher) {
		String SQL = "SELECT * FROM lesson WHERE teacherId = "
				+ teacher.getTeacherId();
		List<Lesson> lessons = jdbcTemplateObject
				.query(SQL, new LessonMapper());
		return lessons;
	}

	public int add(String lessonName, int teacherId) {
		int ret = 0;
		String SQL = "INSERT lesson VALUES(?,?,?)";
		ret = jdbcTemplateObject.update(SQL, null, lessonName, teacherId);
		return ret;
	}

	public int delete(String lessonName) {
		String SQL = "DELETE FROM lesson WHERE lessonName = ?";
		int res = jdbcTemplateObject.update(SQL, lessonName);
		return res;
	}

	public int update(String lessonName, int teacherId) {
		String SQL = "UPDATE lesson SET teacherId = ? WHERE lessonName = ?";
		int res = jdbcTemplateObject.update(SQL, teacherId, lessonName);
		return res;
	}

	public List<Lesson> listLessonByStu(Student student) {
		List<Lesson> stuLessons = null;
		String SQL = "SELECT lesson.lessonId, lessonName,teacher.teacherId FROM student,class,choose,lesson,teacher"
				+" WHERE student.classId=class.classId AND class.classId=choose.classId "
				+" AND stuId="+student.getStuId()+" AND lesson.lessonId=choose.lessonId AND teacher.teacherId=lesson.teacherId";
		stuLessons = jdbcTemplateObject.query(SQL, new LessonMapper());
		return stuLessons;
	}

	@Override
	public List<Choose> listChoose() {
		List<Choose> chooses = null;
		String SQL = "SELECT * FROM choose";
		chooses = jdbcTemplateObject.query(SQL, new ChooseMapper());
		return chooses;
	}
}
