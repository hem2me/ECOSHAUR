package com.cafe24.ecoshaur.payment;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.cafe24.ecoshaur.payment.CartDTO;
import com.cafe24.ecoshaur.payment.RentalDTO;
import net.utility.DBClose;
import net.utility.DBOpen;
import net.utility.Utility;

@Component
public class CartDAO {
    @Autowired
    private DBOpen dbopen=null;
    private DBClose dbclose=null;
    private Connection con=null;
    private PreparedStatement pstmt=null;
    private ResultSet rs=null;
    private StringBuilder sql=null; 
    
    public CartDAO() {
    	dbopen=new DBOpen();
    }
    //����¡
    public ArrayList<CartDTO> list(String id, int nowpage, int recordPerPage){
      int startRow = ((nowpage-1) * recordPerPage) ;
      int endRow   = recordPerPage;
      
    	 ArrayList<CartDTO> list=null;
		  try {
			  con=dbopen.getConnection();
			  sql=new StringBuilder();
			  sql.append(" SELECT cart_no, id, product_no, quantity, rental_period, receipt_date, cart_date, total_price");
			  sql.append(" FROM cart ");
			  sql.append(" WHERE id= ? ");
			  sql.append(" ORDER BY Cart_no DESC");
			  sql.append(" LIMIT " + startRow + " , " + endRow + " ") ;
			  
			  pstmt=con.prepareStatement(sql.toString());
			  pstmt.setString(1, id);
			  rs=pstmt.executeQuery();
			  if(rs.next()){
				  list = new ArrayList<CartDTO>(); 
			        do {
			          CartDTO dto=new CartDTO();
			          dto = new CartDTO();
			          dto.setCart_no(rs.getInt("cart_no"));
			          dto.setId(rs.getString("id"));
			          dto.setProduct_no(rs.getString("product_no"));
			          dto.setQuantity(rs.getInt("quantity"));
			          dto.setRental_period(rs.getString("rental_period"));
			          dto.setReceipt_date(rs.getString("receipt_date"));
			          dto.setCart_date(rs.getString("cart_date"));
			          dto.setTotal_price(rs.getInt("total_price"));
			          list.add(dto);
			        } while(rs.next());
			      }else{
			        list = null;
			      }//if end
		  }catch(Exception e) {
			  System.out.println("��� Ȯ�� ����:" +e);
		  }finally {
			  DBClose.close(con,pstmt,rs);
		  }
		  return list;
    } //list end
    
    //����¡
    public ArrayList<RentalDTO> rental_pdlist(String id, int nowpage, int recordPerPage) {
      int startRow = ((nowpage-1) * recordPerPage) ;
      int endRow   = recordPerPage;
      
    	RentalDTO dto = null;
    	ArrayList<RentalDTO> list=null;
	    try {
	      con = dbopen.getConnection();
	      sql = new StringBuilder();
	      sql.append(" SELECT A.product_no product_no, A.title title, A.price_daily price_daily, A.deposit deposit, A.thmb_name thmb_name, A.id id, A.category_code category_code ");
	      sql.append(" FROM rental_list A ");
        sql.append(" INNER JOIN cart B ");
        sql.append(" ON A.product_no = B.product_no ");
        sql.append(" WHERE B.id = ? ");
        sql.append(" ORDER BY A.product_no ");
        sql.append(" LIMIT " + startRow + " , " + endRow + " ") ;
	      pstmt = con.prepareStatement(sql.toString());
	      pstmt.setString(1, id);
	      rs = pstmt.executeQuery();
	      if(rs.next()) {
	        list = new ArrayList<RentalDTO>();
	        do {
  	        dto = new RentalDTO();
  	        dto.setProduct_no(rs.getString("product_no"));
  	        dto.setTitle(rs.getString("title"));
  	        dto.setPrice_daily(rs.getInt("price_daily"));
  	        dto.setDeposit(rs.getInt("deposit"));
  	        dto.setThmb_name(rs.getString("thmb_name"));
  	        dto.setId(rs.getString("id"));
  	        dto.setCategory_code(rs.getString("category_code"));
  	        list.add(dto);
	        } while (rs.next());
	      }//if end

	    } catch (Exception e) {
	        System.out.println("�뿩��ǰ��� Ȯ��"+e);
	    } finally {
	        DBClose.close(con, pstmt, rs);
	    }//end
	    return list;
	  }//read() end
    
