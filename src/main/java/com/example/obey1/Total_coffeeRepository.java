package com.example.obey1;

import java.util.List;

import org.springframework.data.repository.CrudRepository;


public interface Total_coffeeRepository extends CrudRepository<Total_coffee, String> {
	Total_coffee findByName(String name);
	Total_coffee findById(int id);
	List<Total_coffee> findAll();
}