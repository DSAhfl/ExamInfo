package com.minjxu.exam.handlers;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class LoginHandler {
	@RequestMapping("/login")
	public String login(@RequestParam("username") String username, @RequestParam("password") String password,
            Model model, HttpServletRequest request) {
		String rtn = null;
		String type = request.getParameter("inlineRadioOptions");
		if(type.equals("admin")){
			rtn = "redirect:/admin/index";
		}else if(type.equals("student")){
			rtn = "redirect:/student/index";
		}else if(type.equals("teacher")){
			rtn = "redirect:/teacher/index";
		}
		return rtn;
	}
}