    // ����¡X ���
    public ArrayList<CartDTO> list(String id){
       ArrayList<CartDTO> list=null;
      try {
        con=dbopen.getConnection();
        sql=new StringBuilder();
        sql.append(" SELECT cart_no, id, product_no, quantity, rental_period, receipt_date, cart_date, total_price");
        sql.append(" FROM cart ");
        sql.append(" WHERE id= ? ");
        sql.append(" ORDER BY Cart_no DESC");
        
        pstmt=con.prepareStatement(sql.toString());
        pstmt.setString(1, id);
        rs=pstmt.executeQuery();
        if(rs.next()){
          list = new ArrayList<CartDTO>(); 
              do {
                CartDTO dto=new CartDTO();
                dto = new CartDTO();
                dto.setCart_no(rs.getInt("cart_no"));
                dto.setId(rs.getString("id"));
                dto.setProduct_no(rs.getString("product_no"));
                dto.setQuantity(rs.getInt("quantity"));
                dto.setRental_period(rs.getString("rental_period"));
                dto.setReceipt_date(rs.getString("receipt_date"));
                dto.setCart_date(rs.getString("cart_date"));
                dto.setTotal_price(rs.getInt("total_price"));
                list.add(dto);
              } while(rs.next());
            }else{
              list = null;
            }//if end
      }catch(Exception e) {
        System.out.println("��� Ȯ�� ����:" +e);
      }finally {
        DBClose.close(con,pstmt,rs);
      }
      return list;
    } //list end
    
    // ����¡X ���
    public ArrayList<RentalDTO> rental_pdlist(String id) {
      
      RentalDTO dto = null;
      ArrayList<RentalDTO> list=null;
      try {
        con = dbopen.getConnection();
        sql = new StringBuilder();
        sql.append(" SELECT A.product_no product_no, A.title title, A.price_daily price_daily, A.deposit deposit, A.thmb_name thmb_name, A.id id, A.category_code category_code ");
        sql.append(" FROM rental_list A ");
        sql.append(" INNER JOIN cart B ");
        sql.append(" ON A.product_no = B.product_no ");
        sql.append(" WHERE B.id = ? ");
        sql.append(" ORDER BY A.product_no ");
        pstmt = con.prepareStatement(sql.toString());
        pstmt.setString(1, id);
        rs = pstmt.executeQuery();
        if(rs.next()) {
          list = new ArrayList<RentalDTO>();
          do {
            dto = new RentalDTO();
            dto.setProduct_no(rs.getString("product_no"));
            dto.setTitle(rs.getString("title"));
            dto.setPrice_daily(rs.getInt("price_daily"));
            dto.setDeposit(rs.getInt("deposit"));
            dto.setThmb_name(rs.getString("thmb_name"));
            dto.setId(rs.getString("id"));
            dto.setCategory_code(rs.getString("category_code"));
            list.add(dto);
          } while (rs.next());
        }//if end

      } catch (Exception e) {
          System.out.println("�뿩��ǰ��� Ȯ��"+e);
      } finally {
          DBClose.close(con, pstmt, rs);
      }//end
      return list;
    }//read() end
    
 // ��� �ִ� ����¡ ��
    public int count(String id) {
      int count=0;
      try {
        // DB����
        con = dbopen.getConnection();
        
        //4)SQL�� �ۼ�
          sql=new StringBuilder();
          sql.append(" SELECT count(*) as cnt FROM cart ");
          sql.append(" WHERE id=? ");
          pstmt=con.prepareStatement(sql.toString());
          pstmt.setString(1, id);
          rs = pstmt.executeQuery();
        if(rs.next()) { // cursor �� �ִ���?
          count = rs.getInt("cnt");
        }else {
          System.out.println("�� ������ ��������!!");
        }// if end
      }catch(Exception e) {
        System.out.println(" ī��Ʈ����:" + e);
      }finally {
        DBClose.close(con, pstmt ,rs);
      }// try end
      return count;
    } // count() end
    
    
    public int Point(String id ) {
    	int point=0;
	    try {
	      con = dbopen.getConnection();
	      sql = new StringBuilder();
	      sql.append(" SELECT SUM(point) point ");
	      sql.append(" FROM point");
	      sql.append(" WHERE id = ?"); 
	      pstmt = con.prepareStatement(sql.toString());
	      pstmt.setString(1, id);
	      rs = pstmt.executeQuery();
	      if(rs.next()) {
	        point=rs.getInt("point");
	      }//if end

	    } catch (Exception e) {
	        System.out.println("����ƮȮ��"+e);
	    } finally {
	        DBClose.close(con, pstmt, rs);
	    }//end
	    return point;
	  }//read() end
    
