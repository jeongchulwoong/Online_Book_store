package onlineBookstore;

import java.sql.ResultSet;

public class Book {
	
	private int bookNo; //책 일련번호
	private Long ISBN; //책 ISBN
	private String author; //책 저자
	private String title; //책 제목
	private int salesAmount; //판매량
	private int stock; //재고
	private String genre; //장르
	private int price; //가격
	private int discount; //할인율
	private String publisher; //출판사
	
	
	public Book() {
	}
	
	//책 객체 생성: 책 등록
	public Book(Long ISBN, String author, String title, int salesAmount, int stock, String genre, int price, int discount, String publisher) {
		this.ISBN = ISBN; this.author = author; this.title = title; this.salesAmount = salesAmount;
		this.stock = stock; this.genre = genre; this.price = price; this.discount = discount; this.publisher = publisher;
		
		setBnoForEnrol(); //등록시 책 번호를 자동으로 생성시켜줌
	}
	
	//책 객체 생성
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
	
	//책 번호를 자동으로 생성시키는 메소드
	public void setBnoForEnrol() {
		ResultSet rs = DB.getAllBooksRS();
		this.bookNo = DB.getNextSerial(rs);
	}
	
	
	public void output() {
		System.out.print(" * 책의 일련번호 : " + bookNo);
	}


	/* -----------getter, setter 메소드----------- */
	
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
