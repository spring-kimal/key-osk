package c.e.d.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;

import c.e.d.data.ItemOrder;
import c.e.d.data.Order;

@Mapper
public interface OrderMapper {
	
	public void saveOrd(Order order);

	public void saveItemOrder(ItemOrder itemOrder);

	@Insert("Insert into order_option(itemOrderId, optId) values(#{itemOrderId}, #{optId} )")
	public void saveOrderOption(@Param("itemOrderId")int itemOrderId,@Param("optId") int optId);
	
	@Update("Update item_order Set orderPrice = #{orderPrice} where itemOrderId= #{itemOrderId}   ")
	public void updateOrderPrice(@Param("orderPrice") int orderPrice, @Param("itemOrderId") int itemOrderId);
	
	@Update("Update `order` Set totalPrice = #{priceTotal } where ordNumber= #{ordNumber}   ")
	public void updatePriceTotal(@Param("priceTotal")int priceTotal,@Param("ordNumber") int ordNumber);
	
}
