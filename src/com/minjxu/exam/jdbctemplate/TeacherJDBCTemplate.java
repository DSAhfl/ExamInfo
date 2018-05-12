package com.minjxu.exam.jdbctemplate;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;

import com.minjxu.exam.dao.TeacherDao;
import com.minjxu.exam.entity.Teacher;
import com.minjxu.exam.mapper.TeacherMapper;

public class TeacherJDBCTemplate implements TeacherDao {
	private JdbcTemplate jdbcTemplateObject;

	@Override
	public void setDataSource(DataSource ds) {
		this.jdbcTemplateObject = new JdbcTemplate(ds);

	}

	@Override
	public List<Teacher> listTeachers() {
		String SQL = "select * from teacher";
		List<Teacher> teachers = jdbcTemplateObject.query(SQL,
				new TeacherMapper());
		return teachers;
	}

	public int update(Teacher teacher) {
		String SQL = "UPDATE teacher SET teacherName = ? , teacherPwd = ?  WHERE teacherId = ?";
		int res = jdbcTemplateObject.update(SQL, teacher.getTeacherName(),
				teacher.getTeacherPwd(), teacher.getTeacherId());
		return res;
	}

	public int delete(int teacherId) {
		String SQL = "DELETE FROM teacher WHERE teacherId=? ";
		int res = jdbcTemplateObject.update(SQL, teacherId);
		return res;
	}

	public int add(String teacherName, String teacherIC) {
		String SQL = "INSERT teacher VALUES(?,?,?,?) ";
		int res = jdbcTemplateObject.update(SQL, null, teacherName,
				teacherIC.substring(teacherIC.length() - 6, teacherIC.length()), teacherIC);
		return res;
	}

	public int update(int teacherId, String teacherName, String teacherIC) {
		String SQL = "UPDATE teacher SET teacherName = ?, teacherIC = ? WHERE teacherId=? ";
		int res = jdbcTemplateObject.update(SQL, teacherName, teacherIC, teacherId);
		return res;
	}

}
