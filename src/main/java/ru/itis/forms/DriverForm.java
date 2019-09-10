package ru.itis.forms;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import ru.itis.validators.UniqueDriverName;

import javax.validation.constraints.Digits;
import javax.validation.constraints.Size;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class DriverForm {
    @Digits(integer = 11, fraction = 0, message ="No more than 11 characters")
    private Long license;
    @UniqueDriverName
    private String name;
}
