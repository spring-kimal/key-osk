package c.e.d.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import c.e.d.data.Option;

@Mapper
public interface OptionMapper {
	@Select("Select * from option where opclid =#{opclid} order by optPrice")
	public List<Option> findByOpclId(@Param("opclid") Integer opclid );

}
