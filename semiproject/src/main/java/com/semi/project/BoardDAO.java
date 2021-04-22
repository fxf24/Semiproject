package com.semi.project;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("dao")
public class BoardDAO {
	@Autowired
	SqlSession session;
	
	public List<BoardVO> getAllBoard(){
		List<BoardVO> list = session.selectList("semiproject.allBoard");
		return list;
	}
	
	public MemberVO getMember(String member) {
		return session.selectOne("semiproject.getMember", member);
	}
}
