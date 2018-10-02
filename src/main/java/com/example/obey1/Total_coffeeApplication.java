package com.example.obey1;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@SpringBootApplication
@Controller
public class Total_coffeeApplication {

	public static void main(String[] args) {
		SpringApplication.run(Total_coffeeApplication.class, args);
	}
	
	@Autowired
    Total_coffeeRepository total_coffeeRepository;
	
	@RequestMapping(value="/totaldata", method=RequestMethod.POST)
	public ResponseEntity<String> postData(@RequestBody Total_coffee total_coffee) {    

		total_coffeeRepository.save(total_coffee);
		return new ResponseEntity<>("Success", HttpStatus.OK);
	}
	//판매량,총수입 조회
	@RequestMapping(value="/total",method=RequestMethod.GET)
	
	public String getTotalData(Model model) {    
		List<Total_coffee> totallist = total_coffeeRepository.findAll();
		model.addAttribute("totallist",totallist);
		return "total";
	}
	

}
