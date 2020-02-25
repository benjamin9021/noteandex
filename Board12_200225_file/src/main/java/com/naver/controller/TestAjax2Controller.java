package com.naver.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("test2")		//test2 폴더생성,...
public class TestAjax2Controller {
	
	//기존엔 post 메소드에서 view 화면으로 보내 줬는데 이번엔 기능의 분리 이다..
	
	@RequestMapping(value = "test1" , method = RequestMethod.GET)
	public void test1() {
		
	}
	
	@RequestMapping(value = "test2" , method = RequestMethod.GET)
	public void test2() {
		
	}
	
	@RequestMapping(value = "test3" , method = RequestMethod.GET)
	public void test3() {
		
	}
	
	@RequestMapping(value = "test4" , method = RequestMethod.GET)
	public void test4() {
		
	}
	
}

