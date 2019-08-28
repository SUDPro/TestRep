package ru.itis.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import ru.itis.entities.StudentApplication;
import ru.itis.entities.Trip;

import java.util.List;

@Repository
public interface StudentApplicationRepository extends JpaRepository<StudentApplication, Long> {

    List<StudentApplication> findAllByTrip(Trip trip);
}
