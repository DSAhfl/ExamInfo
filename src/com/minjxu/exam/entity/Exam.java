package com.minjxu.exam.entity;

import java.sql.Date;
import java.sql.Timestamp;

public class Exam {
	private int examId;
	private int lessonId;
	private Date examDate;
	private int examTime;
	public Exam() {
		super();
	}
	public int getExamId() {
		return examId;
	}
	public void setExamId(int examId) {
		this.examId = examId;
	}
	public int getLessonId() {
		return lessonId;
	}
	public void setLessonId(int lessonId) {
		this.lessonId = lessonId;
	}
	public Date getExamDate() {
		return examDate;
	}
	public void setExamDate(Date examDate) {
		this.examDate = examDate;
	}
	public int getExamTime() {
		return examTime;
	}
	public void setExamTime(int examTime) {
		this.examTime = examTime;
	}
	public Exam(int examId, int lessonId, Date examDate, int examTime) {
		super();
		this.examId = examId;
		this.lessonId = lessonId;
		this.examDate = examDate;
		this.examTime = examTime;
	}
	@Override
	public String toString() {
		return "Exam [examId=" + examId + ", lessonId=" + lessonId
				+ ", examDate=" + examDate + ", examTime=" + examTime + "]";
	}
	
	
	
}
