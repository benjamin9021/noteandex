package com.naver.repository;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.naver.dto.BoardVO;
import com.naver.dto.PageTO;

@Repository
public class BoardDAOimpl implements BoardDAO {

	@Autowired
	private SqlSession session;
	private final String NS = "com.naver.board";
	
	@Override
	public List<BoardVO> list() {
		
		return session.selectList(NS+".list");
	}

	@Override
	public void insert(BoardVO vo) {
		System.out.println(vo);
		session.insert(NS+".insert" , vo );
		
		//들어온값이 기존 vo 컬럼 개수 보다 없을 때
		//nvl 이라는 함수는 값이 null 이라면 어떻게 해줄거냐?
		//시퀀스 도있고 nvl 2도 있다
	}

	@Override
	public BoardVO read(int bno) {
		BoardVO vo = session.selectOne(NS+".read", bno);
		return session.selectOne(NS+".read", bno);
	}

	@Override
	public void delete(int bno) {
		session.delete(NS+".delete" , bno);
	}

	@Override
	public BoardVO updateui(int bno) {
		
		return session.selectOne(NS+ ".updateui" , bno );
	}

	@Override
	public void update(BoardVO vo) {
		System.out.println(vo);
		session.update(NS+".update" , vo);
	}

	@Override
	public void updateReadcnt(int bno) {
		session.update(NS+".updateReadcnt" , bno );
		
	}

	//페이징
	@Override
	public int getAmount() {
		return session.selectOne(NS+".getAmount");
	}
	@Override
	public List<BoardVO> getListpage(PageTO to) {
		RowBounds rb = new RowBounds(to.getStartNum()-1, to.getPerPage());
		// RowBounds =  1페이지 부터 몇 페이지까지 가져올거냐 
//		RowBounds 인덱스는 시작이 1 부터이기에 제일 최근 게시물이 씹힌다 그렇기에 스타트넘에서 -1 을 한다.
//		왜냐하면 list에서 보여주는 인덱스는 0부터 이기에..
//		System.out.println(to.getStartNum());
		
		return session.selectList(NS+".getListpage", null , rb);
		
		
//		return session.selectList(NS+".getlist", ?, rowBounds) 검색할 때는 이렇게도 사용
	}
}
