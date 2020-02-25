package com.naver.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.dto.ReplyVO;
import com.naver.repository.ReplyDAO;

@Service
public class ReplyServiceimpl implements ReplyService {
	
	@Autowired
	private ReplyDAO rdao;
	
	@Override
	public void insert(ReplyVO vo) {
		rdao.insert(vo);
	}

	@Override
	public List<ReplyVO> list(Integer bno) {
		List<ReplyVO> list = rdao.list(bno);
		
		return  list;
	}

	@Override
	public void delete(int rno) {
		rdao.delete(rno);
	}

	@Override
	public void update(ReplyVO vo) {
		rdao.update(vo);
		
	}

}
