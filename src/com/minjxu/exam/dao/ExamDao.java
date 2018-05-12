package com.minjxu.exam.dao;

import java.util.Date;
import java.util.List;

import javax.sql.DataSource;

import com.minjxu.exam.entity.Clazz;
import com.minjxu.exam.entity.Exam;
import com.minjxu.exam.entity.ExamDetail;
import com.minjxu.exam.entity.Lesson;
import com.minjxu.exam.entity.Room;
import com.minjxu.exam.entity.Score;

public interface ExamDao {
	public void setDataSource(DataSource ds);

	public List<Exam> listExams();

	public List<Exam> listExamByLesson(List<Lesson> teacherLessons);

	public int add(Exam exam,List<ExamDetail> addDetails);

	public int delete(int lessonId);

	public int setScore(int lessonId, int stuId, int score);

	public List<Score> listScore();

	public List<ExamDetail> listExamDetail();

	public List<Room> listRoom();

	public boolean addScore(int stuId, int classId);

	public int update(int examId, Date examDate, int examTime, int teacherId,
			int roomId, List<Clazz> examClazzs);
}
