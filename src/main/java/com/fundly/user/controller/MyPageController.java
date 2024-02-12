package com.fundly.user.controller;

import com.fundly.user.service.UserInfoService;
import com.persistence.dto.UserDto;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Slf4j
@Controller
@RequestMapping("/mypage")
public class MyPageController {

    @Autowired
    private UserInfoService userInfoService;


    /* 프로필 */
    @GetMapping("/profile")
    public String mypageprofile(HttpSession session, Model model) {

        return selViewPage("tiles.index","user.profile",session,model);
    }

    /* 응원권 */
    @GetMapping("/coupon")
    public String mypagecoupon(HttpSession session, Model model) {

        return selViewPage("tiles.index","user.coupon",session,model);
    }

    /* 후원한 프로젝트 */
    @GetMapping("/fundingProject")
    public String mypageOrder(HttpSession session,Model model){

        log.error("\n\n" + selViewPage("tiles.index","user.fundingProject",session,model) + "\n\n");

        return selViewPage("tiles.index","user.fundingProject",session,model);
    }






    public String selViewPage(String mainView, String moveView, HttpSession session, Model model){

        String user_email = (String)(session.getAttribute("user_email"));// "helloworld@abc.com";

        log.error("\n\n user_email = " + user_email + "\n\n");

        if(user_email == null){
            return mainView;
        }

        UserDto userInfo = userInfoService.userInfo(user_email);
        String user_status = userInfo.getUser_status();
        String user_name = userInfo.getUser_name();

        model.addAttribute("userInfo",userInfo);
        model.addAttribute("userstatus",user_status);
        model.addAttribute("user_name",user_name);
        model.addAttribute("user_email",user_email);

        return moveView;
    }



}