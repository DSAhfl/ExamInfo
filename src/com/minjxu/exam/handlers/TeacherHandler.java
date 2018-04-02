package com.minjxu.exam.handlers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/teacher")
public class TeacherHandler {
	
	@RequestMapping("/index")
	public String index() {
		return "teacher_index";
	}
	
	@RequestMapping("/exam")
	public String adminExam() {
		return "teacher_exam";
	}
	
}
