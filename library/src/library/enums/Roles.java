package library.enums;

public enum Roles {
	
	ADMIN	(1),
	USER	(2),
	DONOR	(3);
	
	private int id;
	
	Roles(int id) {
		this.id = id;
	}
	
	public int id() {
		return id;
	}
}
