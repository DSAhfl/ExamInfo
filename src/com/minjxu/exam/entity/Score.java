package com.minjxu.exam.entity;

public class Score {
	private int scoreId;
	private int stuId;
	private int lessonId;
	private int score;
	public Score() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Score(int scoreId, int stuId, int lessonId, int score) {
		super();
		this.scoreId = scoreId;
		this.stuId = stuId;
		this.lessonId = lessonId;
		this.score = score;
	}
	public int getScoreId() {
		return scoreId;
	}
	public void setScoreId(int scoreId) {
		this.scoreId = scoreId;
	}
	public int getStuId() {
		return stuId;
	}
	public void setStuId(int stuId) {
		this.stuId = stuId;
	}
	public int getLessonId() {
		return lessonId;
	}
	public void setLessonId(int lessonId) {
		this.lessonId = lessonId;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	@Override
	public String toString() {
		return "ScoreView [scoreId=" + scoreId + ", stuId=" + stuId
				+ ", lessonId=" + lessonId + ", score=" + score + "]";
	}
	
	

}
