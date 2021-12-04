package c.e.d.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.apache.catalina.filters.ExpiresFilter.XServletOutputStream;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import c.e.d.data.CatOptcl;
import c.e.d.data.Item;
import c.e.d.data.Option;
import c.e.d.data.OrderOption;
import c.e.d.data.Cart;
import c.e.d.mapper.CatOptClMapper;
import c.e.d.mapper.ItemMapper;
import c.e.d.mapper.OptionMapper;
import c.e.d.mapper.OrderOptionMapper;

@RestController
@RequestMapping("/api")
public class Api {

	@Autowired
	public ItemMapper itemMapper;
	public OrderOptionMapper orderOptionMapper;
	@Autowired
	public CatOptClMapper catOptClMapper;
	@Autowired
	public OptionMapper optionMapper;

	@PostMapping("/itemAdd")
	public void itemAdd(@RequestParam("img") MultipartFile img, @RequestParam("itemId") int itemId,
			@RequestParam("itemName") String itemName, @RequestParam("itemQuantity") int itemQuantity,
			@RequestParam("itemPrice") int itemPrice, @RequestParam("category") int category, HttpServletRequest req) {

		String fileName = img.getOriginalFilename();
		String safeFile = req.getSession().getServletContext().getRealPath("/") + +System.currentTimeMillis()
				+ fileName;
		System.out.println(safeFile);
		try {
			img.transferTo(new File(safeFile));

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return;
	}

	@PostMapping("/order")
	public void order(@RequestParam("optionlist") List<OrderOption> optionList) {
		for (int i = 0; i < optionList.size(); i++) {
			for (int j = 0; j < optionList.get(i).getOptionId().length; j++) {
				int itemId = optionList.get(i).getItemOrderId();
				int optionId = optionList.get(i).getOptionId()[j];
				orderOptionMapper.save(itemId, optionId);
			}
		}
	}

	@GetMapping("/itemView/{cat}")
	public List<Item> itemView(@PathVariable("cat") String cat, Model model) {
		int catId;
		List<Item> items;
		System.out.println(cat);
		switch (cat) {
		case "coffee": catId = 1; break;
		case "smoothie": catId = 2; break;
		case "tea": catId = 3; break;
		default: catId = 0; break;
		}
		
		if (catId ==0) {
			items = itemMapper.findAll();
		} else {
			items = itemMapper.findBycatId(catId);
		}
		
		return items;
	}
	
	@GetMapping("/itemView/option/{itemId}")
	public List<List<Option>> optView(@PathVariable("itemId")Integer itemId){		
//		System.out.println(itemId);
		List<List<Option>> viewOption = new ArrayList<List<Option>>();
		
		//itemId로 카테고리 아이디 검색 후 변수 저장
		Optional<Item> item = itemMapper.findByitemId(itemId);		
//		System.out.println(item.get().getCatId());
		int catId = item.get().getCatId();
		
		//카테고리 아이디로 카테고리 별 옵션 조회
		List<CatOptcl> optList = catOptClMapper.findByCatId(catId);				
//		System.out.println( optList.size() );
	
		//옵션마다 세부옵션 조회 후 List<Option>에 집어넣은 후 
		//List<List<Option>>에 집어넣음 (옵션 갯수만큼 반복)
		for (int i = 0; i < optList.size() ; i++) {
			int temp = optList.get(i).getOpclId();
			//System.out.print(temp+" ");
			List<Option> optDetail = optionMapper.findByOpclId(temp);
			viewOption.add(optDetail);		
		}
		
//		for (int i = 0; i < viewOption.size(); i++) {		
////			System.out.println(viewOption.get(i).get(i).getOpclId()+ "옵션 이름");
//			for (int j = 0; j < viewOption.get(i).size(); j++) {
//				System.out.print(viewOption.get(i).get(j).getOptName() + " ");	
//			}
//		}
		
//		for (int i = 0; i < optDetail.size() ; i++) {		
//			System.out.print(optDetail.get(i).getOptName());	
//		}	
//		System.out.println(optDetail.size() +"개");
//		optList.get(catId);
		
		return viewOption; 						
	}
	
	@PostMapping("/pay")
	public Cart addCart(@RequestBody Cart[] cart) {
		
		System.out.println( cart[0].getItem().getItemName()  );
		System.out.println(cart[0].getOption().get(0).getOptName());
		
		
		
		return null;
	}
	
	

}
