package com.fundly.chat.controller;

import com.fundly.chat.service.ChatFileService;
import com.fundly.chat.service.ChatService;
import com.persistence.dto.SelBuyMsgDetailsDto;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.net.MalformedURLException;
import java.util.ArrayList;

@Controller
@Slf4j
public class ChatController {

    @Autowired
    ChatService chatService;

    @Autowired
    ChatFileService chatFileService;

    @GetMapping("/chat")
    public String chatRoom() {
        return "chat/chatIndex";
    }

    @GetMapping("/chatPop")
    public String joinChatRoom(String user_id, String pj_id, Model model) {

//        유저id, 프로젝트 id로 채팅방을 얻어온다.
        String chatRoomName = chatService.getChatRoomName(user_id, pj_id);

        model.addAttribute("roomName", chatRoomName);

//        지난 채팅메시지를 가져온다.
        ArrayList<SelBuyMsgDetailsDto> messageList = chatService.loadMessages(user_id, pj_id);

        model.addAttribute("messageList", messageList);

//        model에 아이디랑 pj_id를 임시로 담았다
//        나중에는 프로젝트 상세 페이지 혹은 상담사와 문의하기를 눌렀을때 해당 값이 입력되어야 한다.ㅏ
        model.addAttribute("user_id", user_id);
        model.addAttribute("pj_id", pj_id);

//        채팅방에 입장하면서 자동으로 채팅방에 대한 구독이 시작된다.
        return "chat/chat";
    }

    @MessageMapping("/chat/{roomName}")
    @SendTo("/chatSub/{roomName}")
    public SelBuyMsgDetailsDto publishMessage(@DestinationVariable String roomName, SelBuyMsgDetailsDto message) {

        chatService.saveMessage(message);

        return message;
    }

    @PostMapping("/chat/file")
    @ResponseBody
    public ArrayList saveImgFile(@RequestParam("img_file") MultipartFile file) {
//        파일 저장 처리후에 파일 저장 경로를 리턴한다.
        ArrayList<String> urlList = new ArrayList<>();

//        파일을 저장하고 저장경로를 받는다.
        String savedUrl = chatFileService.saveImageFile(file);

//        저장경로를 json으로 리턴한다.
        urlList.add(savedUrl);

//        클라이언트가 파일을 첨부한 후에 별도로 메시지 퍼블리싱을 호출한다.
//        서로 다른 두 요청을 통해 파일을 저장한다. 따라서 서비스의 이미지 저장 메서드가 호출될 떄
//        서비스 계층에서 파일 테이블에 해당 메시지의 식별정보와 파일 저장 경로를 함께 저장해야한다.
//        그리고 두번째 요청인 메시지 요청이 올 때 파일 cnt를 담고있는 메시지의 요청이 오게 함으로서
//        나중에 파일 cnt값이 존재하는 객체가 퍼블리싱 될 때 클라이언트에서 파일 테이블에
        return urlList;
    }

    @GetMapping(value = "**/file/{fileName}")
    @ResponseBody
    public Resource loadImageFile(@PathVariable("fileName") String fileName) {
        try {
            return new UrlResource(String.format("file:%s%s", chatFileService.IMG_SAVE_LOCATION, fileName));
        } catch (MalformedURLException e) {
            log.error("fail to save file : {}", fileName);
            throw new RuntimeException(e);
        }
    }

//    @SneakyThrows
//    @GetMapping(
//            value = "**/file/{fileName}",
//            produces = MediaType.IMAGE_JPEG_VALUE
//    )
//    @ResponseBody
//    public byte[] loadImageFile(@PathVariable("fileName") String fileName) throws FileNotFoundException {
//
//        Path path = Path.of("/Users/dobigulbi/chat/file/" , fileName);
//
//        File imgFile = new File(path.toUri());
//
//        BufferedInputStream is = new BufferedInputStream(new FileInputStream(imgFile));
//
//        byte[] imgBlob = is.readAllBytes();
//
//        is.close();
//
//        return imgBlob;
//    }
}
