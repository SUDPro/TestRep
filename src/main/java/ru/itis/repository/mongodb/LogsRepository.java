package ru.itis.repository.mongodb;

import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;
import ru.itis.entities.Log;

@Repository
public interface LogsRepository extends MongoRepository<Log, String> {
}
