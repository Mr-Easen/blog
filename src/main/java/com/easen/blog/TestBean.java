package com.easen.blog;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("testBean")
public class TestBean {
    @RequestMapping("/test")
    public String test() {
        return "index";
    }
}
