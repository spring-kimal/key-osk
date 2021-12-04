package c.e.d.mapper;

import java.util.List;
import java.util.Optional;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface Item_ingMapper {
	
	@Select("selecet * from item_ing")
	public List<Item_ingMapper> findAll();
	
	@Select("selecet * from item_ing where itemId=#{itemId} nad ingId=#{ingId}")
	public Optional<Item_ingMapper> findById(@Param("itemId") int itemId, @Param("ingId") int ingId);
	
	@Insert("insert into item_ing values(#{itemId},#{ingId})")
	public void save(@Param("itemId") int itemId, @Param("ingId") int ingId);
}
