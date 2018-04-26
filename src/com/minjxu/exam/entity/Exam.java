package com.minjxu.exam.entity;

import java.sql.Timestamp;

public class Exam {
	private int examId;
	private int lessonId;
	private Timestamp beginTime;
	private Timestamp endTime;
	public Exam() {
		super();
	}
	public Exam(int examId, int lessonId, Timestamp beginTime, Timestamp endTime) {
		super();
		this.examId = examId;
		this.lessonId = lessonId;
		this.beginTime = beginTime;
		this.endTime = endTime;
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
	public Timestamp getBeginTime() {
		return beginTime;
	}
	public void setBeginTime(Timestamp beginTime) {
		this.beginTime = beginTime;
	}
	public Timestamp getEndTime() {
		return endTime;
	}
	public void setEndTime(Timestamp endTime) {
		this.endTime = endTime;
	}
	@Override
	public String toString() {
		return "Exam [examId=" + examId + ", lessonId=" + lessonId
				+ ", beginTime=" + beginTime + ", endTime=" + endTime + "]";
	}
	
}
