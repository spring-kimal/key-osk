package c.e.d.data;

public class Item_ing {
	int itemId;
	int ingId;
	int UnitQuant;
	public Item_ing() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Item_ing(int itemId, int ingId, int unitQuant) {
		super();
		this.itemId = itemId;
		this.ingId = ingId;
		UnitQuant = unitQuant;
	}
	public int getItemId() {
		return itemId;
	}
	public void setItemId(int itemId) {
		this.itemId = itemId;
	}
	public int getIngId() {
		return ingId;
	}
	public void setIngId(int ingId) {
		this.ingId = ingId;
	}
	public int getUnitQuant() {
		return UnitQuant;
	}
	public void setUnitQuant(int unitQuant) {
		UnitQuant = unitQuant;
	}
	
	
}
