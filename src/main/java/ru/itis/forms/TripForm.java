package ru.itis.forms;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import ru.itis.entities.Driver;

import javax.persistence.Column;
import javax.persistence.ManyToOne;
import java.util.Date;
@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
public class TripForm {

    private String start;
    private String finish;
    private String name;
    private String driver;
    private String date;
}
