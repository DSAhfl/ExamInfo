package com.minjxu.exam.handlers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminHandler {
	@RequestMapping("/index")
	public String test() {
		return "admin_index";
	}
}