    public int total_price(String id) {
      int point=0;
      try {
        con = dbopen.getConnection();
        sql = new StringBuilder();
        sql.append(" SELECT SUM(total_price) total_price ");
        sql.append(" FROM cart ");
        sql.append(" WHERE id = ? "); 
        pstmt = con.prepareStatement(sql.toString());
        pstmt.setString(1, id);
        rs = pstmt.executeQuery();
        if(rs.next()) {
          point=rs.getInt("total_price");
        }//if end

      } catch (Exception e) {
          System.out.println("�ѱݾ� ����"+e);
      } finally {
          DBClose.close(con, pstmt, rs);
      }//end
      return point;
    }//read() end
    
    // ����Ʈ ����
    public int pointUpdate(String id, PointDTO dto) {
      int cnt = 0;
      try {
        con = dbopen.getConnection();
        sql = new StringBuilder();
        sql.append(" INSERT INTO point(NO, id, point, date) ");
        sql.append(" VALUES((SELECT ifnull(max(NO),0)+1 FROM point as TB), ?, ?, now()) ");
        pstmt = con.prepareStatement(sql.toString());
        pstmt.setString(1, id);
        pstmt.setInt(2, -dto.getPoint());
        cnt = pstmt.executeUpdate();
      } catch (Exception e) {
        System.out.println("����Ʈ �������� : " + e);
      } finally {
        dbclose.close(con, pstmt);
      }
      return cnt;
    }
    
    // ����Ʈ ����
    public int setpoint(String id, int point) {
      int cnt = 0;
      try {
        con = dbopen.getConnection();
        sql = new StringBuilder();
        sql.append(" INSERT INTO point(NO, id, point, date) ");
        sql.append(" VALUES((SELECT ifnull(max(NO),0)+1 FROM point as TB), ?, ?, now()) ");
        pstmt = con.prepareStatement(sql.toString());
        pstmt.setString(1, id);
        pstmt.setInt(2, point);
        cnt = pstmt.executeUpdate();
      } catch (Exception e) {
        System.out.println("����Ʈ �������� : " + e);
      } finally {
        dbclose.close(con, pstmt);
      }
      return cnt;
    }
    
    // �뿩�� ����ó ��������
    public int get_tel(String id) {
      int point=0;
      try {
        con = dbopen.getConnection();
        sql = new StringBuilder();
        sql.append(" SELECT SUM(total_price) tp ");
        sql.append(" FROM cart ");
        sql.append(" WHERE id = ? "); 
        pstmt = con.prepareStatement(sql.toString());
        pstmt.setString(1, id);
        rs = pstmt.executeQuery();
        if(rs.next()) {
          point=rs.getInt("tp");
        }//if end

      } catch (Exception e) {
          System.out.println("�ѱݾ� ����"+e);
      } finally {
          DBClose.close(con, pstmt, rs);
      }//end
      return point;
    }
    
 // ��ٱ��� ���� ��������
    public int get_cartCnt(String id) {
      int point=0;
      try {
        con = dbopen.getConnection();
        sql = new StringBuilder();
        sql.append(" SELECT COUNT(cart_no) no ");
        sql.append(" FROM cart ");
        sql.append(" WHERE id = ? "); 
        pstmt = con.prepareStatement(sql.toString());
        pstmt.setString(1, id);
        rs = pstmt.executeQuery();
        if(rs.next()) {
          point=rs.getInt("no");
        }//if end

      } catch (Exception e) {
          System.out.println("�ѱݾ� ����"+e);
      } finally {
          DBClose.close(con, pstmt, rs);
      }//end
      return point;
    }
    
    
  // �ֹ�����ȣ max�� ��������
    public int OMax_code() {
      int num = 0;
      try {
        con = dbopen.getConnection();
        sql = new StringBuilder();
        sql.append(" SELECT ORDER_NO ");
        sql.append(" FROM order_sheet ");
        sql.append(" order by ORDER_NO desc ");
        sql.append(" LIMIT 1 ");
        pstmt = con.prepareStatement(sql.toString());
        rs = pstmt.executeQuery();
        if (rs.next()) {
          num = rs.getInt("ORDER_NO");
        }
      } catch (Exception e) {
        System.out.println("max�� �������� ����:" + e);
      } finally {
        DBClose.close(con, pstmt, rs);
      }
      return num;
    } 
    
