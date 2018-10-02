package com.example.obey1;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

public interface CoffeeRepository extends CrudRepository<Coffee1, String> {
	Coffee1 findByName(String name);

	Coffee1 findById(int id);

	List<Coffee1> findAll();

	String deleteById(int id);

}