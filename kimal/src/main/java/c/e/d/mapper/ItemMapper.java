package c.e.d.mapper;

import java.util.List;
import java.util.Optional;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import c.e.d.data.Item;

@Mapper
public interface ItemMapper {
	@Select("select * from item")
	public List<Item> findAll();
	
	@Select("select * from item order by itemSequence")
	public List<Item> findAlldesc();
	
	@Select("select * from item where itemId=#{itemId}")
	public Optional<Item> findById(@Param("itemId") int itemId);
	
	public void save(Item item);
	
	public void update(Item item);



	
	

}
