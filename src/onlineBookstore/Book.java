package onlineBookstore;

import java.sql.ResultSet;

public class Book {
	
	private int bookNo; //å �Ϸù�ȣ
	private Long ISBN; //å ISBN
	private String author; //å ����
	private String title; //å ����
	private int salesAmount; //�Ǹŷ�
	private int stock; //���
	private String genre; //�帣
	private int price; //����
	private int discount; //������
	private String publisher; //���ǻ�
	
	
	public Book() {
	}
	
	//å ��ü ����: å ���
	public Book(Long ISBN, String author, String title, int salesAmount, int stock, String genre, int price, int discount, String publisher) {
		this.ISBN = ISBN; this.author = author; this.title = title; this.salesAmount = salesAmount;
		this.stock = stock; this.genre = genre; this.price = price; this.discount = discount; this.publisher = publisher;
		
		setBnoForEnrol(); //��Ͻ� å ��ȣ�� �ڵ����� ����������
	}
	
	//å ��ü ����
	public Book(int bookNo, Long ISBN, String author, String title, int salesAmount, int stock, String genre, int price, int discount, String publisher) {
		this.bookNo = bookNo;
		this.ISBN = ISBN;
		this.author = author;
		this.title = title;
		this.salesAmount = salesAmount;
		this.stock = stock;
		this.genre = genre;
		this.price = price;
		this.discount = discount;
		this.publisher = publisher;
	}
	
	//å ��ȣ�� �ڵ����� ������Ű�� �޼ҵ�
	public void setBnoForEnrol() {
		ResultSet rs = DB.getAllBooksRS();
		this.bookNo = DB.getNextSerial(rs);
	}
	
	
	public void output() {
		System.out.print(" * å�� �Ϸù�ȣ : " + bookNo);
	}


	/* -----------getter, setter �޼ҵ�----------- */
	
	public int getBookNo() {
		return bookNo;
	}

	public void setBookNo(int bookNo) {
		this.bookNo = bookNo;
	}

	public Long getISBN() {
		return ISBN;
	}

	public void setISBN(Long iSBN) {
		ISBN = iSBN;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getSalesAmount() {
		return salesAmount;
	}

	public void setSalesAmount(int salesAmount) {
		this.salesAmount = salesAmount;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public String getGenre() {
		return genre;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getDiscount() {
		return discount;
	}

	public void setDiscount(int discount) {
		this.discount = discount;
	}

	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	
}
