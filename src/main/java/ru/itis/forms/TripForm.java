package ru.itis.forms;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import ru.itis.entities.Driver;
import ru.itis.validators.UniqueTripName;

import javax.persistence.Column;
import javax.persistence.ManyToOne;
import javax.validation.constraints.Future;
import java.util.Date;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
public class TripForm {

    private String start;
    private String finish;

    @UniqueTripName
    private String name;
    private String driver;
    private Integer quota;

    @Future(message = "Check date")
    private Date date;
}
