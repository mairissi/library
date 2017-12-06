package library.model;

public class BlockedUser {
	private String cpf;
	private String blockReason;
	private long blockDate;
	
	public String getCpf() {
		return cpf;
	}
	
	public void setCpf(String cpf) {
		this.cpf = cpf;
	}
	
	public String getBlockReason() {
		return blockReason;
	}
	
	public void setBlockReason(String blockReason) {
		this.blockReason = blockReason;
	}
	
	public long getBlockDate() {
		return blockDate;
	}

	public void setBlockDate(long blockDate) {
		this.blockDate = blockDate;
	}
}
