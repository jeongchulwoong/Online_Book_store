package onlineBookstore;

import java.sql.*;
import java.io.IOException;
import java.util.Vector;

// DBŬ���� : MySQL DBMS�� �����ϰ� DB ���̺��� ���� �� �˻��� ���� �޼ҵ� ���� Ŭ����
//

public class DB {
	static Connection con = null;
	
	static String driver;
	public static String dbms;
	static String URL;
	static String database;
	
	static String driverMySQL = "com.mysql.jdbc.Driver";
	static String URLLocalMySQL = "jdbc:mysql://localhost:3306/";
	
	static String URLRemoteMySQL = "jdbc:mysql://203.252.21.54:3306/";
	
	static {
		driver = driverMySQL;
		dbms = "MySQL";
		URL = URLLocalMySQL;
		database = "onlinebookstore";
	}
	
	static boolean DEBUG = false;
	
	static void outputForDebug(String msg) {
		if(DEBUG)
			System.out.println("  << for debug >> " + msg);
	}
	
	public static void setDBMS(String dbmsTo) {
		outputForDebug("in setDBMS(): DBMS = " + dbmsTo);
		
		if(dbmsTo.equals("MySQL")) {
			driver = driverMySQL;
			dbms = "MySQL";
			URL = URLLocalMySQL;
		}
		else if(dbmsTo.equals("Remote MySQL")) {
			driver = driverMySQL;
			dbms = "Remote MySQL";
			URL = URLRemoteMySQL;
		}
		
		loadConnectOnlineBookstore();
	}
	
	//JDBC ����̹� �ε� �� ���� : ���� ������ true, ���н� false ��ȯ
	public static boolean loadConnectOnlineBookstore() {
		return loadConnect("onlinebookstore");
	}
	
	public static boolean loadConnect(String database) {
		try {
			//����̹� �ε�
			Class.forName(driverMySQL);
		} catch(java.lang.ClassNotFoundException e) {
			System.err.println("\n  ??? Driver load error in loadConnect(): " + e.getMessage());
			e.printStackTrace();
		}
		
		try {
			//���� - onlinebookstore �����ͺ��̽��� ����
			con = DriverManager.getConnection(URL + database, "root", "onlyroot");
			outputForDebug("���� ����: " + URL + database + "�� �����");
			return true;
		} catch(SQLException ex) {
			System.err.println("\n  ??? Connection error in loadConnect(): " + ex.getMessage());
			ex.printStackTrace();
		}
		
		return false;
	}
	
	// �α����� ���� �޼ҵ�(������: �ش� ��ü ��ȯ, ���н�: null ��ȯ)
	// �־��� ID, PW�� �� Ž���Ͽ� ��ȯ
	public static Customer getCustomer(String ID, String PW) {
		try {
			String sql = "select * from customer where cid=? and cpw=?;" ;
			outputForDebug("In getCustomer() SQL : " + sql);
			PreparedStatement prStmt = con.prepareStatement(sql);
			
			prStmt.setString(1, ID);
			prStmt.setString(2, PW);
			
			ResultSet rs = prStmt.executeQuery();
			if(rs.next()) {
				Customer customer = getCustomerFromRS(rs);
				return customer;
			}
		} catch(SQLException ex) {
			System.err.println("\n  ??? SQL exec error in getCustomer(): " + ex.getMessage());
		}
		
		return null;
	}
	
	// Customer ��ü�� �� ���̺� customer�� ���÷� �����ϴ� �޼ҵ�
	public static int insertCustomer(Customer customer) {
		int updateCnt = 0;

		try {                      
			// SQL ���ǹ��� �����Ѵ�.
			String sql = "insert into customer values (?, ?, ?, ?, ?);" ;
			outputForDebug("In insertCustomer() : " + sql);
			
			PreparedStatement prStmt = con.prepareStatement(sql);

			prStmt.setString(1, customer.getCid());
			prStmt.setString(2, customer.getCpw());
			prStmt.setString(3, customer.getCname());
			prStmt.setString(4, customer.getCpn());
			prStmt.setDate(5, customer.getDateJoin());

			updateCnt = prStmt.executeUpdate();  		
		} catch( SQLException ex ) {

			System.err.println("\n  ??? SQL exec error in insertCustomer(): " + ex.getMessage() );
		}

		return updateCnt;
	}
	
