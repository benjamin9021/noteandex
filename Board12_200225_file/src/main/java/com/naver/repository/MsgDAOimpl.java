package com.naver.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.naver.dto.MsgDTO;

@Repository
public class MsgDAOimpl implements MsgDAO {
	
	@Autowired
	SqlSession session;
	private final String NS = "com.naver.msg";
	
	
	@Override
	public void insert(MsgDTO mdto) {
		session.insert(NS+".insert", mdto);
	}
 
	
	
	
}
