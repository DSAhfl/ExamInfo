package com.minjxu.test.handlers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HelloWorld {

	/**
	 * 1. 使用RequestMapping注解来映射请求的URL 2. 返回值会通过视图解析器解析为实际的物理视图,
	 * 对于InternalResourceViewResolver视图解析器，会做如下解析 通过prefix+returnVal+suffix
	 * 这样的方式得到实际的物理视图，然后会转发操作 "/WEB-INF/views/success.jsp"
	 * 
	 * @return
	 */
	@RequestMapping("/helloworld")
	public String hello() {
		return "success";
	}

	@RequestMapping("/testRequestMapping")
	public String testRequestMapping() {
		return "success";
	}

	@RequestMapping("/testPathVariable/{id}")
	public String testPathVariable(@PathVariable(value = "id") Integer id) {
		return "success";
	}
	
	@RequestMapping("/login")
	public String login() {
		return "login";
	}
	
}