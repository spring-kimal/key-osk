package c.e.d.data;


public class Item {
	
	int itemId;
	String itemName;
	int itemPrice;
	int catId;
	String itemImg;
	int visible;
	int itemSequence;

	public Item(int itemId, String itemName, int itemPrice, int catId, String itemImg, int visible, int itemSequence) {
		super();
		this.itemId = itemId;
		this.itemName = itemName;
		this.itemPrice = itemPrice;
		this.catId = catId;
		this.itemImg = itemImg;
		this.visible = visible;
		this.itemSequence = itemSequence;
	}

	public int getItemId() {
		return itemId;
	}

	public void setItemId(int itemId) {
		this.itemId = itemId;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public int getItemPrice() {
		return itemPrice;
	}

	public void setItemPrice(int itemPrice) {
		this.itemPrice = itemPrice;
	}

	public int getCatId() {
		return catId;
	}

	public void setCatId(int catId) {
		this.catId = catId;
	}

	public String getItemImg() {
		return itemImg;
	}

	public void setItemImg(String itemImg) {
		this.itemImg = itemImg;
	}

	public int getVisible() {
		return visible;
	}

	public void setVisible(int visible) {
		this.visible = visible;
	}

	public int getItemSequence() {
		return itemSequence;
	}

	public void setItemSequence(int itemSequence) {
		this.itemSequence = itemSequence;
	}

	public Item() {
		super();
		// TODO Auto-generated constructor stub
	}
}
