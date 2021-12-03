package c.e.d.data;

public class Ing {
	int ingId;
	String ingName;
	String ingUnit;
	int ingQuantity;
	
	
	public Ing() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Ing(int ingId, String ingName, String ingUnit, int ingQuantity) {
		super();
		this.ingId = ingId;
		this.ingName = ingName;
		this.ingUnit = ingUnit;
		this.ingQuantity = ingQuantity;
	}

	public int getIngId() {
		return ingId;
	}
	public void setIngId(int ingId) {
		this.ingId = ingId;
	}
	public String getIngName() {
		return ingName;
	}
	public void setIngName(String ingName) {
		this.ingName = ingName;
	}
	public String getIngUnit() {
		return ingUnit;
	}
	public void setIngUnit(String ingUnit) {
		this.ingUnit = ingUnit;
	}
	public int getIngQuantity() {
		return ingQuantity;
	}
	public void setIngQuantity(int ingQuantity) {
		this.ingQuantity = ingQuantity;
	}
}
