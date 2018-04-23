package com.minjxu.exam.entity;

import java.sql.Timestamp;

public class StuExamView {
	
	public StuExamView() {
		super();
	}
	
	public StuExamView(String lessonName, Timestamp beginTime, Timestamp endTime,
			String teacherName, int grade) {
		super();
		this.lessonName = lessonName;
		this.beginTime = beginTime;
		this.endTime = endTime;
		this.teacherName = teacherName;
		this.grade = grade;
	}

	String lessonName;
	Timestamp beginTime;
	Timestamp endTime;
	String teacherName;
	int grade;
	public String getLessonName() {
		return lessonName;
	}

	public void setLessonName(String lessonName) {
		this.lessonName = lessonName;
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

	public String getTeacherName() {
		return teacherName;
	}

	public void setTeacherName(String teacherName) {
		this.teacherName = teacherName;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	@Override
	public String toString() {
		return "StuExamView [lessonName=" + lessonName + ", beginTime="
				+ beginTime + ", endTime=" + endTime + ", teacherName="
				+ teacherName + ", grade=" + grade + "]";
	}
	
}
