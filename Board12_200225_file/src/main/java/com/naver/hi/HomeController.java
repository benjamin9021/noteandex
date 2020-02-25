package com.naver.hi;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.jws.WebParam.Mode;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@RequestMapping("test")
	public String test(Model model) {
		model.addAttribute("name", "kim");
		model.addAttribute("age", 11);
		
		return "test";
	}
	
	@RequestMapping("/")
	public String home( ) {

		return "redirect:/board/listpage";
	}

}
