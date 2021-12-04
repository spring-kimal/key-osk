package c.e.d.data;


public class CatOptcl {
	int catId;
	int opclId;
	
	public CatOptcl(int catId, int opclId) {
		super();
		this.catId = catId;
		this.opclId = opclId;
	}

	CatOptcl(){
		super();
	}

	public int getCatId() {
		return catId;
	}

	public void setCatId(int catId) {
		this.catId = catId;
	}

	public int getOpclId() {
		return opclId;
	}

	public void setOpclId(int opclId) {
		this.opclId = opclId;
	}
}
