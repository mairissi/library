package library.enums;

public enum BookEnum {
	ISBN(1),
	TITLE(2),
	AUTHOR(3),
	PUBLISHER(4),
	QUANTITY(5),
	DESCRIPTION(6),
	IMG_URL(7);
	
	private int index;
	
	BookEnum(int index){
		this.index = index;
	}
	
	public int index() {
		return index;
	}
}
