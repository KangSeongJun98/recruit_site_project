package com.job.my.boards.web;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.job.my.boards.service.BoardService;
import com.job.my.boards.vo.BoardVO;
import com.job.my.boards.vo.ReplyVO;
import com.job.my.member.vo.MemberVO;

@Controller
public class BoardController {
	@Autowired
	BoardService boardService;
	
	/*
	 * // 해당 컨트롤러에서 연결되는 모든 화면에서 comList를 모두 사용 가능
	 * 
	 * @ModelAttribute("comList") public ArrayList<CodeVO>getCodeList(){ return
	 * codeService.getCodeList(null); }
	 */
	
	@RequestMapping("/boardView")
	public String boardView(Model model, HttpSession session) {
		ArrayList<BoardVO> boardList = boardService.getBoardList();
		model.addAttribute("boardList", boardList);
		return "board/boardView";
	}

	@RequestMapping("/boardWriteView")
	public String boardWriteView(HttpSession session) {
		if (session.getAttribute("login") == null) {
			return "redirect:/loginView";
		}
		return "board/boardWriteView";
	}

	@RequestMapping("/boardWriteDo")
	public String boardWriteDo(HttpSession session, BoardVO board) throws Exception {
		MemberVO vo = (MemberVO) session.getAttribute("login");
		board.setMemId(vo.getMemId());
		boardService.writeBoard(board);
		return "redirect:/boardView";
	}

	@RequestMapping("/boardDetailView")
	public String boardDetailView(int boardNo, Model model) throws Exception {
		BoardVO vo = boardService.getBoard(boardNo);
		ArrayList<ReplyVO> replyList = boardService.getReplyList(boardNo);
		model.addAttribute("board", vo);
		model.addAttribute("replyList", replyList);

		return "board/boardDetailView";
	}

	// @RequestMapping은 get post 둘 다 받음 메소드에 추가하면 post만 가능
	@RequestMapping(value = "/boardEditView", method = RequestMethod.POST)
	public String boardEditView(int boardNo, Model model) throws Exception {
		System.out.println(boardNo);
		BoardVO vo = boardService.getBoard(boardNo);
		model.addAttribute("board", vo);
		return "board/boardEditView";
	}

	@RequestMapping("/boardEditDo")
	public String boardEditDo(BoardVO vo) throws Exception {
		boardService.updateBoard(vo);
		return "redirect:/boardView";
	}

	@RequestMapping(value = "/boardDel", method = RequestMethod.POST)
	public String boardDel(int boardNo) throws Exception {
		boardService.deleteBoard(boardNo);
		return "redirect:/boardView";
	}

	// 객체를 joson 형태로 리턴 (@ResponseBody)
	@ResponseBody
	@PostMapping("writeReplyDo") // @RequestBody json 데이터 형태로 요청을 받음
	public ReplyVO writeReplyDo(@RequestBody ReplyVO vo) throws Exception {
		System.out.println(vo);
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmmssSSS");
		String uniqu = sdf.format(date);
		vo.setReplyNo(uniqu);
		boardService.writeReply(vo);
		ReplyVO result = boardService.getReply(uniqu);
		return result;
	}
	
	// 댓글 삭제
	@ResponseBody
	@RequestMapping(value = "/replyDel", method = RequestMethod.POST)
	public String clippingDel(@RequestBody ReplyVO vo, RedirectAttributes re, Model model) {
		try {
			boardService.replyDel(vo);
			System.out.println("삭제 정상처리");
			return "Y";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "N";
	}
}
