package com.board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
		
		int pageNostr =request.getParameter("pageNo") == null? 1 : Integer.parseInt(request.getParameter("pageNo"));
			
		String serselect= request.getParameter("serselect");
		String serch= request.getParameter("serch");
		String sdate= request.getParameter("sdate");
		String ndate= request.getParameter("ndate");
		int pageNo = pageNostr;
		
		Map<String, Object> serchmap = new HashMap<String, Object>();
		
		serchmap.put("serselect", serselect);
		serchmap.put("serch", serch);
		serchmap.put("sdate", sdate);
		serchmap.put("ndate", ndate);
		serchmap.put("listsize", 5);
		serchmap.put("pageNo", pageNo);
		
		/*
		System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaaaaa"+request.getParameter("serselect"));
		System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaaaaa"+request.getParameter("serch"));
		System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaaaaa"+request.getParameter("sdate"));
		System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaaaaa"+request.getParameter("ndate"));
		
		* 검색을 할때 매개변수가 없는 전체리스트 받는것은 그대로 두고 한개 다시 만들어서 사용해야 한다.....
		* 안그럼 나중에 입력이나 이런거 한다음에 함수를 다시타고 가야되는데 그때 null오류가 생겨버린다.  
		*/
		List<boardVO> list = boardservice.alllist(serchmap);
		
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
