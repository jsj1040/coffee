package com.example.obey1.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class IndexController {
	
	
		@RequestMapping("/index")
	    @ResponseBody
	    public ModelAndView CreatePage(){
	    	return new ModelAndView("index");
	    }
	
}
