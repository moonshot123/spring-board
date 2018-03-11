package com.board.service;

import java.util.List;

import com.board.vo.boardVO;

public interface boardService {

	List<boardVO> alllist();

	int write(boardVO vo);

	boardVO update(int sEQ);

	int updateboard(boardVO vo);

	int delboard(int d);

}
