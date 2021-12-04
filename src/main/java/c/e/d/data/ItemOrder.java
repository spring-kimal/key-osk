package c.e.d.data;

public class ItemOrder {
	int itemOrderId;
	int orderPrice;
	int itemQuantity;
	int itemId;
	int ordNumber;
	
	
	
	public ItemOrder(int itemQuantity, int itemId, int ordNumber) {
		super();
		this.itemQuantity = itemQuantity;
		this.itemId = itemId;
		this.ordNumber = ordNumber;
	}
	
	public int getItemOrderId() {
		return itemOrderId;
	}
	public void setItemOrderId(int itemOrderId) {
		this.itemOrderId = itemOrderId;
	}
	public int getOrderPrice() {
		return orderPrice;
	}
	public void setOrderPrice(int orderPrice) {
		this.orderPrice = orderPrice;
	}
	public int getItemQuantity() {
		return itemQuantity;
	}
	public void setItemQuantity(int itemQuantity) {
		this.itemQuantity = itemQuantity;
	}
	public int getItemId() {
		return itemId;
	}
	public void setItemId(int itemId) {
		this.itemId = itemId;
	}
	public int getOrdNumber() {
		return ordNumber;
	}
	public void setOrdNumber(int ordNumber) {
		this.ordNumber = ordNumber;
	}
	

}
