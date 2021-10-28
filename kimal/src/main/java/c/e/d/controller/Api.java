package c.e.d.controller;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import c.e.d.data.Item;

@RestController
@RequestMapping("/api")
public class Api {
	
	@PostMapping("/itemAdd")
	public void itemAdd(@RequestBody Item item) {
		
		System.out.println(item.getItemName());
	}
}
