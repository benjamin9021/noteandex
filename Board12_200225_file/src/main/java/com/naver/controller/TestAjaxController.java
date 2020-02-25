package com.naver.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.naver.dto.BoardVO;
import com.naver.dto.MemberDTO;



@Controller
@RequestMapping("test")
public class TestAjaxController  {
	
	@RequestMapping(value = "test1" , method = RequestMethod.GET)
	public void test1() {	
		
	}
	//produces ="application/text;charset=UTF-8" 는 ajax 시 한글을 위해 해주는 한글인코딩 작업
	@RequestMapping(value = "test1" , method = RequestMethod.POST ,produces ="application/text;charset=UTF-8") 
	@ResponseBody		//뷰자체가  아니라 뷰에 데이터만을 반환
	public String test1(String str) {
		
		return str;
	}
	
	
	@RequestMapping(value = "test2" , method = RequestMethod.GET)
	public void test2() {	
		
	}
//	, produces ="application/text;charset=UTF-8"
	@RequestMapping(value = "test2" , method = RequestMethod.POST ) 
	@ResponseBody		//뷰자체가  아니라 뷰에 데이터만을 반환
	public String[] test2(String[] arr) { 
		
		
		System.out.println(":::::");
		for(String x : arr) {
			System.out.println(x);
		}
		System.out.println(":::::");
		
		return arr;
	}
	
	@RequestMapping(value = "test22",method = RequestMethod.GET)
	public void test22() {
		
	}
	
	@RequestMapping(value = "test22" , method = RequestMethod.POST ) 
	@ResponseBody		
	public String[] test22(String[] arr) { 

		return arr;
	}
	
	@RequestMapping(value = "test3" , method =  RequestMethod.GET)
	public void test3() {
		
	}
	
	@RequestMapping(value = "test3" , method =  RequestMethod.POST)
	@ResponseBody
	public BoardVO test3(BoardVO vo) {
		
		return vo;
	}
	
	@RequestMapping(value = "test4" ,method = RequestMethod.GET)
	public void test4() {
		
	}
	@ResponseBody
	@RequestMapping(value = "test4" ,method = RequestMethod.POST)
	public List<Map<String, Object>> test4(@RequestParam Map <String, Object> map) throws Exception {
		String JsonStr = map.get("mlist").toString();
		System.out.println(JsonStr);
		ObjectMapper mapper = new ObjectMapper();	//jsp 에서 writeValueAsString 해준걸 풀어 헤친다.
		
		List<Map<String, Object>> list = mapper.readValue(JsonStr, new TypeReference<ArrayList<Map<String,Object>>>(){});
		
		for(Map<String, Object> m : list) {
			System.out.println("::::::::::::::::::");
			System.out.println(m.get("id"));
			System.out.println(m.get("name"));
			System.out.println(m.get("age"));
			System.out.println("::::::::::::::::::");
		}
		return list;
	}
	

}


