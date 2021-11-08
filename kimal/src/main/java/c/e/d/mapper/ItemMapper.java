package c.e.d.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import c.e.d.data.Item;

@Mapper
public interface ItemMapper {
	@Select("select * from item")
	public List<Item> findAll();
	
	@Select("select * from item where itemId=#{itemId}")
	public List<Item> findById(@Param("itemId") String itemId);
	
	public void save(Item item);
	
	

}
