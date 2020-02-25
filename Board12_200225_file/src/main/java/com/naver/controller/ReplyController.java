package com.naver.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.naver.dto.ReplyVO;
import com.naver.service.ReplyService;


//RESTFUL web 기능은 다르겠지만 uri 는 똑같다 그러나 데이터 전송 방식이 다르다.
//
//replies + data post : insert 기능..
//replies/bno + get : list 기능		페이징처리..해줘야함,,
//replies/bno/rno get : read 기능
//replies/rno + data put(얘도 데이터 전송방식) : update 기능
//replies/rno + delete : delete 기능


@RestController
@RequestMapping("replies")
public class ReplyController {

	@Autowired
	private ReplyService rservice;
	
	@RequestMapping(value = "" , method = RequestMethod.POST)
	public void insert(@RequestBody ReplyVO vo ) { //데이터 넘겨주면 결국엔 vo 형태로 나와 들어간다,
		
		rservice.insert(vo);
		
		System.out.println(vo);
	}
	
	@RequestMapping(value = "{bno}", method = RequestMethod.GET)
	public List<ReplyVO> list (@PathVariable Integer bno){
			
		List<ReplyVO> list=rservice.list(bno);
		
		//테스트용
//		List<ReplyVO> list = new ArrayList<ReplyVO>();
//		list.add(new ReplyVO(1, 24, "rt1", "rr1", "2020-02-21", "2020-02-21"));
//		list.add(new ReplyVO(2, 24, "rt2", "rr2", "2020-02-21", "2020-02-21"));
//		list.add(new ReplyVO(3, 24, "rt3", "rr3", "2020-02-21", "2020-02-21"));
		return list;
	}
	
	@RequestMapping(value = "{rno}" , method = RequestMethod.DELETE)
	public String delete(@PathVariable int rno) {
		System.out.println("::::" + rno);
		rservice.delete(rno);
		
		return "success_delete";
	}
	
	@RequestMapping( method = RequestMethod.PUT)
	public String update(@RequestBody ReplyVO vo)  {
		
		rservice.update(vo);
		
		return "success_update";
	}

}