	// Purchase ��ü�� �߰�
	public static int insertPurchase(Purchase purchase) {
		int updateCnt = 0;
		
		try {
			String sql = "insert into purchase values(?, ?, ?, ?, ?, ?);";
			outputForDebug("In insertPurchase() SQL : " + sql);
			
			PreparedStatement prStmt = con.prepareStatement(sql);
			
			prStmt.setString(1, purchase.getPurchaseNo());
			prStmt.setString(2, purchase.getClientId());
			prStmt.setInt(3, purchase.getBookNo());
			prStmt.setDate(4, purchase.getPurchaseDate());
			prStmt.setInt(5, purchase.getPurchaseNum());
			prStmt.setInt(6, purchase.getPaymentAmount());
			
			updateCnt = prStmt.executeUpdate();
		} catch(SQLException ex) {
			System.err.println("\n  ??? SQL exec error in insertPurchase(): " + ex.getMessage() );
		}
		return updateCnt;
	}
	
	// Cart ��ü�� �߰�
	public static int insertCart(Cart cart) {
		int updateCnt = 0;
		
		try {
			String sql="insert into cart values(?, ?, ?, ?);";
			outputForDebug("In insertCart() : " + sql);
			
			PreparedStatement prStmt = con.prepareStatement(sql);

			prStmt.setString(1, cart.getCartNo());
			prStmt.setString(2, cart.getClientId());
			prStmt.setInt(3, cart.getBookNo());
			prStmt.setInt(4, cart.getSaleAmount());
			
			updateCnt = prStmt.executeUpdate();
		} catch(SQLException ex) {
			System.err.println("\n  ??? SQL exec error in insertCart(): " + ex.getMessage() );
		}
		return updateCnt;
	}
	
	//Review ��ü�� �߰�
	public static int insertReview(Review review) {
		int updateCnt = 0;
		
		try {
			String sql="insert into review values(?, ?, ?, ?);";
			outputForDebug("In insertReview() : " + sql);
			
			PreparedStatement prStmt = con.prepareStatement(sql);

			prStmt.setString(1, review.getReviewNo());
			prStmt.setString(2, review.getPurchaseNo());
			prStmt.setInt(3, review.getBookNo());
			prStmt.setInt(4, review.getStarPoint());
			
			
			updateCnt = prStmt.executeUpdate();
		} catch(SQLException ex) {
			System.err.println("\n  ??? SQL exec error in insertReview(): " + ex.getMessage() );
		}
		return updateCnt;
	}
	
	//Cancel ��ü �߰�
	public static int insertCancel(Cancel cancel) {
		int updateCnt = 0;
		
		try {
			String sql="insert into cancel values(?, ?, ?, ?, ?);";
			outputForDebug("In insertCancel() : " + sql);
			
			PreparedStatement prStmt = con.prepareStatement(sql);

			prStmt.setString(1, cancel.getCancelNo());
			prStmt.setString(2, cancel.getPurchaseNo());
			prStmt.setString(3, cancel.getClientId());
			prStmt.setString(4, cancel.getReason());
			prStmt.setDate(5, cancel.getCancelDate());
			
			
			updateCnt = prStmt.executeUpdate();
		} catch(SQLException ex) {
			System.err.println("\n  ??? SQL exec error in insertCancel(): " + ex.getMessage() );
		}
		return updateCnt;
	}
	
	public static int insertEnroll(Enroll enroll) {
		int updateCnt = 0;
		
		try {
			String sql="insert into enroll values(?, ?, ?, ?);";
			outputForDebug("In insertEnroll() : " + sql);
			
			PreparedStatement prStmt = con.prepareStatement(sql);

			prStmt.setString(1, enroll.getEnrollNo());
			prStmt.setString(2, enroll.getManagerId());
			prStmt.setInt(3, enroll.getBookNo());
			prStmt.setDate(4, enroll.getEnrollDate());
			
			
			updateCnt = prStmt.executeUpdate();
		} catch(SQLException ex) {
			System.err.println("\n  ??? SQL exec error in insertEnroll(): " + ex.getMessage() );
		}
		return updateCnt;
	}
 
	// Cart ��ü ����
	public static int deleteCartByCartNo(String cartNo) {
		int updateCnt=0;
		
		try {
			String sql="delete from cart where CartNo=?;";
			outputForDebug("In deleteCartByCartNo() : " + sql);
			
			PreparedStatement prStmt = con.prepareStatement(sql);

			prStmt.setString(1, cartNo);
			
			updateCnt = prStmt.executeUpdate();
		} catch(SQLException ex) {
			System.err.println("\n  ??? SQL exec error in deleteCartByCartNo(): " + ex.getMessage() );
		}
		
		return updateCnt;
	}
	
	// Purchase ��ü ����
	public static int deletePurchaseByPurchaseNo(String purchaseNo) {
		int updateCnt=0;
		
		try {
			String sql="delete from purchase where purchaseNo=?;";
			outputForDebug("In deletePurchaseByPurchaseNo() : " + sql);
			
			PreparedStatement prStmt = con.prepareStatement(sql);

			prStmt.setString(1, purchaseNo);
			
			updateCnt = prStmt.executeUpdate();
		} catch(SQLException ex) {
			System.err.println("\n  ??? SQL exec error in deletePurchaseByPurchaseNo(): " + ex.getMessage() );
		}
		
		return updateCnt;
	}
	
