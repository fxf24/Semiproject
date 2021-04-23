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
	
	public MemberVO getMember(String id) {
		return session.selectOne("semiproject.getMember", id);
	}

	public BoardVO getOneBoard(int seq) {
		// TODO Auto-generated method stub
		session.update("semiproject.updateBoard",seq);
		return session.selectOne("semiproject.getOneBoard",seq);
	}

	public void signupMember(MemberVO member) {
		// TODO Auto-generated method stub
		session.insert("semiproject.insertMember", member);
	}

	public void writeBoard(BoardVO bvo) {
		// TODO Auto-generated method stub
		session.insert("semiproject.insertBoard", bvo);
	}
}
