package c.e.d.mapper;

import java.util.List;
import java.util.Optional;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import c.e.d.data.Ing;

@Mapper
public interface IngMapper {
	
	@Select("select * from ingredient")
	public List<Ing> findAll();
	
	@Select("select * from ingredient where ingId = #{ingId}")
	public Optional<Ing> findById(@Param("ingId") int ingId);
	
	@Insert("insert into ingredient values(#{ing.ingId}, #{ing.ingName}, #{ing.ingUnit}, #{ing.ingQuantity})")
	public void save(@Param("ing") Ing ing);

}
