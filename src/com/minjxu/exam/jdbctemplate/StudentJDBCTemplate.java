package com.minjxu.exam.jdbctemplate;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;

import com.minjxu.exam.dao.StudentDao;
import com.minjxu.exam.entity.StuExamView;
import com.minjxu.exam.entity.Student;
import com.minjxu.exam.mapper.StuExamMapper;
import com.minjxu.exam.mapper.StudentMapper;

public class StudentJDBCTemplate implements StudentDao {
	private JdbcTemplate jdbcTemplateObject;

	@Override
	public void setDataSource(DataSource ds) {
		this.jdbcTemplateObject = new JdbcTemplate(ds);

	}

	@Override
	public List<Student> listStudents() {
		String SQL = "SELECT * FROM student";
		List<Student> students = jdbcTemplateObject.query(SQL,
				new StudentMapper());
		return students;
	}

	@Override
	public List<StuExamView> listStuExam(Student student) {
		String SQL = "SELECT lessonName, beginTime,endTime, teacherName, grade FROM "
				+ "(SELECT lessonId , grade FROM  student, choose "
				+ " WHERE student.stuId=choose.stuId AND student.stuId= "
				+ student.getStuId()
				+ " ) A, "
				+ " (SELECT lesson.lessonId, lessonName, teacherId, beginTime, endTime "
				+ " FROM lesson LEFT JOIN exam on lesson.lessonId=exam.lessonId) B, teacher "
				+ " where B.lessonId= A.lessonId and B.teacherId=teacher.teacherId "
				+ " ORDER BY endTime DESC";
		List<StuExamView> stuExams = jdbcTemplateObject.query(SQL,
				new StuExamMapper());
		return stuExams;
	}

	public int update(Student student) {
		String SQL = "UPDATE student SET stuName = ? , stuPwd = ? , stuIC = ? WHERE stuId = ?";
		int res = jdbcTemplateObject.update(SQL, student.getStuName(),
				student.getStuPwd(), student.getStuIC(), student.getStuId());
		return res;
	}

	@Override
	public int choose(Student student, int lessonId) {
		String SQL = "INSERT choose VALUES(?,?,?,?)";
		int res = jdbcTemplateObject.update(SQL, null,
				lessonId, student.getStuId(), -1);
		return res;
	}

	@Override
	public int dropout(Student student, int lessonId) {
		String SQL = "DELETE FROM choose WHERE stuId=? AND lessonId=?";
		int res = jdbcTemplateObject.update(SQL,student.getStuId(),lessonId);
		return res;
	}

}
