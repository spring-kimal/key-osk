package c.e.d.data;

public class OrderOption {
	int optId;
	int itemOrderId;
	public int getOptId() {
		return optId;
	}
	public void setOptId(int optId) {
		this.optId = optId;
	}
	public int getItemOrderId() {
		return itemOrderId;
	}
	public void setItemOrderId(int itemOrderId) {
		this.itemOrderId = itemOrderId;
	}
	
	public OrderOption(int optId, int itemOrderId) {
		super();
		this.optId = optId;
		this.itemOrderId = itemOrderId;
	}

	
	
	
}
