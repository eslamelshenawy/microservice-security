package vmware.services.gateway.repository;

import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;
import vmware.services.gateway.entity.User;

import java.util.Optional;
@Repository
public interface UserRepository extends MongoRepository<User,Long> {
    Optional<User> findByName(String username);
    User findFirstByEmail(String email);
    Optional<User> findByEmail(String email);

}
