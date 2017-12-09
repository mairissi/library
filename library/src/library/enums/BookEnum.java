package library.enums;

public enum BookEnum {
    ISBN("ISBN"),
    CODE("CODE"),
    TITLE("TITLE"),
    AUTHOR("AUTHOR"),
    PUBLISHER("PUBLISHER"),
    DESCRIPTION("DESCRIPTION"),
    IMG_URL("IMG_URL"),
    STATUS_ID("STATUS_ID"),
	CPF("CPF");
	
	private String header;
	
	BookEnum(String header){
		this.header = header;
	}
	
	public String header() {
		return header;
	}
}
