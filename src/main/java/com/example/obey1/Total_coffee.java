package com.example.obey1;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.transaction.annotation.EnableTransactionManagement;

@Entity
@Table(name = "total_coffee")
@EnableTransactionManagement
public class Total_coffee {
	@Id
	private int id;
	private String name;
	private int total_sale;
	private int total_income;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getTotal_sale() {
		return total_sale;
	}
	public void setTotal_sale(int total_sale) {
		this.total_sale = total_sale;
	}
	public int getTotal_income() {
		return total_income;
	}
	public void setTotal_income(int total_income) {
		this.total_income = total_income;
	}
}
