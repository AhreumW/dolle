package com.edu.member.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.edu.member.service.MemberService;
import com.edu.member.vo.MemberVo;

@Controller
public class MemberController {

	private static final Logger log = 
			LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private JavaMailSender mailSender;
	
	// 회원 목록 조회 화면으로
	@RequestMapping(value="/member/list.do", method=RequestMethod.GET)
	public String memberList(Model model) {
		
		log.debug("Welcome MemberController enter! ");
		
		List<MemberVo> memberList = memberService.memberSelectList();
		
		model.addAttribute("memberList", memberList);
		
		return "member/memberListView";
	}
	
	@RequestMapping(value="/member/listOne.do")
	public String memberListOne(int no, Model model) {
		log.debug("Welcome memberListOne enter! - {}", no);
		
		MemberVo memberVo = memberService.memberSelectOne(no);
		
		model.addAttribute("memberVo", memberVo);
		
		return "member/memberListOneView";
	}
	
	@RequestMapping(value="/auth/login.do", method=RequestMethod.GET)
	public String login(HttpSession session, Model model) {
		log.debug("Welcome MemberController login 페이지 이동! ");
		
		return "auth/loginForm";
	}
	
	@RequestMapping(value="/auth/loginCtr.do", method=RequestMethod.POST)
	public String loginCtr(String email, String password,
			HttpSession session, Model model) {
		log.debug("Welcome MemberController loginCtr! " 
			+ email + ", " + password);
		
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("email", email);
		paramMap.put("password", password);
		
		MemberVo memberVo = memberService.memberExist(paramMap);
		
		String viewUrl = "";
		if(memberVo != null) {
			// 회원이 존재한다면 세션에 담고 
			// 회원 전체 조회 페이지로 이동
			session.setAttribute("_memberVo_", memberVo);
			
			viewUrl = "redirect:/member/list.do";
		}else {
			viewUrl = "/auth/loginFail";
		}
		
		
		return viewUrl;
	}
	
	@RequestMapping(value="/auth/logout.do", method=RequestMethod.GET)
	public String logout(HttpSession session, Model model) {
		log.debug("Welcome MemberController logout 페이지 이동! ");
		
		// 세션의 객체들 파기
		session.invalidate();
		
		return "redirect:/auth/login.do";
	}
	
	@RequestMapping(value="/member/add.do", method=RequestMethod.GET)
	public String memberAdd(Model model) {
		log.debug("Welcome MemberController memberAdd 페이지 이동! ");
		
		return "member/memberForm";
	}

	@RequestMapping(value="/member/addCtr.do",
			method=RequestMethod.POST)
	public String memberAdd(MemberVo memberVo, Model model) {
		log.debug("Welcome MemberController memberAdd 신규등록 처리! "
				+ memberVo);
		
		memberService.memberInsertOne(memberVo);
		
		return "redirect:/auth/login.do";
	}
	
	@RequestMapping(value="/member/nick.do", method=RequestMethod.GET)
	public String memberCheck(@RequestParam(defaultValue ="0" ) int result, 
			@RequestParam(defaultValue ="" )String nickname ,Model model) {
		model.addAttribute("result",result);
		model.addAttribute("nickname", nickname);
		return "member/nickCheckForm";
	}
	
	@RequestMapping(value="/member/nickCtr.do", method = RequestMethod.GET)
	public String memberCheck(String nickname, Model model) {
		
		int result = memberService.memberNickNameList(nickname);
		
		model.addAttribute("result",result);
		model.addAttribute("nickname", nickname);
		
		
		return "redirect:nick.do";
	}
	
	@RequestMapping(value="/member/update.do")
	public String memberUpdate(int no, Model model) {
		log.debug("Welcome memberUpdate enter! - {}", no);
		
		MemberVo memberVo = memberService.memberSelectOne(no);
		
		model.addAttribute("memberVo", memberVo);
		
		return "member/memberUpdateForm";
	}
	
	@RequestMapping(value="/member/updateCtr.do",
			method=RequestMethod.POST)
	public String memberUpdateCtr(HttpSession session
			, MemberVo memberVo, Model model) {
		log.debug("Welcome MemberController memberUpdateCtr " 
				+ memberVo);
		
		int resultNum = memberService.memberUpdateOne(memberVo);
		
//		System.out.println("?????????   " + resultNum);
		
		// 데이터베이스에서 회원정보가 수정이 됬는지 여부
		if(resultNum > 0) {
			
			MemberVo sessionMemberVo = 
					(MemberVo)session.getAttribute("_memberVo_");
			// 세션에 객체가 존재하는지 여부
			if(sessionMemberVo != null) {
				// 세션의 값과 새로운 값이 일치하는지 여부
				// 홍길동				ㄴㅇㄹㄴㅇ
				// s1@test.com		ㄴㅇㄹ33@
				// 1111				2222
				if(sessionMemberVo.getNo() == memberVo.getNo()) {
					MemberVo newMemberVo = new MemberVo();
					
//					sessionMemberVo.setNo(memberVo.getNo());
//					sessionMemberVo.setEmail(memberVo.getEmail());
//					sessionMemberVo.setName(memberVo.getName());
					
					newMemberVo.setNo(memberVo.getNo());
					newMemberVo.setEmail(memberVo.getEmail());
					newMemberVo.setName(memberVo.getName());
					
					session.removeAttribute("_memberVo_");
					
					session.setAttribute("_memberVo_", 
							newMemberVo);
				}
			}
		}
		
		return "common/successPage";
	}
	
	@RequestMapping(value="/member/deleteCtr.do",
			method=RequestMethod.GET)
	public String memberDelete(@RequestParam(value="mno") int no
			, Model model) {
		log.debug("Welcome MemberController memberDelete"
				+ " 회원삭제 처리! - {}", no);
		
		memberService.memberDelete(no);
		
		return "redirect:/member/list.do";
	}
	
	// mailSending 코드
	@ResponseBody
	@RequestMapping(value = "/mail/mailSending.do"
			, method = {RequestMethod.GET, RequestMethod.POST})
	public int mailSending(String tomail, HttpServletRequest request
				, Model model) {

		String setfrom = "javacatch5@gmail.com";
		
		int rndNum = (int)(Math.random() * 8999) + 1001;
		
		String title = "인증번호 확인 메일입니다."; // 제목
		String content = "인증번호는 " + Integer.toString(rndNum) + "입니다."; // 내용

		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

			messageHelper.setFrom(setfrom); // 보내는사람 생략하거나 하면 정상작동을 안함
			messageHelper.setTo(tomail); // 받는사람 이메일
			messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
			messageHelper.setText(content); // 메일 내용
			
			mailSender.send(message);
		} catch (Exception e) {
			System.out.println(e);
		}

		return rndNum;
	}
}
