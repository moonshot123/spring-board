package com.board.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.board.service.boardService;
import com.board.vo.boardVO;

@Controller
public class boardController {
	
	@Resource(name="boardservice")
	boardService boardservice;
	
	//리스트 ,검색 ,페이징(화면, 하단)
	@RequestMapping(value="/list.bo")
	public String list(Model model, HttpServletRequest request){
		
		
		
		
		
		List<boardVO> list = boardservice.alllist();
		
		model.addAttribute("list", list);
		
		for(boardVO a:list){
			System.out.println(a.getMEM_ID());
		}
			
		return "board/list";
	}
	
	
	@RequestMapping(value="writeform.bo")	
	public String gowriteform(){
		return "board/write";
	} 
	
	
	@RequestMapping(value="boardwrite.bo")
	public String boardwrite(boardVO vo){
		
		int cnt = boardservice.write(vo);
				
		if(cnt == 1){
			System.out.println("입력성공");
		}else{
			System.out.println("입력실패");
		}
		
		return "redirect:/list.bo";
	}
	
	
	@RequestMapping(value="update.bo")
	public String boardupdate(HttpServletRequest request, Model model){
		
		int SEQ = Integer.parseInt(request.getParameter("SEQ"));
		boardVO vo = boardservice.update(SEQ);
		
		model.addAttribute("board",vo);
				
		return "board/write";
	}
	
	
	@RequestMapping(value="boardupdate.bo")
	public String update(boardVO vo,Model model){
		
		int cnt = boardservice.updateboard(vo);
		
		return "redirect:/list.bo";
	}
	
	
	@RequestMapping(value="del.bo")
	public String del(HttpServletRequest request){
		
		for( String a : request.getParameterValues("chk") ){
			int d = Integer.parseInt(a);
			boardservice.delboard(d);
		}
				
		
		
		return "redirect:/list.bo";
	}
	
}