 // �ֹ��� �Է�
    public int order_create(OrderDTO dto, String cid, int total_price, int number, int cartcnt) {
      int cnt = 0;
      try {
        con = dbopen.getConnection();
        sql = new StringBuilder();
        sql.append(" INSERT INTO order_sheet(ORDER_NO, PAYMENT_PRICE, ID, RECIPIENT, DELIVERY_METHOD, ADDRESS, ADDRESS_R, TEL) ");
        sql.append(" VALUES(?, ?, ?, ?, ?, ?, ?, ?) ");
        pstmt = con.prepareStatement(sql.toString());
        pstmt.setInt(1, number);
        pstmt.setInt(2, total_price);
        pstmt.setString(3, cid);
        pstmt.setString(4, dto.getRecipient());
        pstmt.setString(5, dto.getDelivery_method());
        pstmt.setString(6, dto.getAddress());
        pstmt.setString(7, dto.getAddress_R());
        pstmt.setString(8, dto.getTel());
        cnt = pstmt.executeUpdate();
      } catch (Exception e) {
        System.out.println("�ֹ��� �ۼ� ���� : " + e);
      } finally {
        dbclose.close(con, pstmt);
      }
      return cnt;
    }
    
 // �ֹ������� �Է�
    public int orderhistory_create(OrderHistoryDTO ohdto, String cid, int number, ArrayList<CartDTO> cdto, ArrayList<RentalDTO> rdto, int total_price) {
      int cnt = 0;
      try {
        for(int i=0;i<cdto.size();i++) {
          con = dbopen.getConnection();
          sql = new StringBuilder();
          sql.append(" INSERT INTO order_history(order_detail_no, order_no, product_no, quantity, rental_period, total_price, payment, credit_card, card_num, payment_date, Order_condition, deposit) ");
          sql.append(" VALUES((SELECT ifnull(max(order_detail_no),0)+1 FROM order_history as TB), ?, ?, ?, ?, ?, ?, ?, ?, now(), 'P', ?) ");
          pstmt = con.prepareStatement(sql.toString());
          pstmt.setInt(1, number);
          pstmt.setString(2, cdto.get(i).getProduct_no());
          pstmt.setInt(3, cdto.get(i).getQuantity());
          pstmt.setInt(4, Integer.parseInt(cdto.get(i).getRental_period()));
          pstmt.setInt(5, total_price);
          pstmt.setString(6, ohdto.getPayment());
          pstmt.setString(7, ohdto.getCredit_card());
          pstmt.setString(8, ohdto.getCard_num());
          pstmt.setInt(9, rdto.get(i).getDeposit());
          cnt = pstmt.executeUpdate();
          if(cnt == 0) {
            break;
          }
        }
      } catch (Exception e) {
        System.out.println("�ֹ������� �ۼ� ���� : " + e);
      } finally {
        dbclose.close(con, pstmt);
      }
      return cnt;
    }
    
    
    //����
    public int cart_del(String id) {
      int cnt = 0;
      try {
        con = dbopen.getConnection();
        sql = new StringBuilder();
        sql.append(" DELETE from cart ");
        sql.append(" WHERE id = ? ");
        pstmt = con.prepareStatement(sql.toString());
        pstmt.setString(1, id);
        cnt = pstmt.executeUpdate();
      } catch (Exception e) {
        System.out.println("��ٱ��� �������� : " + e);
      } finally {
        dbclose.close(con, pstmt);
      }
      return cnt;
    }// delete() end

    
    // ��ٱ��� �߰�
    public int create(CartDTO dto) {
      int cnt = 0;
      try {
        con = dbopen.getConnection();
        sql = new StringBuilder();
        sql.append(" INSERT INTO cart(cart_no, id, product_no, quantity, rental_period, receipt_date, cart_date, total_price) ");
        sql.append(" VALUES((SELECT ifnull(max(cart_no),0)+1 FROM cart as TB), ?, ?, ?, ?, ?, now(), ?) ");
        pstmt = con.prepareStatement(sql.toString());
        pstmt.setString(1, dto.getId());
        pstmt.setString(2, dto.getProduct_no());
        pstmt.setInt(3, dto.getQuantity());
        pstmt.setString(4, dto.getRental_period());
        pstmt.setString(5, dto.getReceipt_date());
        pstmt.setInt(6, dto.getTotal_price());
        cnt = pstmt.executeUpdate();
      } catch (Exception e) {
        System.out.println("��ٱ��� �߰� ���� : " + e);
      } finally {
        dbclose.close(con, pstmt);
      }
      return cnt;
    }
    
    
  //��ٱ��� ����
    public int delete(int no) {
      int cnt = 0;
      try {
        con = dbopen.getConnection();
        sql = new StringBuilder();
        sql.append(" DELETE FROM cart ");
        sql.append(" WHERE cart_no=? ");
        pstmt = con.prepareStatement(sql.toString());
        pstmt.setInt(1, no);
        cnt = pstmt.executeUpdate();
      } catch (Exception e) {
        System.out.println("��ٱ��ϻ������� : " + e);
      } finally {
        dbclose.close(con, pstmt);
      }
      return cnt;
    }// delete() end
    