	//���� �� ��ü�� ������ update�ϴ� �޼ҵ�
	public static int updateCustomer(Customer customer) {
		int updateCnt = 0;
		
		try {
			String sql = "update customer set cpw=?, cname=?, cpn=? where cid=?;";
			outputForDebug("In updateCustomer() : " + sql);
			
			PreparedStatement prStmt = con.prepareStatement(sql);
			
			prStmt.setString(1, customer.getCpw());
			prStmt.setString(2, customer.getCname());
			prStmt.setString(3, customer.getCpn());
			prStmt.setString(4, customer.getCid());
			
			updateCnt = prStmt.executeUpdate();
		} catch(SQLException ex) {
			System.err.println("\n  ??? SQL exec error in updateCustomer(): " + ex.getMessage() );
		}
		
		return updateCnt;
	}
	
	//���� �� ���� ��ü�� �Ǹŷ��� ��� update�ϴ� �޼ҵ�
	public static int updateBookAfterPurchase(int bookNo, int amount) {
		int updateCnt = 0;
		
		try {
			String sql = "update book set salesAmount=salesAmount+?, stock=stock-? where bookNo=?;";
			outputForDebug("In updateBookAfterPurchase() : " + sql);
			
			PreparedStatement prStmt = con.prepareStatement(sql);
			
			prStmt.setInt(1, amount);
			prStmt.setInt(2, amount);
			prStmt.setInt(3, bookNo);
			
			updateCnt = prStmt.executeUpdate();
		} catch(SQLException ex) {
			System.err.println("\n  ??? SQL exec error in updateBookAfterPurchase(): " + ex.getMessage() );
		}
		return updateCnt;
	}
	
	//��� �� ���� ��ü�� �Ǹŷ��� ��� update�ϴ� �޼ҵ�
	public static int updateBookAfterCancel(int bookNo, int amount) {
		int updateCnt = 0;
		
		try {
			String sql = "update book set salesAmount=salesAmount-?, stock=stock+? where bookNo=?;";
			outputForDebug("In updateBookAfterCancel() : " + sql);
			
			PreparedStatement prStmt = con.prepareStatement(sql);
			
			prStmt.setInt(1, amount);
			prStmt.setInt(2, amount);
			prStmt.setInt(3, bookNo);
			
			updateCnt = prStmt.executeUpdate();
		} catch(SQLException ex) {
			System.err.println("\n  ??? SQL exec error in updateBookAfterCancel(): " + ex.getMessage() );
		}
		return updateCnt;
	}
	
	//���� �� ���� update�ϴ� �޼ҵ�
	public static int updateStarPointAfterSetReview(String reviewNo, int starPoint) {
		int updateCnt = 0;
		
		try {
			String sql = "update review set starPoint=? where reviewNo=?;";
			outputForDebug("In updateStarPointAfterSetReview() : " + sql);
			
			PreparedStatement prStmt = con.prepareStatement(sql);
			
			prStmt.setInt(1, starPoint);
			prStmt.setString(2, reviewNo);
			
			updateCnt = prStmt.executeUpdate();
		} catch(SQLException ex) {
			System.err.println("\n  ??? SQL exec error in updateStarPointAfterSetReview(): " + ex.getMessage() );
		}
		return updateCnt;
	}
	
	//ȸ�����Խ� ID �ߺ��� Ȯ���ϱ� ����, �����ϴ� ID ���� Ȯ��
	public static int checkID(String ID) {
		try {
			String sql = "select * from customer where cid=?;";
			outputForDebug("In checkID() SQL : " + sql);
			PreparedStatement prStmt = con.prepareStatement(sql);
			
			prStmt.setString(1, ID);
			ResultSet rs = prStmt.executeQuery();
			
			if(getNoTuplesRS(rs) > 0) {
				return 1;
			}
		} catch(SQLException ex) {
			System.err.println("\n  ??? SQL exec error in checkID(): " + ex.getMessage());
		}
		
		return 0;
	}
	
	//ResultSet ��ü�� customer ���̺��� ������ ����Ǿ� ������, Customer ��ü�� ��ȯ�ϴ� �޼ҵ�
	public static Customer getCustomerFromRS(ResultSet rs) {
		Customer customer = new Customer();
		try {
			if(rs.getRow() == 0) return null;
			
			customer.setCid(rs.getString("cid"));
			customer.setCpw(rs.getString("cpw"));
			customer.setCname(rs.getString("cname"));
			customer.setCpn(rs.getString("cpn"));
			customer.setDateJoin(rs.getDate("dateJoin"));
		} catch(SQLException ex) {
			System.out.println("\n  ??? SQL exec error in getCustomerFromRS(): " + ex.getMessage());
		}
		
		return customer;
	}
	
