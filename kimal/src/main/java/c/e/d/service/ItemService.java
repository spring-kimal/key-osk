package c.e.d.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import c.e.d.data.Item;
import c.e.d.mapper.ItemMapper;

@Service
public class ItemService {
	@Autowired
	public ItemMapper itemMapper;
	
	public void saveItem(Item item) {
		itemMapper.save(item);
	}
}
