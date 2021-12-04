package c.e.d.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import c.e.d.mapper.ItemMapper;
import c.e.d.mapper.OrderOptionMapper;

@Controller
public class WebController {
	@Autowired
	public ItemMapper itemMapper;
	public OrderOptionMapper orderOptionMapper;	
	
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
	
	@PostMapping("/pay")
	public String pay() {
		System.out.print("gd");
		return "itemView";
	}
	
	@GetMapping("maechool")
	public String maechool() {
		return "maechool";
	}
	
	@GetMapping("/denied")
	public String denied() {
		return "denied";
	}
	
	@GetMapping("/itemView")
	public String itemView(Model model) {
		model.addAttribute("items", itemMapper.findAll());
		return "itemView";
	}
}
