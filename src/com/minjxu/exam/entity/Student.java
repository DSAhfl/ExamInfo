package com.minjxu.exam.entity;

public class Student {
	private int stuId;
	private String stuName;
	private String stuPwd;
	private String stuIC;
	private int classId;

	public Student() {
		super();
	}

	public Student(int stuId, String stuName, String stuPwd, String stuIC,
			int classId) {
		this.stuId = stuId;
		this.stuName = stuName;
		this.stuPwd = stuPwd;
		this.stuIC = stuIC;
		this.classId = classId;
	}

	public int getStuId() {
		return stuId;
	}

	public void setStuId(int stuId) {
		this.stuId = stuId;
	}

	public String getStuName() {
		return stuName;
	}

	public void setStuName(String stuName) {
		this.stuName = stuName;
	}

	public String getStuPwd() {
		return stuPwd;
	}

	public void setStuPwd(String stuPwd) {
		this.stuPwd = stuPwd;
	}

	public String getStuIC() {
		return stuIC;
	}

	public void setStuIC(String stuIC) {
		this.stuIC = stuIC;
	}

	public int getClassId() {
		return classId;
	}

	public void setClassId(int classId) {
		this.classId = classId;
	}

	@Override
	public String toString() {
		return "Student [stuId=" + stuId + ", stuName=" + stuName + ", stuPwd="
				+ stuPwd + ", stuIC=" + stuIC + ", classId=" + classId + "]";
	}

}
