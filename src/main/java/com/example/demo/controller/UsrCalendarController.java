package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.util.Ut;
import com.example.demo.vo.Member;
import com.example.demo.vo.ResultData;
import com.example.demo.vo.Rq;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class UsrCalendarController {

	@Autowired
	private Rq rq;

	@Autowired
	private calenderService calenderService;

	@RequestMapping("/usr/home/doLogout")
	@ResponseBody
	public String doLogout(HttpServletRequest req) {
		Rq rq = (Rq) req.getAttribute("rq");

		if (!rq.isLogined()) {
			return Ut.jsHistoryBack("F-A", "이미 로그아웃 상태입니다");
		}

		rq.logout();

		return Ut.jsReplace("S-1", "로그아웃 되었습니다", "/");
	}

	@RequestMapping("/usr/home/login")
	public String showLogin(HttpServletRequest req) {

		Rq rq = (Rq) req.getAttribute("rq");

		if (rq.isLogined()) {
			return Ut.jsHistoryBack("F-A", "이미 로그인 함");
		}

		return "usr/home/login";
	}

	@RequestMapping("/usr/home/doLogin")
	@ResponseBody
	public String doLogin(HttpServletRequest req, String loginId, String loginPw, String afterLoginUri) {

		Rq rq = (Rq) req.getAttribute("rq");

		if (rq.isLogined()) {
			return Ut.jsHistoryBack("F-A", "이미 로그인 함");
		}

		if (Ut.isNullOrEmpty(loginId)) {
			return Ut.jsHistoryBack("F-1", "아이디를 입력해주세요");
		}
		if (Ut.isNullOrEmpty(loginPw)) {
			return Ut.jsHistoryBack("F-2", "비밀번호를 입력해주세요");
		}

		Member member = calenderService.getMemberByLoginId(loginId);

		if (member == null) {
			return Ut.jsHistoryBack("F-3", Ut.f("%s(은)는 존재하지 않는 아이디입니다", loginId));
		}

		if (member.getLoginPw().equals(loginPw) == false) {
			return Ut.jsHistoryBack("F-4", Ut.f("비밀번호가 일치하지 않습니다"));
		}

		rq.login(member);

		if (afterLoginUri.length() > 0) {
			return Ut.jsReplace("S-1", Ut.f("%s님 환영합니다", member.getNickname()), afterLoginUri);
		}

		return Ut.jsReplace("S-1", Ut.f("%s님 환영합니다", member.getNickname()), "/");
	}

	@RequestMapping("/usr/home/join")
	public String showJoin(HttpServletRequest req) {

		return "usr/home/join";
	}

	@RequestMapping("/usr/home/doJoin")
	@ResponseBody
	public String doJoin(HttpServletRequest req, String loginId, String loginPw, String name, String nickname, String birth_date,
			String phone_number, String email) {
		Rq rq = (Rq) req.getAttribute("rq");
		if (rq.isLogined()) {
			return Ut.jsHistoryBack("F-A", "이미 로그인 상태입니다");
		}

		if (Ut.isNullOrEmpty(loginId)) {
			return Ut.jsHistoryBack("F-1", "아이디를 입력해주세요");
		}
		if (Ut.isNullOrEmpty(loginPw)) {
			return Ut.jsHistoryBack("F-2", "비밀번호를 입력해주세요");
		}
		if (Ut.isNullOrEmpty(name)) {
			return Ut.jsHistoryBack("F-3", "이름을 입력해주세요");
		}
		if (Ut.isNullOrEmpty(nickname)) {
			return Ut.jsHistoryBack("F-4", "닉네임을 입력해주세요");
		}
		if (Ut.isNullOrEmpty(birth_date)) {
			return Ut.jsHistoryBack("F-5", "생년월일을 입력해주세요");
			
		}
		if (Ut.isNullOrEmpty(phone_number)) {
			return Ut.jsHistoryBack("F-6", "전화번호를 입력해주세요");

		}
		if (Ut.isNullOrEmpty(email)) {
			return Ut.jsHistoryBack("F-7", "이메일을 입력해주세요");
		}

		ResultData<Integer> joinRd = calenderService.join(loginId, loginPw, name, nickname, birth_date, phone_number, email);

		if (joinRd.isFail()) {
			return Ut.jsHistoryBack(joinRd.getResultCode(), joinRd.getMsg());
		}

		Member member = calenderService.getMember(joinRd.getData1());

		return Ut.jsReplace(joinRd.getResultCode(), joinRd.getMsg(), "../home/login");
	}

	@RequestMapping("/usr/home/myPage")
	public String showMyPage() {

		return "usr/home/myPage";
	}

	@RequestMapping("/usr/home/checkPw")
	public String showCheckPw() {

		return "usr/home/checkPw";
	}

	@RequestMapping("/usr/home/doCheckPw")
	public String doCheckPw(String loginPw) {

		if (Ut.isNullOrEmpty(loginPw)) {
			return rq.historyBackOnView("비번 입력해");
		}

		if (rq.getLoginedMember().getLoginPw().equals(loginPw) == false) {
			return rq.historyBackOnView("비번 틀림");
		}

		return "usr/home/modify";
	}

	@RequestMapping("/usr/home/doModify")
	@ResponseBody
	public String doModify(HttpServletRequest req, String loginPw, String name, String nickname, String birth_date, String phone_number,
			String email) {
		Rq rq = (Rq) req.getAttribute("rq");

		// 비밀번호 안바꿀 수도 있어서 비번 null 체크는 제거

		if (Ut.isNullOrEmpty(name)) {
			return Ut.jsHistoryBack("F-3", "이름을 입력해주세요");
		}
		if (Ut.isNullOrEmpty(nickname)) {
			return Ut.jsHistoryBack("F-4", "닉네임을 입력해주세요");
		}
		if (Ut.isNullOrEmpty(birth_date)) {
			return Ut.jsHistoryBack("F-5", "생년월일을 입력해주세요");
			
		}
		if (Ut.isNullOrEmpty(phone_number)) {
			return Ut.jsHistoryBack("F-6", "전화번호를 입력해주세요");

		}
		if (Ut.isNullOrEmpty(email)) {
			return Ut.jsHistoryBack("F-7", "이메일을 입력해주세요");
		}

		ResultData modifyRd;

		if (Ut.isNullOrEmpty(loginPw)) {
			modifyRd = calenderService.modifyWithoutPw(rq.getLoginedMemberId(), name, nickname, birth_date, phone_number,
					email);
		} else {
			modifyRd = calenderService.modify(rq.getLoginedMemberId(), loginPw, name, nickname, birth_date, phone_number, email);
		}

		return Ut.jsReplace(modifyRd.getResultCode(), modifyRd.getMsg(), "../home/myPage");
	}
}