    //��ٱ��� �ѱݾ�
    public int total(String id) {
      int total = 0;
      try {
        con = dbopen.getConnection();
        sql = new StringBuilder();
        sql.append(" SELECT SUM(TOTAL_PRICE) price FROM cart ");
        sql.append(" WHERE id=? ");
        pstmt = con.prepareStatement(sql.toString());
        pstmt.setString(1, id);
        rs = pstmt.executeQuery();
        if(rs.next()) {
          total=rs.getInt("price");
        }//if end
      } catch (Exception e) {
        System.out.println("��ٱ��� �ѱݾ� �������� ���� : " + e);
      } finally {
        dbclose.close(con, pstmt);
      }
      return total;
    }// delete() end
    
    
    // �ݳ���û �ڵ庯��
    public int change_borrow(int order_no, String code) {
      int cnt = 0;
      try {
        // DB����
        con = dbopen.getConnection();
        
        //4)SQL�� �ۼ�
        sql=new StringBuilder();
        sql.append(" UPDATE order_history ");
        sql.append(" SET order_condition=? ");
        sql.append(" WHERE order_no=? ");
      
        pstmt=con.prepareStatement(sql.toString());
        pstmt.setString(1, code);
        pstmt.setInt(2, order_no);
        
        cnt = pstmt.executeUpdate();
      } catch (Exception e) {
        System.out.println("�ݳ���û �ڵ庯�� ���� : " + e);
      } finally {
        DBClose.close(con, pstmt);
      } // try end
      return cnt;
  } // memberSamplepasswd() end
    
    // ��ǰ ��������
    public int rental_quantity(String product_no) {
      int total = 0;
      try {
        con = dbopen.getConnection();
        sql = new StringBuilder();
        sql.append(" SELECT remaining_quantity FROM rental_list ");
        sql.append(" WHERE product_no=? ");
        pstmt = con.prepareStatement(sql.toString());
        pstmt.setString(1, product_no);
        rs = pstmt.executeQuery();
        if(rs.next()) {
          total=rs.getInt("remaining_quantity");
        }//if end
      } catch (Exception e) {
        System.out.println("��ǰ���� �������� ���� : " + e);
      } finally {
        dbclose.close(con, pstmt);
      }
      return total;
    }
    
    // ��ǰ���� N
    public int change_stat(String product_no) {
      int cnt = 0;
      try {
        // DB����
        con = dbopen.getConnection();
        
        //4)SQL�� �ۼ�
        sql=new StringBuilder();
        sql.append(" UPDATE rental_list ");
        sql.append(" SET remaining_quantity = 0, availability = 'N' ");
        sql.append(" WHERE product_no = ? ");
      
        pstmt=con.prepareStatement(sql.toString());
        pstmt.setString(1, product_no);
        
        cnt = pstmt.executeUpdate();
      } catch (Exception e) {
        System.out.println("��ǰ ���� ���� ���� : " + e);
      } finally {
        DBClose.close(con, pstmt);
      } // try end
      return cnt;
  } // memberSamplepasswd() end
    
    // ��ǰ���� ����
    public int change_quantity(String product_no, int quantity) {
      int cnt = 0;
      try {
        // DB����
        con = dbopen.getConnection();
        
        //4)SQL�� �ۼ�
        sql=new StringBuilder();
        sql.append(" UPDATE rental_list ");
        sql.append(" SET remaining_quantity = ? ");
        sql.append(" WHERE product_no = ? ");
      
        pstmt=con.prepareStatement(sql.toString());
        pstmt.setInt(1, quantity);
        pstmt.setString(2, product_no);
        
        cnt = pstmt.executeUpdate();
      } catch (Exception e) {
        System.out.println("��ǰ ���� ���� ���� : " + e);
      } finally {
        DBClose.close(con, pstmt);
      } // try end
      return cnt;
  } // memberSamplepasswd() end
    
} // cart class  () end 