	//ResultSet ��ü�� book ���̺��� ������ ����Ǿ� ������, Book ��ü�� ��ȯ�ϴ� �޼ҵ�
	public static Book getBookFromRS(ResultSet rs) {
		Book book = new Book();
		try {
			if(rs.getRow() == 0) return null;
			
			book.setBookNo(rs.getInt("bookNo"));
			book.setISBN(rs.getLong("ISBN"));
			book.setAuthor(rs.getString("author"));
			book.setTitle(rs.getString("title"));
			book.setSalesAmount(rs.getInt("salesAmount"));
			book.setStock(rs.getInt("stock"));
			book.setGenre(rs.getString("genre"));
			book.setPrice(rs.getInt("price"));
			book.setDiscount(rs.getInt("discount"));
			book.setPublisher(rs.getString("publisher"));
		} catch(SQLException ex) {
			System.out.println("\n  ??? SQL exec error in getBookFromRS(): " + ex.getMessage());
		}
		
		return book;
	}
	
	//ResultSet ��ü�� cart ���̺��� ������ ����Ǿ� ���� ��, Cart ��ü�� ��ȯ�ϴ� �޼ҵ�
	public static Cart getCartFromRS(ResultSet rs) {
		Cart cart = new Cart();
		try {
			if(rs.getRow() == 0) return null;
			
			cart.setCartNo(rs.getString("cartNo"));
			cart.setClientId(rs.getString("clientId"));
			cart.setBookNo(rs.getInt("bookNo"));
			cart.setSaleAmount(rs.getInt("saleAmount"));
		} catch(SQLException ex) {
			System.out.println("\n  ??? SQL exec error in getCartFromRS(): " + ex.getMessage());
		}
		return cart;
	}
	
	//ResultSet ��ü�� purchase ���̺��� ������ ����Ǿ� ���� ��, Purchase ��ü�� ��ȯ�ϴ� �޼ҵ�
	public static Purchase getPurchaseFromRS(ResultSet rs) {
		Purchase purchase = new Purchase();
		try {
			if(rs.getRow() == 0) return null;
			
			purchase.setPurchaseNo(rs.getString("purchaseNo"));
			purchase.setClientId(rs.getString("clientId"));
			purchase.setBookNo(rs.getInt("bookNo"));
			purchase.setPurchaseDate(rs.getDate("purchaseDate"));
			purchase.setPurchaseNum(rs.getInt("purchaseNum"));
			purchase.setPaymentAmount(rs.getInt("paymentAmount"));
			
		} catch(SQLException ex) {
			System.out.println("\n  ??? SQL exec error in getCartFromRS(): " + ex.getMessage());
		}
		return purchase;
	}
	
	// ��� �� Ž���Ͽ� ResultSet ��ü�� ��ȯ�ϴ� �޼ҵ�
	public static ResultSet getAllCustomersRS() {
		try {                      
			// SQL ���ǹ��� �����Ѵ�.
			String sql = "select * from customer;" ;
			outputForDebug("In getAllCustomersRS() SQL : " + sql);

			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(sql);  

			return rs;
			
		} catch( SQLException ex ) {             
			System.err.println("\n  ??? SQL exec error in getAllCustomersRS(): " + ex.getMessage() );
		}

		return null;
	}
	
	// ��� ���� Ž���Ͽ� ResultSet ��ü�� ��ȯ�ϴ� �޼ҵ�
	public static ResultSet getAllBooksRS() {
		try {
			String sql = "select * from book;";
			outputForDebug("In getAllBooksRS() SQL : " + sql);
			
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			
			return rs;
		} catch(SQLException ex) {
			System.err.println("\n  ??? SQL exec error in getAllBooksRS(): " + ex.getMessage());
		}
		return null;
	}
	
	// ��� ���� ��ü�� Ž���Ͽ� ResultSet ��ü�� ��ȯ�ϴ� �޼ҵ�
	public static ResultSet getAllPurchaseRS() {
		try {
			String sql = "select * from purchase;";
			outputForDebug("In getAllPurchaseRS() SQL : " + sql);
			
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			
			return rs;
		} catch(SQLException ex) {
			System.err.println("\n  ??? SQL exec error in getAllPurchaseRS(): " + ex.getMessage());
		}
		return null;
	}
	
	// ��� ��ٱ��� ��ü�� Ž���Ͽ� ResultSet ��ü�� ��ȯ�ϴ� �޼ҵ�
	public static ResultSet getAllCartsRS() {
		try {
			String sql="select * from cart;";
			outputForDebug("In getAllCarsRS() SQL : " + sql);
			
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			
			return rs;
		} catch(SQLException ex) {
			System.err.println("\n  ??? SQL exec error in getAllCartsRS(): " + ex.getMessage());
		}
		return null;
	}
	
