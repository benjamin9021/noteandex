package com.naver.service;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.naver.dto.MsgDTO;
import com.naver.repository.MsgDAO;
import com.naver.repository.User0DAO;

@Service
// @Transactional
public class TranServiceimpl implements TranService{

   @Inject
   private User0DAO udao;
   
   @Inject
   private MsgDAO mdao;
   
   public void insert() {   //트랜잭션 상태
	  MsgDTO mdto1 = new MsgDTO(2, "m1", "m2"); 
      mdao.insert(mdto1);
      System.out.println(4/0);
      udao.updatePoint(mdto1.getSender());
   }
   
}