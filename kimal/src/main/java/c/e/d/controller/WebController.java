package c.e.d.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import c.e.d.data.Category;
import c.e.d.data.Option_class;
import c.e.d.mapper.CatMapper;
import c.e.d.mapper.ItemMapper;
import c.e.d.mapper.Option_classMapper;
import c.e.d.mapper.OrderOptionMapper;

@Controller
public class WebController {

	@Autowired
	public ItemMapper itemMapper;
	@Autowired
	public OrderOptionMapper orderOptionMapper;
	@Autowired
	public Option_classMapper option_classMapper;
	@Autowired
	public CatMapper catMapper;
	
	@GetMapping("/")
	public String main3() {
		return "main";
	}
	
	@GetMapping("/searchAll")
	public String searchAll(Model model) {
		model.addAttribute("items",itemMapper.findAll());
		return "searchAll";
	}
	
	@GetMapping("/itemUpdate")
	public String management() {
		return "itemUpdate";
	}
	
	@GetMapping("/itemAdd")
	public String itemAdd(Model model) {
		List<Category> search = catMapper.findAll();
		model.addAttribute("cats", search);
		return "itemAdd";
	}
	@GetMapping("/optAdd")
	public String optAdd(Model model) {
		List<Option_class> search = option_classMapper.findAll();
		model.addAttribute("opcls", search);
		
		return "optAdd";
	}
	@GetMapping("/catAdd")
	public String catAdd() {
		return "catAdd";
	}
	@GetMapping("/ingAdd")
	public String ingAdd() {
		return "ingAdd";
	}
	
	
	@GetMapping("pay")
	public String pay() {
		return "pay";
	}
	
	@GetMapping("maechool")
	public String maechool() {
		return "maechool";
	}
	
	@GetMapping("/denied")
	public String denied() {
		return "denied";
	}
}
