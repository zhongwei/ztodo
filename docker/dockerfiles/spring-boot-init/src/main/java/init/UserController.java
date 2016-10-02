package init;

import init.jpa.UserRepository;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * Created by zhongwei on 16/9/8.
 */
@RestController
@RequestMapping("/api/v0.1.0/")
public class UserController {
    private final UserRepository userRepository;

    public UserController(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @RequestMapping("/users")
    public String users() {
        userRepository.findAll();
    }

}
