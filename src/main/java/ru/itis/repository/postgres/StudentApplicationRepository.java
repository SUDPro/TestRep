package ru.itis.repository.postgres;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import ru.itis.entities.StudentApplication;
import ru.itis.entities.Trip;
import ru.itis.entities.User;

import java.util.List;
import java.util.Optional;

@Repository
public interface StudentApplicationRepository extends JpaRepository<StudentApplication, Long> {

    List<StudentApplication> findAllByTrip(Trip trip);

    Optional<StudentApplication> findByUserAndAndTrip(User user, Trip trip);
}
