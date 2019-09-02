package ru.itis.repository.postgres;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RestController;
import ru.itis.entities.Driver;

import java.util.List;
import java.util.Optional;

@Repository
public interface DriverRepository extends JpaRepository <Driver, Long> {

    List<Driver> findAll();
    Optional<Driver> findAllById(Long id);
    Optional<Driver> findByName(String name);

    @Query("from Driver d where d.name like CONCAT('%',:name,'%')")
    List<Driver> searchDriversByName(@Param("name") String name);
}
