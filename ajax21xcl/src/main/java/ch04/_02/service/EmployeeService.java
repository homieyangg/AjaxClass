package ch04._02.service;


import java.util.List;

import ch04.Employee;

public interface EmployeeService {

	void save(Employee e);

	Employee findById(Long id);
	
	List<Employee> findAll();
}
