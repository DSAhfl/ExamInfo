package com.minjxu.exam.entity;

public class Teacher {
	private int teacher;
	private String teacherName;
	private String teacherPwd;
	private String teacherIC;

	public Teacher() {
		super();
	}

	public Teacher(int tracherId, String teacherName, String teacherPwd,
			String teacherIC) {
		super();
		this.teacher = tracherId;
		this.teacherName = teacherName;
		this.teacherPwd = teacherPwd;
		this.teacherIC = teacherIC;
	}

	public int getTeacherId() {
		return teacher;
	}

	public void setTeacherId(int tracherId) {
		this.teacher = tracherId;
	}

	public String getTeacherName() {
		return teacherName;
	}

	public void setTeacherName(String teacherName) {
		this.teacherName = teacherName;
	}

	public String getTeacherPwd() {
		return teacherPwd;
	}

	public void setTeacherPwd(String teacherPwd) {
		this.teacherPwd = teacherPwd;
	}

	public String getTeacherIC() {
		return teacherIC;
	}

	public void setTeacherIC(String teacherIC) {
		this.teacherIC = teacherIC;
	}

	@Override
	public String toString() {
		return "Teacher [tracherId=" + teacher + ", teacherName="
				+ teacherName + ", teacherPwd=" + teacherPwd + ", teacherIC="
				+ teacherIC + "]";
	}

}
