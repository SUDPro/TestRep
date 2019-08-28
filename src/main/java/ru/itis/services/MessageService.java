package ru.itis.services;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import ru.itis.entities.ChatMessage;

import java.util.List;
import java.util.Optional;

public interface MessageService {

    List<ChatMessage> findAllByRoomId(String roomId);

    void save(ChatMessage chatMessage);

    List<ChatMessage> findAll();

    List<ChatMessage> findAllRoomIdUnique();

    List<ChatMessage> findChatMessageByRoomsId(List<String> roomId);

    List<String> findAllRoomId();
}

