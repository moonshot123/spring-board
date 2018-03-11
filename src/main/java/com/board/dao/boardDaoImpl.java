package com.board.dao;

import java.util.List;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.board.vo.boardVO;

@Repository("boarddao")
public class boardDaoImpl implements boardDAO{
	
	@Inject
	SqlSessionTemplate sqlsession;

	@Override
	public List<boardVO> alllist() {
		// TODO Auto-generated method stub
		
		List<boardVO> list = sqlsession.selectList("mapper.list");
		
		return list;
	}

	@Override
	public int write(boardVO vo) {
		// TODO Auto-generated method stub
		int cnt = sqlsession.insert("mapper.insert",vo);
		return cnt;
	}

	@Override
	public boardVO update(int seq) {
		// TODO Auto-generated method stub
		boardVO vo = sqlsession.selectOne("mapper.board",seq);
		return vo;
	}

	@Override
	public int updateboard(boardVO vo) {
		// TODO Auto-generated method stub
		
		int cnt = sqlsession.update("mapper.updateboard", vo);
		
		return cnt;
	}

	@Override
	public int delboard(int d) {
		// TODO Auto-generated method stub
		int cnt = sqlsession.delete("mapper.del", d);
		return cnt;
	}
	
	
	
	
}
