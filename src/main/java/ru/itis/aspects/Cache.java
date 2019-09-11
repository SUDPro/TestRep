package ru.itis.aspects;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import ru.itis.entities.Driver;
import ru.itis.entities.Trip;
import ru.itis.entities.User;
import ru.itis.repository.postgres.DriverRepository;
import ru.itis.repository.postgres.TripRepository;

import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

@Configuration
@Aspect
public class Cache {

    private Map<Long, Driver> driverCache;

    public Cache() {
        driverCache = new HashMap<>();
    }

    @Autowired
    DriverRepository driverRepository;

    @Around("execution(* *..DriverService.getDriverName(..))")
    public Optional<Driver> checkCache(ProceedingJoinPoint jp) {
        if (driverCache.containsKey(jp.getArgs()[0])) {
            return Optional.ofNullable(driverCache.get(jp.getArgs()[0]));
        } else {
            Optional<Driver> driverOptional = null;
            try {
                driverOptional = (Optional<Driver>) jp.proceed(jp.getArgs());
                driverOptional.ifPresent(driver -> driverCache.put(driver.getId(), driver));
            } catch (Throwable throwable) {
                throwable.printStackTrace();
            }
            return driverOptional;
        }
    }
    


}
