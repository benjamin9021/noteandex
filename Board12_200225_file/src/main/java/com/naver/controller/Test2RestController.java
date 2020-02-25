package com.naver.controller;

import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController				//@RestController 는 구현 말고 어노테이션으로만 지원 된다.
							// public class Test2RestController implements Controller { 얘와 같은 의미
public class Test2RestController  {
	
	@RequestMapping(value = "rest1" , method = RequestMethod.POST, produces ="application/text;charset=UTF-8")
	public String rest1(@RequestBody String test1) {
		System.out.println(test1);
		return "good" + test1;
	}
	
	@RequestMapping(value = "rest2" , method = RequestMethod.POST)
	public String rest2(@RequestBody Map<String, Object> map) {
		System.out.println(map.get("test1"));
		System.out.println(map.get("test2"));
		System.out.println(map.get("test3"));
		
		return "what";
		
	}
	
	@RequestMapping(value = "rest3" , method = RequestMethod.POST)
	public String rest3(@RequestBody Map<String, Object> map) {

		Object obj =  map.get("test4");
		if (obj != null) {
			List<Map<String, Object>> list = (List<Map<String, Object>>)obj;
			
			for (Map<String, Object> m:list) {
				System.out.println("::::::::::::");
				System.out.println(m.get("name"));
				System.out.println(m.get("age"));
				System.out.println(m.get("addr"));
				System.out.println("::::::::::::");
			}
		}
		return "what";
	}
	
	@RequestMapping(value = "rest4" , method = RequestMethod.POST)
	public String rest4(@RequestBody Map<String, Object> map) {
		Object obj = map.get("test4");
		
		if (obj != null) {
			List<Map<String, Object>> list = (List<Map<String, Object>>)obj;
			for (Map<String, Object> m:list) {
				
				System.out.println("::::::::::::");
				System.out.println(m.get("name"));
				System.out.println(m.get("age"));
				System.out.println(m.get("addr"));
				System.out.println("::::::::::::");
				
			}
		}
		
		Object obj2 = map.get("test5");
		
		if (obj2 != null) {
			List<Map<String, Object>> list = (List<Map<String, Object>>)obj2;
			for (Map<String, Object> m:list) {
				
				System.out.println("::::::::::::");
				System.out.println(m.get("id"));
				System.out.println(m.get("name"));
				System.out.println(m.get("age"));
				System.out.println("::::::::::::");
				
			}
		}
		
		return "hello";
	}
}
