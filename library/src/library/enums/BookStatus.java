package library.enums;

public enum BookStatus {
	NOT_FOUND	(0),
	PENDING 	(1),
	AVAILABLE 	(2),
	DELETED 	(3),
	RESERVED 	(4),
	BORROWED 	(5);
	
	private int id;
	
	BookStatus(int id) {
		this.id = id;
	}
	
	public int id() {
		return id;
	}
}
