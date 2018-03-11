package com.board.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.board.dao.boardDAO;
import com.board.vo.boardVO;

@Service("boardservice")
public class boardServiceImpl implements boardService{
	
	@Resource(name="boarddao")
	boardDAO boarddao;

	@Override
	public List<boardVO> alllist(Map<String, Object> serchmap) {
		// TODO Auto-generated method stub
		List<boardVO> list= boarddao.alllist(serchmap);
		return list;
	}

	@Override
	public int write(boardVO vo) {
		// TODO Auto-generated method stub
		int cnt = boarddao.write(vo);
		return cnt;
	}

	@Override
	public boardVO update(int sEQ) {
		// TODO Auto-generated method stub
		boardVO vo = boarddao.update(sEQ);
		
		return vo;
	}

	@Override
	public int updateboard(boardVO vo) {
		// TODO Auto-generated method stub
		int cnt = boarddao.updateboard(vo);
		
		return cnt;
	}

	@Override
	public int delboard(int d) {
		// TODO Auto-generated method stub
		int cnt = boarddao.delboard(d);
		return cnt;
	}
	
	
}
