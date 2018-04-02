package com.minjxu.exam.handlers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/student")
public class StudentHandler {
	
	@RequestMapping("/index")
	public String studentIndex() {
		return "student_index";
	}
	
	@RequestMapping("/exam")
	public String adminExam() {
		return "student_exam";
	}
	@RequestMapping("/lesson")
	public String studentLseeon() {
		return "student_lesson";
	}
}
