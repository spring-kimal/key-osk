package c.e.d.controller;

import java.io.File;

import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import c.e.d.data.Category;
import c.e.d.data.Ing;
import c.e.d.data.Item;
import c.e.d.data.Option;
import c.e.d.data.Option_class;
import c.e.d.data.OrderOption;
import c.e.d.mapper.CatMapper;
import c.e.d.mapper.IngMapper;
import c.e.d.mapper.ItemMapper;
import c.e.d.mapper.OptionMapper;
import c.e.d.mapper.Option_classMapper;
import c.e.d.mapper.OrderOptionMapper;

@RestController
@RequestMapping("/api")
public class Api {
	
	@Autowired
	public ItemMapper itemMapper;
	@Autowired
	public OrderOptionMapper orderOptionMapper;
	@Autowired
	public IngMapper ingMapper;
	@Autowired
	public CatMapper catMapper;
	@Autowired
	public OptionMapper optionMapper;
	@Autowired
	public Option_classMapper option_classMapper;
	
	
	@PostMapping("/itemAdd")
	public boolean itemAdd(@RequestParam("img") MultipartFile img,
						@RequestParam("itemId") int itemId,
						@RequestParam("itemName") String itemName,
						@RequestParam("itemSequence") int itemSequence,
						@RequestParam("itemPrice") int itemPrice,
						@RequestParam("catId") int catId,
						HttpServletRequest req) {
		if(itemMapper.findById(itemId).isPresent()) {
			return false;
		}
		
		
		String fileName = img.getOriginalFilename();
		String safeFile = req.getSession().getServletContext().getRealPath("/") + + System.currentTimeMillis() + fileName;
		System.out.println(safeFile);
		try {
			img.transferTo(new File(safeFile));
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		int visible = 1;
		itemMapper.save(new Item(itemId,itemName,itemPrice,catId,safeFile,visible,itemSequence));
		
		return true;
	}
	
	@PostMapping("/order")
	public void order(@RequestParam("optionlist") List<OrderOption> optionList) {
		for(int i=0;i<optionList.size();i++) {
			for(int j=0;j<optionList.get(i).getOptionId().length;j++) {
				int itemId = optionList.get(i).getItemOrderId();
				int optionId = optionList.get(i).getOptionId()[j];
				orderOptionMapper.save(itemId,optionId);
			}
		}
		
		
	}
	
	@PostMapping("/ingAdd")
	public boolean ingAdd(@RequestBody Ing ingredient) {
		System.out.println(ingredient.getIngName());
		Optional<Ing> search = ingMapper.findById(ingredient.getIngId());
		if(search.isEmpty()) {
			ingMapper.save(ingredient);
			return true;
		}
		return false;
	}
	
	@PostMapping("/catAdd")
	public boolean catAdd(@RequestBody Category cat) {
		Optional<Category> search = catMapper.findById(cat.getCatId());
		System.out.println(cat.getCatName());
		if(search.isEmpty()) {
			catMapper.save(cat);
			return true;
		}
		return false;
	}
	
	@PostMapping("/optAdd")
	public boolean optAdd(@RequestBody Option opt) {
		Optional<Option> search = optionMapper.findById(opt.getOptId());
		if(search.isEmpty()) {
			optionMapper.save(opt);
			return true;
		}
		return false;
	}
	
	@PostMapping("/opclAdd")
	public boolean opclAdd(@RequestBody Option_class opcl) {
		System.out.println(opcl.getOpclId());
		Optional<Option_class> search = option_classMapper.findById(opcl.getOpclId());
		if(search.isEmpty()) {
			option_classMapper.save(opcl);
			return true;
		}
		return false;
	}
	
}
