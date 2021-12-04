package c.e.d.data;

public class Option {
	int optId;
	int opclId;
	String optName;
	int optPrice;
	
	
	
	
	public Option() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Option(int optId, int opclId, String optName, int optPrice) {
		super();
		this.optId = optId;
		this.opclId = opclId;
		this.optName = optName;
		this.optPrice = optPrice;
	}
	public int getOptId() {
		return optId;
	}
	public void setOptId(int optId) {
		this.optId = optId;
	}
	public int getOpclId() {
		return opclId;
	}
	public void setOpclId(int opclId) {
		this.opclId = opclId;
	}
	public String getOptName() {
		return optName;
	}
	public void setOptName(String optName) {
		this.optName = optName;
	}
	public int getOptPrice() {
		return optPrice;
	}
	public void setOptPrice(int optPrice) {
		this.optPrice = optPrice;
	}
}
	
