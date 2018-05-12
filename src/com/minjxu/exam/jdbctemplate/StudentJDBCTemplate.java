package com.minjxu.exam.jdbctemplate;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;

import com.minjxu.exam.dao.StudentDao;
import com.minjxu.exam.entity.Clazz;
import com.minjxu.exam.entity.Student;
import com.minjxu.exam.mapper.ClazzMapper;
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


	public int update(Student student) {
		String SQL = "UPDATE student SET stuName = ? , stuIC = ?, classId = ? WHERE stuId = ?";
		int res = jdbcTemplateObject.update(SQL, student.getStuName(),
				student.getStuIC(), student.getClassId(), student.getStuId());
		return res;
	}

	@Override
	public int choose(Student student, int lessonId) {
		String SQL = "INSERT choose VALUES(?,?,?,?)";
		int res = jdbcTemplateObject.update(SQL, null, lessonId,
				student.getStuId(), -1);
		return res;
	}

	@Override
	public int dropout(Student student, int lessonId) {
		String SQL = "DELETE FROM choose WHERE stuId=? AND lessonId=?";
		int res = jdbcTemplateObject.update(SQL, student.getStuId(), lessonId);
		return res;
	}

	public int delete(int studentId) {
		String SQL = "DELETE FROM student WHERE stuId=? ";
		int res = jdbcTemplateObject.update(SQL, studentId);
		return res;
	}

	public int add(String stuName, String stuIC, int classId) {
		String SQL = "INSERT student VALUES(?,?,?,?,?) ";
		int res = jdbcTemplateObject.update(SQL, null, stuName,
				stuIC.substring(stuIC.length() - 6, stuIC.length()), stuIC, classId);
		
		return res;
	}

	@Override
	public List<Clazz> listClazz() {
		List<Clazz> clazzs = null;
		String SQL = "SELECT * FROM class";
		clazzs = jdbcTemplateObject.query(SQL, new ClazzMapper());
		return clazzs;
	}

}
