package c.e.d.data;

public class Order {
	int ordNumber;
	int totalPrice;
	
	
	
	public Order( int totalPrice) {
		super();
		this.totalPrice = totalPrice;
	}

	public Order() {
		// TODO Auto-generated constructor stub
	}

	public int getOrdNumber() {
		return ordNumber;
	}
	public void setOrdNumber(int ordNumber) {
		this.ordNumber = ordNumber;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}

}
