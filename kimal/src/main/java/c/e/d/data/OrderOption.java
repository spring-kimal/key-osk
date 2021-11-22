package c.e.d.data;

public class OrderOption {
	int[] optionId;
	int itemOrderId;
	public OrderOption() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int[] getOptionId() {
		return optionId;
	}
	public void setOptionId(int[] optionId) {
		this.optionId = optionId;
	}
	public int getItemOrderId() {
		return itemOrderId;
	}
	public void setItemOrderId(int itemOrderId) {
		this.itemOrderId = itemOrderId;
	}
	public OrderOption(int[] optionId, int itemOrderId) {
		super();
		this.optionId = optionId;
		this.itemOrderId = itemOrderId;
	}
}
