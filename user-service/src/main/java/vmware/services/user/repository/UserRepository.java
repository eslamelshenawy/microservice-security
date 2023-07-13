package vmware.services.user.repository;

import org.springframework.data.mongodb.repository.MongoRepository;
import vmware.services.user.model.User;

public interface UserRepository extends MongoRepository<User, String> {
    User findByEmail(String email);

}
