package c.e.d.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class WebController {
	
	
	@GetMapping("/")
	public String main3() {
		return "main";
	}
	
	@GetMapping("/searchAll")
	public String searchAll() {
		return "searchAll";
	}
	
	@GetMapping("/itemUpdate")
	public String management() {
		return "itemUpdate";
	}
	
	@GetMapping("/itemAdd")
	public String itemAdd() {
		return "itemAdd";
	}
	
	@GetMapping("pay")
	public String pay() {
		return "pay";
	}
	
	@GetMapping("maechool")
	public String maechool() {
		return "maechool";
	}
}
