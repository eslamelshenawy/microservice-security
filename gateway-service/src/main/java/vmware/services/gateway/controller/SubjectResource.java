package vmware.services.gateway.controller;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import vmware.services.gateway.entity.Subject;
import vmware.services.gateway.repository.SubjectRepository;

import java.util.List;

@RestController
@RequestMapping("/Subject")
public class SubjectResource {

    private final SubjectRepository subjectRepository;

    public SubjectResource(SubjectRepository subjectRepository) {
        this.subjectRepository = subjectRepository;
    }

    @GetMapping
    @PreAuthorize("hasRole('ADMIN')")
    public List<Subject> getAllSubjects(){
        return subjectRepository.findAll();
    }
}