	// ��� ���� ��ü�� Ž���Ͽ� ResultSet ��ü�� ��ȯ�ϴ� �޼ҵ�
	public static ResultSet getAllRiveiwsRS() {
		try {
			String sql = "select * from review;";
			outputForDebug("In getAllRiveiwsRS() SQL : " + sql);
			
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			
			return rs;
		} catch(SQLException ex) {
			System.err.println("\n  ??? SQL exec error in getAllRiveiwsRS(): " + ex.getMessage());
		}
		return null;
	}
	
	// ��� ��� ��ü�� Ž���Ͽ� ResultSet ��ü�� ��ȯ�ϴ� �޼ҵ�
	public static ResultSet getAllCancelRS() {
		try {
			String sql = "select * from cancel;";
			outputForDebug("In getAllCancelRS() SQL : " + sql);
			
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			
			return rs;
		} catch(SQLException ex) {
			System.err.println("\n  ??? SQL exec error in getAllCancelRS(): " + ex.getMessage());
		}
		return null;
	}
	
	// �ش� ���̵��� ���ų��� Ž���Ͽ� ResultSet ��ü�� ��ȯ�ϴ� �޼ҵ� : purchase��ü�� ���Ź�ȣ ������ ���� �޼ҵ�
	public static ResultSet getAllPurchaseOfIdRS(String clientId) {
		try {
			String sql = "select * from purchase where clientId=?;";
			outputForDebug("In getAllPurchaseOfIdRS() SQL : " + sql);
			
			PreparedStatement prStmt = con.prepareStatement(sql);
			
			prStmt.setString(1, clientId);
			ResultSet rs = prStmt.executeQuery();
			
			return rs;
		} catch(SQLException ex) {
			System.err.println("\n  ??? SQL exec error in getAllPurchaseOfIdRS(): " + ex.getMessage());
		}
		
		return null;
	}
	
	// �ش� ���̵��� ��ҳ��� Ž���Ͽ� ResultSet ��ü�� ��ȯ�ϴ� �޼ҵ�
	public static ResultSet getAllCancelOfIdRS(String clientId) {
		try {
			String sql = "select * from cancel where clientId=?;";
			outputForDebug("In getAllCancelOfIdRS() SQL : " + sql);
			
			PreparedStatement prStmt = con.prepareStatement(sql);
			
			prStmt.setString(1, clientId);
			ResultSet rs = prStmt.executeQuery();
			
			return rs;
		} catch(SQLException ex) {
			System.err.println("\n  ??? SQL exec error in getAllCancelOfIdRS(): " + ex.getMessage());
		}
		
		return null;
	}
	
	// �ش� ���̵��� ��ٱ��� ���� Ž���Ͽ� ResultSet ��ü�� ��ȯ�ϴ� �޼ҵ� : cart��ü�� īƮ��ȣ ������ ���� �޼ҵ�
	public static ResultSet getAllCartsOfIdRS(String clientId) {
		try {
			String sql = "select * from cart where clientId=?;";
			outputForDebug("In getAllCartsOfIdRS() SQL : " + sql);
			
			PreparedStatement prStmt = con.prepareStatement(sql);
			
			prStmt.setString(1, clientId);
			ResultSet rs = prStmt.executeQuery();
			
			return rs;
		} catch(SQLException ex) {
			System.err.println("\n  ??? SQL exec error in getAllCartsOfIdRS(): " + ex.getMessage());
		}
		return null;
	}
	
	// �ش� ���̵�� ���並 Ž���Ͽ� ResultSet ��ü�� ��ȯ�ϴ� �޼ҵ�
	public static ResultSet getAllReiviewsOfIDRS(String clientId) {
		try {
			String sql = "select reviewNo, review.purchaseNo, review.bookNo, starPoint from review, purchase "
					+ " where review.purchaseNo = purchase.purchaseNo and clientId=?;";
			outputForDebug("In getAllReiviewsOfIDRS() SQL : " + sql);
			
			PreparedStatement prStmt = con.prepareStatement(sql);
			
			prStmt.setString(1, clientId);
			ResultSet rs = prStmt.executeQuery();
			
			return rs;
		} catch(SQLException ex) {
			System.err.println("\n  ??? SQL exec error in getAllReiviewsOfIDRS(): " + ex.getMessage());
		}
		return null;
	}
	
