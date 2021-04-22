package com.semi.project;

import java.util.List;

public interface BoardService {
	List<BoardVO> getAllBoard();
	MemberVO getMember(String id);
}
