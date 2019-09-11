package ru.itis.aspects;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import ru.itis.entities.Driver;
import ru.itis.repository.postgres.DriverRepository;

import java.util.ArrayList;
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
    public ArrayList<Driver> checkCache(ProceedingJoinPoint jp) {
        if (driverCache.containsKey(jp.getArgs()[0])) {
            return null;
        } else {
            ArrayList<Driver> driverOptional = null;
            try {
                driverOptional = (ArrayList<Driver>) jp.proceed(jp.getArgs());
                driverOptional.forEach(driver -> driverCache.put(driver.getId(), driver));
            } catch (Throwable throwable) {
                throwable.printStackTrace();
            }
            return driverOptional;
        }
    }
}
