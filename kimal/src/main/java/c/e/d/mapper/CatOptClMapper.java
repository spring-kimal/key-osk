package c.e.d.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import c.e.d.data.CatOptcl;

@Mapper
public interface CatOptClMapper {
	@Select("Select * from cat_OptCl")
	public List<CatOptcl> findAll();
	
	@Select("Select * from cat_OptCl where catId = #{catId}")
	public List<CatOptcl> findByCatId(@Param ("catId") Integer catId);
	
}
