package com.naver.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.naver.utils.UploadFileUtils;

import sun.text.resources.cldr.FormatData;

@Controller
public class UploadController {

	@Resource(name = "uploadPath") // servlet context 에서 추가한 uploadPath 값을 가져 온다.
	private String uploadPath;

	@RequestMapping(value = "/uploadForm", method = RequestMethod.GET)
	public void uploadForm() {

	}

//	@RequestMapping(value = "/uploadForm" , method = RequestMethod.POST)
//	public void uploadForm(MultipartFile file) {	// 얘는 같은 이름의 파일 중복을 허용하지 않는다 , MultipartFile 얘는 파일만 받을 수 있다 

//		System.out.println(file.getOriginalFilename());
//		System.out.println(file.getSize());
//		System.out.println(file.getContentType());
//	}

	@RequestMapping(value = "/uploadForm" , method = RequestMethod.POST)
	   public String uploadForm(MultipartHttpServletRequest request , Model model) throws IOException {	// 얘는 같은 이름의 파일 중복을 허용하지 않는다 , MultipartHttpServletRequest 얘는 파일,문자열 모두 받아올수 있다.
			MultipartFile file = request.getFile("file");
			
			//중복 방지
			UUID uid = UUID.randomUUID();
			String savedname =  uid.toString() +"_"+ file.getOriginalFilename();	// 나중에는 getOriginalFilename 만 보여줘야 한다.   "_" 얘는 구분자 오리지날과 uuid랜덤값을 구분하여 알아보기 편하게 한다.
			
			File target = new File(uploadPath, savedname);
			FileCopyUtils.copy(file.getBytes(), target);		// 타겟에 업로드패쓰에 있는 파일을 카피 하는역할.
							// 파일의 크기를 지정 , 타겟에는 기존에 저장되어있는 이름과 원본 파일의 경로가 담겨 있다.
			
			System.out.println(savedname);
			String title = request.getParameter("title");
			System.out.println(title);
			System.out.println(file.getOriginalFilename());
			System.out.println(file.getSize());
			System.out.println(file.getContentType());
			
			model.addAttribute("savedname" , savedname );
			
			return "uploadResult";
	}
	
	
	@RequestMapping(value = "uploadajax" , method = RequestMethod.GET)
	 public void uploadajax() {
		
	}
	
	@RequestMapping(value = "uploadajax" , method = RequestMethod.POST ,produces = "text/plain;charset=UTF-8")
	@ResponseBody 
	public String uploadajax(MultipartHttpServletRequest request) throws IOException {
		
		MultipartFile file = request.getFile("file"); 	// formData.append("file" , file);	file 로 어펜드 했기에 ...

		
		return UploadFileUtils.uploadFile(uploadPath, file);
	}
	

}
