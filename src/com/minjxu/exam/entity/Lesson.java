package com.minjxu.exam.entity;

public class Lesson {
	private int lessonId;
	private String lessonName;
	private int teacherId;

	public Lesson() {
		super();
	}

	public Lesson(int lessonId, String lessonName, int teacherId) {
		super();
		this.lessonId = lessonId;
		this.lessonName = lessonName;
		this.teacherId = teacherId;
	}

	@Override
	public String toString() {
		return "Lesson [lessonId=" + lessonId + ", lessonName=" + lessonName
				+ ", teacherId=" + teacherId + "]";
	}

	public int getLessonId() {
		return lessonId;
	}

	public void setLessonId(int lessonId) {
		this.lessonId = lessonId;
	}

	public String getLessonName() {
		return lessonName;
	}

	public void setLessonName(String lessonName) {
		this.lessonName = lessonName;
	}

	public int getTeacherId() {
		return teacherId;
	}

	public void setTeacherId(int teacherId) {
		this.teacherId = teacherId;
	}

}
