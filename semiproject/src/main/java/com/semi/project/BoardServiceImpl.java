package com.semi.project;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardServiceImpl implements BoardService {
	@Autowired
	BoardDAO dao;
	
	@Override
	public List<BoardVO> getAllBoard() {
		return dao.getAllBoard();
	}

	@Override
	public MemberVO getMember(String id) {
		// TODO Auto-generated method stub
		return dao.getMember(id);
	}

	@Override
	public BoardVO getOneBoard(int seq) {
		// TODO Auto-generated method stub
		return dao.getOneBoard(seq);
	}

	@Override
	public void signupMember(MemberVO member) {
		// TODO Auto-generated method stub
		dao.signupMember(member);
	}

	@Override
	public void writeBoard(BoardVO bvo) {
		// TODO Auto-generated method stub
		dao.writeBoard(bvo);
	}

}
