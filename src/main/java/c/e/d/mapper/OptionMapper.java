package c.e.d.mapper;

import java.util.List;
import java.util.Optional;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import c.e.d.data.Option;

@Mapper
public interface OptionMapper {
	
	@Select("select * from option")
	public List<Option> findAll();
	
	@Select("select * from option where optId=#{optid}")
	public Optional<Option> findById(@Param("optid") int optid);
	
	@Insert("Insert into option values (#{opt.optId}, #{opt.opclId}, #{opt.optName}, #{opt.optPrice})")
	public void save(@Param("opt") Option opt);
	
	@Select("Select * from option where opclid =#{opclid} order by optPrice")
	public List<Option> findByOpclId(@Param("opclid") Integer opclid );
}