	// ���� ��¥�� ����(purchase)�� Ž���Ͽ� ResultSet ��ü�� ��ȯ�ϴ� �޼ҵ�
	public static ResultSet getAllPurchaseOfToday(java.sql.Date purchaseDate) {
		try {
			String sql = "select * from purchase where purchaseDate=?;";
			outputForDebug("In getAllPurchaseOfToday() SQL : " + sql);
			
			PreparedStatement prStmt = con.prepareStatement(sql);
			
			prStmt.setDate(1, purchaseDate);
			ResultSet rs = prStmt.executeQuery();
			
			return rs;
		} catch(SQLException ex) {
			System.err.println("\n  ??? SQL exec error in getAllPurchaseOfToday(): " + ex.getMessage());
		}
		return null;
	}
	
	//�����ۼ� ����Ʈ�� ���� �޼ҵ�
	public static ResultSet getRSForReviewList(String clientId) {
		try {
			String sql = "select reviewNo, title, author, purchaseDate, starPoint from review, book, purchase "
					+ " where review.purchaseNo=purchase.purchaseNo and book.bookNo = purchase.bookNo and clientId=?;";
			outputForDebug("In getRSForReviewList() SQL : " + sql);
			
			PreparedStatement prStmt = con.prepareStatement(sql);
			
			prStmt.setString(1, clientId);
			ResultSet rs = prStmt.executeQuery();
			
			return rs;
		} catch(SQLException ex) {
			System.err.println("\n  ??? SQL exec error in getRSForReviewList(): " + ex.getMessage());
		}
		return null;
	}
	
	// �ش� ���̵��� ���ų����� Ž���Ͽ� ResultSet ��ü�� ��ȯ�ϴ� �޼ҵ� : ���ų��� ����Ʈ�� ���� �޼ҵ�
	public static ResultSet getPurcahseListByIdRS(String cid) {
		try {
			String sql = "select purchaseNo, title, purchaseNum, paymentAmount from purchase, book "
					+ " where purchase.bookNo = book.bookNo and clientId = ?;";
			outputForDebug("In getPurchaseListByIdRS() SQL : " + sql);
			
			PreparedStatement prStmt = con.prepareStatement(sql);
			
			prStmt.setString(1, cid);
			ResultSet rs = prStmt.executeQuery();
			
			return rs;
		} catch(SQLException ex) {
			System.err.println("\n  ??? SQL exec error in getPurchaseListByIdRS(): " + ex.getMessage());
		}
		return null;
	}
	
	// �˻��� �������� Ž���Ͽ� ResultSet ��ü�� ��ȯ�ϴ� �޼ҵ� : �������� �˻��� ���� ����Ʈ�� ���� �޼ҵ�
	public static ResultSet getBooksByTitleRS(String title) {
		try {
			String sql = "select bookNo, title, author, genre, price, publisher from book where title like ?;";
			outputForDebug("In getBooksByTitleRS() SQL : " + sql);
			
			PreparedStatement prStmt = con.prepareStatement(sql);
			
			title = "%" + title + "%";
			prStmt.setString(1, title);
			ResultSet rs = prStmt.executeQuery();
			
			return rs;
		} catch(SQLException ex) {
			System.err.println("\n  ??? SQL exec error in getBooksByTitleRS(): " + ex.getMessage());
		}
		return null;
	}
	
	// �˻��� �������� Ž���Ͽ� ResultSet ��ü�� ��ȯ�ϴ� �޼ҵ� : �������� �˻��� ���� ����Ʈ�� ���� �޼ҵ�
	public static ResultSet getBooksByAuthorRS(String author) {
		try {
			String sql = "select bookNo, title, author, genre, price, publisher from book where author like ?;";
			outputForDebug("In getBooksByAuthorRS() SQL : " + sql);
			
			PreparedStatement prStmt = con.prepareStatement(sql);
			
			author = "%" + author + "%";
			prStmt.setString(1, author);
			ResultSet rs = prStmt.executeQuery();
			
			return rs;
		} catch(SQLException ex) {
			System.err.println("\n  ??? SQL exec error in getBooksByAuthorRS(): " + ex.getMessage());
		}
		return null;
	}
	
	// �Ǹŷ� ������ Ž���Ͽ� ResultSet ��ü�� ��ȯ�ϴ� �޼ҵ� : ����Ʈ ����(����)�� ���� �޼ҵ�
	public static ResultSet getBestSellerBySalesAmount() {
		try {
			String sql = "select bookNo, salesAmount from book order by salesAmount DESC;";
			outputForDebug("In getBestSellerBySalesAmount() SQL : " + sql);

			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(sql);  

			return rs;
		} catch(SQLException ex) {
			System.err.println("\n  ??? SQL exec error in getBestSellerBySalesAmount(): " + ex.getMessage());
		}
		return null;
	}
	
