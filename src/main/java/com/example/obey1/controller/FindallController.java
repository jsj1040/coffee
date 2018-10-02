package com.example.obey1.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.obey1.Coffee1;
import com.example.obey1.CoffeeRepository;

@CrossOrigin(origins = { "*" })
@Controller
public class FindallController {
	@Autowired
	CoffeeRepository coffeeRepository;

	@RequestMapping("/findall")
	public String findall(Model model) {
		List<Coffee1> coffee = coffeeRepository.findAll();
		model.addAttribute("coffeeList", coffee);

		return "findall";
	}
	
}
