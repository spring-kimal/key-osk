package c.e.d.controller;

import java.io.IOException;
import java.util.Map;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import c.e.d.data.Item;

@RestController
@RequestMapping("/api")
public class Api {
	
	@PostMapping("/itemAdd")
	public void itemAdd(@RequestParam("img") MultipartFile img,
						@RequestParam("itemId") int itemId,
						@RequestParam("itemName") String itemName,
						@RequestParam("itemQuantity") int itemQuantity,
						@RequestParam("itemPrice") int itemPrice,
						@RequestParam("category") int category) {
		
		try {
//			new Item(itemId,itemName,itemQuantity,itemPrice,category,img.getBytes());
			System.out.println(img.getOriginalFilename());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
