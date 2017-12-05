package library.enums;

public enum BookStatus {
	PENDING 	(1),
	AVAILABLE 	(2),
	DELETED 	(3),
	RESERVED 	(4),
	BORROWED 	(5);
	
	private int id;
	
	private BookStatus(int id) {
		this.id = id;
	}
	
	public int id() {
		return id;
	}
}
