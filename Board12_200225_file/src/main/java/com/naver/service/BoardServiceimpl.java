package com.naver.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.naver.dto.BoardVO;
import com.naver.dto.PageTO;
import com.naver.repository.BoardDAO;
import com.naver.repository.ReplyDAO;

@Service
@Transactional
public class BoardServiceimpl implements BoardService{

	@Autowired
	BoardDAO bdao;
	
	@Autowired
	private ReplyDAO rdao;
	
	@Override
	public List<BoardVO> list() {
		
		return bdao.list();
	}

	@Override
	public void insert(BoardVO vo) {
		bdao.insert(vo);
		
	}

	@Override
	public BoardVO read(int bno) {
		bdao.updateReadcnt(bno);
		return bdao.read(bno);
	}

	@Override
	public void delete(int bno) {
		
		 rdao.deleteByBno(bno);
//		 System.out.println(4/0);
		 bdao.delete(bno);
	}

	@Override
	public BoardVO updateui(int bno) {
		
		return bdao.updateui(bno);
	}

	@Override
	public void update(BoardVO vo) {
		bdao.update(vo);
	}

	@Override
	public PageTO listpage(PageTO to) {
		
		int amount = bdao.getAmount();	// 게시글의 개수를 확인 한다.
		
		to.setAmount(amount);		// 구한 게시글의 개수를 to에 넣는다.
		
		List<BoardVO> list = bdao.getListpage(to);	//리스트 페이지를 list 에 담아놓고 
		to.setList(list);							
		
		return to;
	}

	
}
