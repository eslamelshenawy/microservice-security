package vmware.services.gateway.controller;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import vmware.services.gateway.entity.Student;
import vmware.services.gateway.repository.StudentRepository;

import java.util.List;

@RestController
@RequestMapping("/Student")
public class StudentResource {

private final StudentRepository studentRepository;

    public StudentResource(StudentRepository studentRepository) {
        this.studentRepository=studentRepository;
    }

    @GetMapping
    @PreAuthorize("hasRole('ADMIN') OR hasRole('USER')")
    public List<Student> getAllStudents(){
        return studentRepository.findAll();
    }
}
