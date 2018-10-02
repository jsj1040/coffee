package com.example.obey1.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;


import com.example.obey1.CoffeeRepository;

@Controller
public class SelectController {
	@Autowired
	CoffeeRepository coffeeRepository;

	@RequestMapping("/updatecoffee/{id}")
	public String findall(@PathVariable int id, Model model) {
		// Coffee1 coffee = coffeeRepository.findById(id);
		model.addAttribute("id", id);
		return "select";
	}
}
