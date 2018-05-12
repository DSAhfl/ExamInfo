package com.minjxu.exam.entity;

public class Choose {
	private int chooseId;
	private int lessonId;
	private int classId;

	public Choose(int chooseId, int lessonId, int classId) {
		super();
		this.chooseId = chooseId;
		this.lessonId = lessonId;
		this.classId = classId;
	}

	public int getChooseId() {
		return chooseId;
	}

	public void setChooseId(int chooseId) {
		this.chooseId = chooseId;
	}

	public int getLessonId() {
		return lessonId;
	}

	public void setLessonId(int lessonId) {
		this.lessonId = lessonId;
	}

	public int getClassId() {
		return classId;
	}

	public void setClassId(int classId) {
		this.classId = classId;
	}

	@Override
	public String toString() {
		return "Choose [chooseId=" + chooseId + ", lessonId=" + lessonId
				+ ", classId=" + classId + "]";
	}

}
