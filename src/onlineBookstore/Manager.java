package onlineBookstore;

public class Manager {
	
	private int managerNo; //�Ŵ��� �����ȣ
	private String managerName; //�Ŵ��� ����
	private String managerId; //�Ŵ��� ���̵�
	private String managerPw; //�Ŵ��� ���
	private int years; //�ٹ�����
	
	public Manager() {
		
	}
	public Manager(int managerNo, String managerName, String managerId, String managerPw, int years) {
		this.managerNo = managerNo;
		this.managerName = managerName;
		this.managerId = managerId;
		this.managerPw = managerPw;
		this.years = years;
	}
	public void output() {
		System.out.print(" * �Ŵ��� ���� : " + managerName);
	}
	public int getManagerNo() {
		return managerNo;
	}
	public void setManagerNo(int managerNo) {
		this.managerNo = managerNo;
	}
	public String getManagerName() {
		return managerName;
	}
	public void setManagerName(String managerName) {
		this.managerName = managerName;
	}
	public String getManagerId() {
		return managerId;
	}
	public void setManagerId(String managerId) {
		this.managerId = managerId;
	}
	public String getManagerPw() {
		return managerPw;
	}
	public void setManagerPw(String managerPw) {
		this.managerPw = managerPw;
	}
	public int getYears() {
		return years;
	}
	public void setYears(int years) {
		this.years = years;
	}
}
