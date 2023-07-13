package vmware.services.user.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import vmware.services.user.model.User;
import vmware.services.user.repository.UserRepository;

import java.util.Optional;

@RestController
public class UserController {

	private static final Logger LOGGER = LoggerFactory.getLogger(UserController.class);

	@Autowired
	UserRepository repository;

	@PostMapping
	public User add(@RequestBody User user) {
		LOGGER.info("User add: {}", user);
		return repository.save(user);
	}

	@GetMapping
	public Iterable<User> findAll() {
		LOGGER.info("User find");
		return repository.findAll();
	}

	@GetMapping("/{id}")
	public User findById(@PathVariable("id") String id) {
		LOGGER.info("User find: id={}", id);
		return repository.findById(id).get();
	}

}
