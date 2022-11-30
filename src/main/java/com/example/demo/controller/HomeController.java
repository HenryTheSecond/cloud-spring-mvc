package com.example.demo.controller;

import java.util.HashMap;
import java.util.Map;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class HomeController {
  @RequestMapping("home")
  public String index() {
    return "index";
  }
  
  @RequestMapping("api/translate")
  @ResponseBody
  public Map<String, String> translate(@RequestBody Map<String, String> body) {
    System.out.println(body.get("source"));
    Map<String, String> result = new HashMap<String, String>();
    result.put("destination", "translated");
    return result;
  }
}
