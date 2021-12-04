package c.e.d.mapper;

import java.util.List;
import java.util.Optional;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import c.e.d.data.Option_class;

@Mapper
public interface Option_classMapper {
	
	@Select("select * from option_class ")
	public List<Option_class> findAll();
	
	@Select("select * from option_class where opclId=#{opclId}")
	public Optional<Option_class> findById(@Param("opclId") int opclId);
	
	@Insert("Insert into option_class  values (#{opcl.opclId}, #{opcl.opclName})")
	public void save(@Param("opcl") Option_class opcl);
}
