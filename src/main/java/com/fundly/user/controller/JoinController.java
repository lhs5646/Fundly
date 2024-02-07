package com.fundly.user.controller;

import com.fundly.user.model.UserJoinDao;
import com.fundly.user.service.JoinService;
import com.fundly.user.service.JoinServiceImpl;
import com.fundly.user.service.MailSendService;
import com.persistence.dto.UserDto;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.UUID;

@Slf4j
@Controller
@RequestMapping("/join")
public class JoinController {

//    @Autowired
//    UserJoinDao userJoinDao;

    @Autowired
    JoinService joinService;


    @Autowired
    MailSendService mailSendService;

    @GetMapping("/add")
    public String join(){ return "user/join";}

    @PostMapping("/add")
    public String joinsave(UserDto userDto) throws Exception {

        try {
            if(joinService.userJoin(userDto) != 1){
                log.error("여기서 에러 난거니? ");
                throw new RuntimeException("회원가입 실패");
            }

        } catch (RuntimeException e) {
            e.printStackTrace();
            log.error("여기서 에러 난거니??????????????????ㅇㄹㄴㅇㄹㄴㅇㄹ ");
            throw new RuntimeException(e);
        }

//        회원가입 후 로그인 화면으로 갈것인가 ? 메인으로 갈것인가 ?
        return "index";
    }

    // 메일 인증
    @PostMapping("/mailCheck")
    public String mailCheck(String email) throws Exception {

        try {
            mailSendService.joinEmail(email);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        return "/add/add";
    }


}
