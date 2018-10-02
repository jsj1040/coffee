package com.example.obey1;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

//import com.example.obey1.Coffee;

@SpringBootApplication
@Controller
public class Coffee1Application {

	public static void main(String[] args) {
		SpringApplication.run(Coffee1Application.class, args);
	}

	@Autowired
	CoffeeRepository coffeeRepository;

	@Autowired
	Total_coffeeRepository totalRepository;

	// 커피삭제
	@Transactional
	@GetMapping("/deleteCoffee/{id}")
	public String deleteById(@PathVariable int id) {
		
		coffeeRepository.deleteById(id);
		return "redirect:/findall";
	}
	// 커피등록//
	@RequestMapping(value = "/postdata", method = RequestMethod.POST)
	public ResponseEntity<String> postData(@RequestBody Coffee1 coffee) {

		Calendar calendar = Calendar.getInstance();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		String regDate = format.format(calendar.getTime());
		coffee.setRegister_date(regDate);
		coffee.setUpdate_date(regDate);
		coffeeRepository.save(coffee);
		String id = String.valueOf(coffee.getId());
		return new ResponseEntity<>(id, HttpStatus.OK);
	}

	// 이름으로커피상세조회//
	@RequestMapping(value = "selectCoffee/{id}")
	@ResponseBody
	public ModelAndView getCoffeeDetail(@PathVariable int id, Model model) {
		Coffee1 coffee = coffeeRepository.findById(id);
		Total_coffee tcoffee = totalRepository.findById(id);
		model.addAttribute("name", coffee);
		model.addAttribute("tname", tcoffee);
		return new ModelAndView("select");
	}

	//커피수정	 // 
	@RequestMapping(value = "findid/{id}")
	@ResponseBody
	public Coffee1 findid(@PathVariable int id, Model model) {
		Coffee1 coffee = coffeeRepository.findById(id);
		return coffee;
	}

	// //커피수정//
	@RequestMapping(value = "/updatedata/{id}", method = RequestMethod.POST)
	public ResponseEntity<String> updateData(@PathVariable int id,
			@RequestBody Coffee1 coffee) {
		System.out.println(id);
		Coffee1 oldcoffee = coffeeRepository.findById(id);

		Total_coffee toldcoffee = totalRepository.findById(id);
		Calendar calendar = Calendar.getInstance();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		String upDate = format.format(calendar.getTime());

		oldcoffee.setName(coffee.getName());
		oldcoffee.setPrice(coffee.getPrice());
		oldcoffee.setUpdate_date(upDate);
		oldcoffee.setInventory(coffee.getInventory());

		toldcoffee.setName(coffee.getName());
		coffeeRepository.save(oldcoffee);
		totalRepository.save(toldcoffee);

		return new ResponseEntity<>("Success", HttpStatus.OK);
	}

	
//	/*
//	 * 커피 테이블 전체를 불러오는 메소드
//	 */
	@CrossOrigin("*")
	@GetMapping(value = "/getCoffeeList")
	public @ResponseBody
	List<Coffee1> getCoffeeList() {
		return coffeeRepository.findAll();
	}
	
	
	//판매
		@CrossOrigin("*")
	   @GetMapping(value="/getCoffees")
	   public @ResponseBody ArrayList<Coffee1> getCoffees(@RequestParam(value="menu") String menuString) {
	      String menu[] = menuString.split(",");
	      ArrayList<Coffee1> coffeeList = new ArrayList<Coffee1>();
	      for (int i=0; i<menu.length; i++) {
	         Coffee1 coffee = coffeeRepository.findById(Integer.parseInt(menu[i]));
	         if (coffee != null)
	            coffeeList.add(coffee);
	      }
	      return coffeeList;
	   }

	   @CrossOrigin("*")
	   @GetMapping(value= "/getTotalInfo/{id}")
	   public @ResponseBody Total_coffee getTotalInfo(@PathVariable int id) {
	      return totalRepository.findById(id);
	   }
	   
	   @CrossOrigin("*")
	   @GetMapping (value = "/getOneCoffee/{id}")
	   public @ResponseBody Coffee1 getOneCoffee(@PathVariable int id) {
	      Coffee1 coffee = coffeeRepository.findById(id);
	      return coffee;
	   }
	   
	   @CrossOrigin("*")
	   @PostMapping (value = "/postSaleData/{id}")
	   public ResponseEntity<String> postSaleData(@PathVariable int id, @RequestParam(value="quantity") int quantity) {      
	      Coffee1 coffee = coffeeRepository.findById(id);
	      int inventory = coffee.getInventory();
	      int price = coffee.getPrice();
	      
	      coffee.setInventory(inventory-quantity);
	      coffeeRepository.save(coffee);
	      
	      Total_coffee totalCoffee = totalRepository.findById(id);
	      int currentSale = totalCoffee.getTotal_sale();
	      int currentIncome = totalCoffee.getTotal_income();
	      System.out.println("current totalinfo: "+currentSale+", "+currentIncome);
	      totalCoffee.setTotal_sale(currentSale+quantity);
	      totalCoffee.setTotal_income(currentIncome+(price*quantity));
	      totalRepository.save(totalCoffee);
	      return new ResponseEntity<>("Success", HttpStatus.OK);
	   }
	   

}
