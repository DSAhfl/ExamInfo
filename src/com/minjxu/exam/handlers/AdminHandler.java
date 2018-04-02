package com.minjxu.exam.handlers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminHandler {

	@RequestMapping("/index")
	public String index() {
		return "admin_index";
	}

	@RequestMapping("/exam")
	public String adminExam() {
		return "admin_exam";
	}

	@RequestMapping("/lesson")
	public String adminLesson() {
		return "admin_lesson";
	}

	@RequestMapping("/student")
	public String adminStudent() {
		return "admin_student";
	}

	@RequestMapping("/teacher")
	public String adminTeacher() {
		return "admin_teacher";
	}

}
