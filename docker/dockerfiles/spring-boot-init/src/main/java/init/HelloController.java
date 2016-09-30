package init;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * Created by zhongwei on 16/9/8.
 */
@RestController
public class HelloController {

    @RequestMapping("/")
    public String index() {
        return "Hello World";
    }

}
