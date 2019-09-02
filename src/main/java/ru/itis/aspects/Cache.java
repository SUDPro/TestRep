package ru.itis.aspects;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.springframework.beans.factory.annotation.Autowired;
import ru.itis.entities.User;
import ru.itis.repository.postgres.UsersRepository;

import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

public class Cache {

    private Map<Long, User> userCache;

    public Cache() {
        userCache = new HashMap<>();
    }

    @Autowired
    UsersRepository albumRepository;


    @Around("execution(* *..AlbumService.getAlbum(..))")
    public Optional<User> checkCache(ProceedingJoinPoint jp) {
        if (userCache.containsKey(jp.getArgs()[0])) {
            return Optional.ofNullable(userCache.get(jp.getArgs()[0]));
        } else {
            Optional<User> userOPtional = null;
            try {
                userOPtional = (Optional<User>) jp.proceed(jp.getArgs());
                userOPtional.ifPresent(user -> userCache.put(user.getId(), user));
            } catch (Throwable throwable) {
                throwable.printStackTrace();
            }
            return userOPtional;
        }
    }
}
