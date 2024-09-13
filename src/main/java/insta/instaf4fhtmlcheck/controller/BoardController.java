package insta.instaf4fhtmlcheck.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import java.sql.Timestamp;

@Controller
public class BoardController {

    @GetMapping("/")
    public String index(){
        System.out.println("접속 : "+new Timestamp(System.currentTimeMillis()));
        return "index";
    }
}
