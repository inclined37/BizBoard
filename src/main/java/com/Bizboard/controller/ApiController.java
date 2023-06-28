package com.Bizboard.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.Bizboard.service.AdminService;
import com.Bizboard.vo.Dept;

@RestController
@RequestMapping("/api/*")
public class ApiController {

	@Autowired
	private AdminService adminService;
	
	
    @GetMapping("deptList")
    public ResponseEntity<?> deptList(){
        Object deptList = adminService.getDeptList(); // JSON으로 반환될 데이터 List, Map
        return new ResponseEntity<>(deptList, HttpStatus.OK); // Object를 JSON으로 반환
    }
	
    @PostMapping("deptInsert")
    public ResponseEntity<?> deptInsert(@RequestBody Dept dept){
    	int result = adminService.deptInsert(dept);
    	
    	System.out.println("*************************");
    	System.out.println(result);
    	System.out.println("*************************");
    	
    	return new ResponseEntity<>(result, HttpStatus.OK);
    }
    
    @PostMapping("deptUpdate")
    public ResponseEntity<?> deptUpdate(@RequestBody Dept dept){
    	//int result = adminService.deptInsert(dept);
    	
    	System.out.println("*************************");
    	System.out.println(dept);
    	System.out.println("*************************");
    	
    	return new ResponseEntity<>(dept, HttpStatus.OK);
    }
	
    
    
    
}