	// ���� ���� ������ Ž���Ͽ� ResultSet ��ü�� ��ȯ�ϴ� �޼ҵ� : ��õ ������ ���� �޼ҵ�
	public static ResultSet getRecommendBookByStarPoint() {
		try {
			String sql = "select bookNo, avg(starPoint) from review group by bookNo order by avg(starPoint) DESC;";
			outputForDebug("In getRecommendBookByStarPoint() SQL : " + sql);

			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(sql);  

			return rs;
		} catch(SQLException ex) {
			System.err.println("\n  ??? SQL exec error in getRecommendBookByStarPoint(): " + ex.getMessage());
		}
		return null;
	}
	
	public static Book getBookByBookNoRS(int bookNo) {
		try {
			String sql = "select * from book where bookNo=?;";
			outputForDebug("In getBookByBookNoRS() SQL : " + sql);
			
			PreparedStatement prStmt = con.prepareStatement(sql);
			
			prStmt.setInt(1, bookNo);
			ResultSet rs = prStmt.executeQuery();
			if(rs.next()) {
				Book book = getBookFromRS(rs);
				return book;
			}
		} catch(SQLException ex) {
			System.err.println("\n  ??? SQL exec error in getBookByBookNoRS(): " + ex.getMessage());
		}
		return null;
	}
	
	public static Cart getCartByCartNoRS(String cartNo) {
		try {
			String sql = "select * from cart where cartNo=?;";
			outputForDebug("In getCartByCartNoRS() SQL : " + sql);
			
			PreparedStatement prStmt = con.prepareStatement(sql);
			
			prStmt.setString(1, cartNo);
			ResultSet rs = prStmt.executeQuery();
			if(rs.next()) {
				Cart cart = getCartFromRS(rs);
				return cart;
			}
		} catch(SQLException ex) {
			System.err.println("\n  ??? SQL exec error in getCartByCartNoRS(): " + ex.getMessage());
		}
		return null;
	}
	
	public static Purchase getPurchaseByPurchaseNoRS(String purchaseNo) {
		try {
			String sql = "select * from purchase where purchaseNo=?;";
			outputForDebug("In getPurchaseByPurchaseNoRS() SQL : " + sql);
			
			PreparedStatement prStmt = con.prepareStatement(sql);
			
			prStmt.setString(1, purchaseNo);
			ResultSet rs = prStmt.executeQuery();
			if(rs.next()) {
				Purchase purchase = getPurchaseFromRS(rs);
				return purchase;
			} 
		} catch(SQLException ex) {
			System.err.println("\n  ??? SQL exec error in getPurchaseByPurchaseNoRS(): " + ex.getMessage());
		}
		return null;
	}
	
	//������ȣ �Ҵ��ϴ� �޼ҵ�(��ȣ �Ҵ��Ϸ��� ��ü�� ��� Ž���Ͽ� ReslutSet���� �Ű����� ����)
	public static int getNextSerial(ResultSet rs) {
		int cnt = DB.getNoTuplesRS(rs);
		cnt++;
		
		return cnt;
	}
	
	//����� ���� ��ȯ
	public static int getNoTuplesRS(ResultSet rs) {
		int cnt = 0;
		try {
			rs.last();

			cnt = rs.getRow();

			rs.beforeFirst();

		} catch( SQLException ex ) 	    {
			System.err.println("\n  ??? SQL exec error in getNoTuplesRS : " + ex.getMessage() );
		}
		return cnt;
	}
	
	//ResultSet ��ü�� �����ȣ ��ȯ�ϴ� �޼ҵ�
	public static String[] getReviewNoFromRS(ResultSet rs) {
		String[] reviewNo = new String[getNoTuplesRS(rs)];
		try {
			int i = 0;
			while(rs.next()) {
				reviewNo[i] = rs.getString("reviewNo");
				i++;
			}
		} catch(SQLException ex) {
			System.out.println("\n  ??? SQL exec error in getReviewNoFromRS(): " + ex.getMessage());
		}
		return reviewNo;
	}
	
	//ResultSet ��ü�� 5���� ������ȣ�� ��ȯ�ϴ� �޼ҵ�(����Ʈ ����, ��õ����)
	public static int[] getBookNoOf5Books(ResultSet rs) {
		int[] bookNo = new int[6];
		try {
			int i = 0;
			while(rs.next()) {
				bookNo[i] = rs.getInt("bookNo");
				i++;
				if(i >= 6) {
					break;
				}
			}
		} catch(SQLException ex) {
			System.out.println("\n  ??? SQL exec error in getBookNoOfBestseller(): " + ex.getMessage());
		}
		return bookNo;
	}
	
	//ResultSet ��ü�� ������ ���� ������ ��ȯ�ϴ� �޼ҵ�
	public static int getDailyIncomeFromRS(ResultSet rs) {
		int dailyIncome = 0;
		try {
			if(rs.getRow() == 0) return 0;
			
			while(rs.next()) {
				dailyIncome = dailyIncome + rs.getInt("paymentAmount");
			}
		}catch(SQLException ex) {
			System.out.println("\n  ??? SQL exec error in getDailyIncomeFromRS(): " + ex.getMessage());
		}
		return dailyIncome;
	}
	
