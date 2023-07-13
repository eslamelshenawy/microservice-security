package vmware.services.gateway.repository;

import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;
import vmware.services.gateway.entity.Subject;
@Repository
public interface SubjectRepository  extends MongoRepository<Subject,Long> {
}
