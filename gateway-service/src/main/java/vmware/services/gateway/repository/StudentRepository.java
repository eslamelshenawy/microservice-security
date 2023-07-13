package vmware.services.gateway.repository;


import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;
import vmware.services.gateway.entity.Student;
@Repository
public interface StudentRepository extends MongoRepository<Student,Long> {
}
