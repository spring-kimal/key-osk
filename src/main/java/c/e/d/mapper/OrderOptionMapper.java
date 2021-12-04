package c.e.d.mapper;

import java.util.List;
import java.util.Optional;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import c.e.d.data.OrderOption;

@Mapper
public interface OrderOptionMapper {
	
	@Select("select * from order_option")
	public List<OrderOption> findAll();
	
	@Select("select * from order_option where optId=#{optid} and itemOrderId = #{itemOrderId}")
	public Optional<OrderOption> findById(@Param("optid") int optid, @Param("itemOrderId") int itemOrderId);
	
	@Insert("Insert into order_option values (#{optid}, #{itemOrderId})")
	public void save(@Param("optid") int optid, @Param("itemOrderId") int itemOrderId);

}
