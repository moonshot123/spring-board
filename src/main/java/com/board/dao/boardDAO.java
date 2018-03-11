package com.board.dao;

import java.util.List;
import java.util.Map;

import com.board.vo.boardVO;

public interface boardDAO {

	List<boardVO> alllist(Map<String, Object> serchmap);

	int write(boardVO vo);

	boardVO update(int sEQ);

	int updateboard(boardVO vo);

	int delboard(int d);

}
