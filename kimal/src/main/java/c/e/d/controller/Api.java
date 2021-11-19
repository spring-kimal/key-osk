package c.e.d.controller;

import java.io.File;
import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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
						@RequestParam("category") int category,
						HttpServletRequest req) {
		
		String fileName = img.getOriginalFilename();
		String safeFile = req.getSession().getServletContext().getRealPath("/") + + System.currentTimeMillis() + fileName;
		System.out.println(safeFile);
		try {
			img.transferTo(new File(safeFile));
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return;
	}
}
