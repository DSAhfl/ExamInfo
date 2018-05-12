package com.minjxu.exam.entity;


public class ExamDetail {
	
	private int detailId;
	private int examId;
	private int classId;
	private int teacherId;
	private int roomId;
	public ExamDetail() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ExamDetail(int detailId, int examId, int classId, int teacherId,
			int roomId) {
		super();
		this.detailId = detailId;
		this.examId = examId;
		this.classId = classId;
		this.teacherId = teacherId;
		this.roomId = roomId;
	}
	public int getDetailId() {
		return detailId;
	}
	public void setDetailId(int detailId) {
		this.detailId = detailId;
	}
	public int getExamId() {
		return examId;
	}
	public void setExamId(int examId) {
		this.examId = examId;
	}
	public int getClassId() {
		return classId;
	}
	public void setClassId(int classId) {
		this.classId = classId;
	}
	public int getTeacherId() {
		return teacherId;
	}
	public void setTeacherId(int teacherId) {
		this.teacherId = teacherId;
	}
	public int getRoomId() {
		return roomId;
	}
	public void setRoomId(int roomId) {
		this.roomId = roomId;
	}
	@Override
	public String toString() {
		return "ExamDetail [detailId=" + detailId + ", examId=" + examId
				+ ", classId=" + classId + ", teacherId=" + teacherId
				+ ", roomId=" + roomId + "]";
	}
	
	
}