	//�ش� ������ȣ�� ���� ������ ��պ����� ��ȯ�ϴ� �޼ҵ�
	public static int getAvgPointOfBookNo(int bookNo) {
		int avgPoint = 0;
		
		return avgPoint;
	}
	
	
	
	
	
	
	/////////////////////////////////////////////////manager///////////////////////////////////////////////////////////////////////
	
	public static Manager getManager(String ID, String PW) {
		try {
			String sql = "select * from manager where managerId=? and managerPw=?;" ;
			outputForDebug("In getCustomer() SQL : " + sql);
			PreparedStatement prStmt = con.prepareStatement(sql);
			
			prStmt.setString(1, ID);
			prStmt.setString(2, PW);
			
			ResultSet rs = prStmt.executeQuery();
			if(rs.next()) {
				Manager manager = getManagerFromRS(rs);
				return manager;
			}
		} catch(SQLException ex) {
			System.err.println("\n  ??? SQL exec error in getCustomer(): " + ex.getMessage());
		}
		
		return null;
	}
	public static Manager getManagerFromRS(ResultSet rs) {
		Manager manager = new Manager();
		try {
			if(rs.getRow() == 0) return null;
		
			manager.setManagerNo(rs.getInt("managerNo"));
			manager.setManagerName(rs.getString("managerName"));
			manager.setManagerId(rs.getString("managerId"));
			manager.setManagerPw(rs.getString("managerPw"));
			manager.setYears(rs.getInt("years"));
		} catch(SQLException ex) {
			System.out.println("\n  ??? SQL exec error in getCustomerFromRS(): " + ex.getMessage());
		}
	
		return manager;
	}
	
	public static int stockBook(Book book) {
		int updateCnt = 0;
		
		try {
			String sql = "update book set stock=? where bookNo=?;";
			outputForDebug("In updateCustomer() : " + sql);
			
			PreparedStatement prStmt = con.prepareStatement(sql);
			prStmt.setInt(1, book.getStock());
			prStmt.setInt(2, book.getBookNo());
			
			updateCnt = prStmt.executeUpdate();
		} catch(SQLException ex) {
			System.err.println("\n  ??? SQL exec error in updateCustomer(): " + ex.getMessage() );
		}
		return updateCnt;
	}
	
	public static int insertBook(Book book) {
		int updateCnt = 0;

		try {
			// SQL ���ǹ��� �����Ѵ�.
			String sql = "insert into book values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?);" ;
			outputForDebug("In insertCustomer() : " + sql);
			
			PreparedStatement prStmt = con.prepareStatement(sql);

			prStmt.setInt(1, book.getBookNo());
			prStmt.setLong(2, book.getISBN());
			prStmt.setString(3, book.getAuthor());
			prStmt.setString(4, book.getTitle());
			prStmt.setInt(5, book.getSalesAmount());
			prStmt.setInt(6, book.getStock());
			prStmt.setString(7, book.getGenre());
			prStmt.setInt(8, book.getPrice());
			prStmt.setInt(9, book.getDiscount());
			prStmt.setString(10, book.getPublisher());
			
			updateCnt = prStmt.executeUpdate();  		
		} catch( SQLException ex ) {

			System.err.println("\n  ??? SQL exec error in insertCustomer(): " + ex.getMessage() );
		}

		return updateCnt;
	}

	public static ResultSet getAllEventRS() {
		try {
			String sql = "select * from event;";
			outputForDebug("In getAllBooksRS() SQL : " + sql);
			
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			
			return rs;
		} catch(SQLException ex) {
			System.err.println("\n  ??? SQL exec error in getAllBooksRS(): " + ex.getMessage());
		}
		return null;
	}
	
	public static int insertEvent(Event event) {
		int updateCnt = 0;

		try {
			// SQL ���ǹ��� �����Ѵ�.
			String sql = "insert into event values (?, ?, ?, ?, ?);" ;
			outputForDebug("In insertEvent() : " + sql);
			
			PreparedStatement prStmt = con.prepareStatement(sql);

			prStmt.setInt(1, event.getEventNo());
			prStmt.setInt(2, event.getManagerNo());
			prStmt.setDate(3, event.getDateStart());
			prStmt.setDate(4, event.getDateEnd());
			prStmt.setInt(5, event.getDiscountRate());
			
			updateCnt = prStmt.executeUpdate();  		
		} catch( SQLException ex ) {

			System.err.println("\n  ??? SQL exec error in insertEvent(): " + ex.getMessage() );
		}

		return updateCnt;
	}
}












