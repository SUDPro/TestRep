package ru.itis.controllers;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
import org.springframework.messaging.simp.SimpMessageSendingOperations;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import ru.itis.entities.ChatMessage;
import ru.itis.entities.Item;
import ru.itis.listeners.WebSocketEventListener;
import ru.itis.security.UserDetailsImpl;
import ru.itis.services.MessageService;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import static java.lang.String.format;

@Controller
public class MessageController {


    private static final Logger logger = LoggerFactory.getLogger(WebSocketEventListener.class);

    @Autowired
    private SimpMessageSendingOperations messagingTemplate;

    @Autowired
    MessageService messageService;

    @MessageMapping("/chat/{roomId}/sendMessage")
    public void sendMessage(@DestinationVariable String roomId, @Payload ChatMessage chatMessage) {
        messagingTemplate.convertAndSend(format("/channel/%s", roomId), chatMessage);
        messagingTemplate.convertAndSend(format("/channel/admin"), chatMessage);
        chatMessage.setRoomId(roomId);
        chatMessage.setDate(new Date());
        messageService.save(chatMessage);
    }

    @MessageMapping("/chat/{roomId}/addUser")
    public void addUser(@DestinationVariable String roomId, @Payload ChatMessage chatMessage,
                        SimpMessageHeaderAccessor headerAccessor) {
        String currentRoomId = (String) headerAccessor.getSessionAttributes().put("room_id", roomId);
        if (currentRoomId != null) {
            ChatMessage leaveMessage = new ChatMessage();
            leaveMessage.setType(ChatMessage.MessageType.LEAVE);
            leaveMessage.setSender(chatMessage.getSender());
            messagingTemplate.convertAndSend(format("/channel/%s", currentRoomId), leaveMessage);
        }
        headerAccessor.getSessionAttributes().put("username", chatMessage.getSender());
        messagingTemplate.convertAndSend(format("/channel/%s", roomId), chatMessage);
    }

    @GetMapping("/admin")
    public String getAdminPage(ModelMap modelMap, Authentication auth, HttpServletRequest request) {
        request.isUserInRole("ADMIN");
        modelMap.addAttribute("messages", messageService.findChatMessageByRoomsId(messageService.findAllRoomId()));
        return "admin";
    }

    @GetMapping("/")
    public String getTestPage() {
        return "redirect:/trips";
    }

    @GetMapping(value = "/admin", params = {"roomId"})
    public String getOneChatPage(@RequestParam("roomId") String roomId, ModelMap modelMap) {
        modelMap.addAttribute("roomId", roomId);
        modelMap.addAttribute("messages", messageService.findAllByRoomId(roomId));
        return "chat";
    }
}
