package c.e.d.data;

public class Category {
	int catId;
	String catName;
	
	
	public Category() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Category(int catId, String catName) {
		super();
		this.catId = catId;
		this.catName = catName;
	}
	public int getCatId() {
		return catId;
	}
	public void setCatId(int catId) {
		this.catId = catId;
	}
	public String getCatName() {
		return catName;
	}
	public void setCatName(String catName) {
		this.catName = catName;
	}
}
