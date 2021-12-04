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
	
	@Select("select * from item where itemId=#{itemId}")
	public Optional<Item> findByitemId(@Param("itemId") Integer itemId);
//	
	@Select("select * from item where catId=#{catId}")
	public List<Item> findBycatId(@Param("catId") Integer catId);
	
	@Select("SELECT * FROM item INNER JOIN category ON item.catId = category.catId WHERE itemid =#{itemId}")
	public Optional<Item> findItemCat(@Param("itemId") Integer itemId);
	
	
	//SELECT * FROM item INNER JOIN category ON item.catId = category.catId WHERE itemid = 1;	
	
	
	public void save(Item item);



	
	

}
