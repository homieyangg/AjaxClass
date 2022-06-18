package ex02;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;

import ch04.Employee;
import ch04._02.service.EmployeeService;
import ch04._02.service.impl.EmployeeServiceImpl;

@Controller
public class Ex02Controller {

 EmployeeService employeeService;
 //@Autowired
 public Ex02Controller(EmployeeService employeeService) {
  this.employeeService = employeeService;
 }
// public Ex02Controller() {
//     System.out.println("=====>IoC容器正在建立本類別(Ex02Controller)的物件");
// }
 @GetMapping("/eeit145/ex02")
 public String ex02index() {
  return "ex02/index";
 }
 @GetMapping(value = "/ex02req01", produces = "text/html; charset = UTF-8")
 public @ResponseBody String req01() {
  SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy年MM月dd日 HH時mm分");
  return "現在時間" + simpleDateFormat.format(new Date());
 }
 @GetMapping(value = "/ex02req02/{key}", produces = "application/json; charset = UTF-8")
 public @ResponseBody Employee req02(@PathVariable("key") Long key ) {
  return employeeService.findById(key);
 }
 @GetMapping(value = "/ex02req03", produces = "application/json; charset = UTF-8")
 public @ResponseBody List<Employee> req03() {
	 return employeeService.findAll();
 }
 
// public @ResponseBody String timeNow() {
//  return "";
// }
// 
// @GetMapping("/variousData")
// public @ResponseBody Map<String, Object> variousData() {
//  return null;
// }
 
 
}