package com.minjxu.exam.entity;

import java.sql.Date;

public class StuExamView {
	private String lessonName;
	private String lessonTeacher;
	private Date examDate;
	private int examTime;
	private String roomName;
	private String examTeacher;
	private int score;
	private String clazzName;

	public StuExamView() {
		super();
		// TODO Auto-generated constructor stub
	}

	

	public StuExamView(String lessonName, String lessonTeacher, Date examDate,
			int examTime, String roomName, String examTeacher, int score,
			String clazzName) {
		super();
		this.lessonName = lessonName;
		this.lessonTeacher = lessonTeacher;
		this.examDate = examDate;
		this.examTime = examTime;
		this.roomName = roomName;
		this.examTeacher = examTeacher;
		this.score = score;
		this.clazzName = clazzName;
	}



	public String getLessonName() {
		return lessonName;
	}

	public void setLessonName(String lessonName) {
		this.lessonName = lessonName;
	}

	public String getLessonTeacher() {
		return lessonTeacher;
	}

	public void setLessonTeacher(String lessonTeacher) {
		this.lessonTeacher = lessonTeacher;
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

	public String getRoomName() {
		return roomName;
	}

	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}

	public String getExamTeacher() {
		return examTeacher;
	}

	public void setExamTeacher(String examTeacher) {
		this.examTeacher = examTeacher;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}



	public String getClazzName() {
		return clazzName;
	}



	public void setClazzName(String clazzName) {
		this.clazzName = clazzName;
	}



	@Override
	public String toString() {
		return "StuExamView [lessonName=" + lessonName + ", lessonTeacher="
				+ lessonTeacher + ", examDate=" + examDate + ", examTime="
				+ examTime + ", roomName=" + roomName + ", examTeacher="
				+ examTeacher + ", score=" + score + ", clazzName=" + clazzName
				+ "]";
	}



}
