package com.cafe24.ecoshaur;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.cafe24.ecoshaur.category.RentalDTO;
import com.cafe24.ecoshaur.admin.MemberDTO;
import com.cafe24.ecoshaur.admin.OrderDTO;
import com.cafe24.ecoshaur.category.CategoryDTO;
import com.cafe24.ecoshaur.community.BoardDTO;
import net.utility.DBClose;
import net.utility.DBOpen;
import net.utility.Utility;

@Component
public class SearchDAO {
    @Autowired
    private DBOpen dbopen;
    @Autowired
    private DBClose dbclose;

    Connection con = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    StringBuilder sql = null;
    ArrayList<RentalDTO> list = null;
    ArrayList<CategoryDTO> category_list = null;
    
    public SearchDAO() { }
    
    //목록
    public ArrayList<RentalDTO> rental_search(String search) {
      try {
        RentalDTO dto = new RentalDTO();
        
        con = dbopen.getConnection();
        sql = new StringBuilder();
        sql.append(" SELECT product_no, title, sub_title, product_name, description, price_daily, deposit, total_quantity, remaining_quantity, thmb_name, id ");
        sql.append(" FROM rental_list ");
        sql.append(" WHERE availability='Y' ");
        
        // 검색
        String data="";
        data += " AND (title LIKE '%" + search + "%' ";
        data += " OR sub_title LIKE '%" + search + "%' ";
        data += " OR description LIKE '%" + search + "%') ";
        sql.append(data);
        
        sql.append(" ORDER BY product_no DESC ");
        sql.append(" LIMIT " + 0 + " , " + 3 + " ") ;
        pstmt = con.prepareStatement(sql.toString());
        rs = pstmt.executeQuery();
        if (rs.next()) {
          list = new ArrayList<RentalDTO>();
          do {
            dto = new RentalDTO();
            dto.setProduct_no(rs.getString("product_no"));
            dto.setTitle(rs.getString("title").trim());
            dto.setSub_title(rs.getString("sub_title").trim());
            dto.setProduct_name(rs.getString("product_name").trim());
            dto.setDescription(rs.getString("description").trim());
            dto.setPrice_daily(rs.getInt("price_daily"));
            dto.setDeposit(rs.getInt("deposit"));
            dto.setTotal_quantity(rs.getInt("total_quantity"));
            dto.setRemaining_quantity(rs.getInt("remaining_quantity"));
            dto.setThmb_name(rs.getString("thmb_name").trim());
            dto.setId(rs.getString("id").trim());
            list.add(dto);
          } while (rs.next());
        } else {
          list = null;
        } // if end
      } catch (Exception e) {
        System.out.println("rental_search 목록 실패:" + e);
      } finally {
        DBClose.close(con, pstmt, rs);
      }
      return list;
    }


    public ArrayList<BoardDTO> board_search(String search){
      ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
      try{        
        BoardDTO dto = new BoardDTO();
        
        con = dbopen.getConnection();
        sql = new StringBuilder();
        sql.append(" SELECT postno, title, contents, post_date, id, view, good, bad ");
        sql.append(" FROM board");
        
        String data="";
        data += " WHERE (title LIKE '%" + search + "%' ";
        data += " OR contents LIKE '%" + search + "%') ";
        sql.append(data);       
        
        sql.append(" ORDER BY postno DESC");
        sql.append(" LIMIT " + 0 + " , " + 3 + " ") ;        
        pstmt = con.prepareStatement(sql.toString());
        rs = pstmt.executeQuery();
        if(rs.next()){
          list = new ArrayList<BoardDTO>();
          do {
            dto = new BoardDTO();
            dto.setPostno(rs.getInt("postno")); 
            dto.setTitle(rs.getString("title"));
            dto.setContents(rs.getString("contents"));
            dto.setPost_date(rs.getString("post_date"));
            dto.setId(rs.getString("id"));
            dto.setView(rs.getInt("view"));
            dto.setGood(rs.getInt("good"));
            dto.setBad(rs.getInt("bad"));
            list.add(dto);
          } while(rs.next());
        }else{
          list = null;
        }//if end
    } catch (Exception e) {
      System.out.println("board_search 목록 실패:" + e);
    } finally {
      DBClose.close(con, pstmt, rs);
    }
    return list;
  }
    public ArrayList<RentalDTO> mainlist() {
      ArrayList<RentalDTO> mainlist = new ArrayList<RentalDTO>();
      try {
        RentalDTO dto = new RentalDTO();
        con = dbopen.getConnection();
        sql = new StringBuilder();
        sql.append(" SELECT product_no, product_name, price_daily, thmb_name ");
        sql.append(" FROM rental_list ");
        sql.append(" WHERE availability='Y' ");
        sql.append(" ORDER BY reg_date DESC ");
        sql.append(" LIMIT " + 0 + " , " + 9 + " ") ;  
        pstmt = con.prepareStatement(sql.toString());
        rs = pstmt.executeQuery();
        if (rs.next()) {
          mainlist = new ArrayList<RentalDTO>();
          do {
            dto = new RentalDTO();
            dto.setProduct_no(rs.getString("product_no").trim());
            dto.setProduct_name(rs.getString("product_name").trim());
            dto.setPrice_daily(rs.getInt("price_daily"));
            dto.setThmb_name(rs.getString("thmb_name").trim());
            mainlist.add(dto);
          } while (rs.next());
        } else {
          mainlist = null;
        } // if end
      } catch (Exception e) {
        System.out.println("main목록 실패:" + e);
      } finally {
        DBClose.close(con, pstmt, rs);
      }
      return mainlist;
    }
    
    // 일주일전보다 오래된 날짜만 출력
    // select * from member where date_add(curdate(), interval -1 week) > lastdate;
  // 휴먼계정 업데이트
    public int human_update(){
        int cnt = 0;
        try{
          con = dbopen.getConnection();
          sql = new StringBuilder();
          sql.append(" UPDATE member");
          sql.append(" SET grade='D' ");
          sql.append(" WHERE date_add(curdate(), interval -3 month) > lastdate ");
          pstmt = con.prepareStatement(sql.toString());
          cnt = pstmt.executeUpdate();
        }catch(Exception e){
          System.out.println("휴먼계정 수정 실패: "+e);
        }finally{
          DBClose.close(con, pstmt);
        }
        return cnt;
      }//update() end
    
    //보증금 받을사람 리스트
    public ArrayList<OrderDTO> des_list() {
      ArrayList<OrderDTO> list = null;
      OrderDTO dto = null;
      try {
        con = dbopen.getConnection();
        sql = new StringBuilder();
        sql.append(" SELECT A.order_no a FROM order_sheet A ");
        sql.append(" INNER JOIN order_history B ");
        sql.append(" ON A.order_no = B.order_no ");
        sql.append(" WHERE (date_add(curdate(), interval -3 week) > B.payment_date) and Order_condition = 'P' ");
        pstmt = con.prepareStatement(sql.toString());
        rs = pstmt.executeQuery();
        if(rs.next()) {
          list = new ArrayList<OrderDTO>();
          do {
            dto = new OrderDTO();
            dto.setOrder_no(rs.getInt("a"));
            list.add(dto);
          } while (rs.next());
        }//if end
      } catch (Exception e) {
        System.out.println("장바구니 삭제실패 : " + e);
      } finally {
        dbclose.close(con, pstmt);
      }
      return list;
    }// delete() end    
    
  // 보증금 등급업데이트
    public int des_update(){
        int cnt = 0;
        try{
          con = dbopen.getConnection();
          sql = new StringBuilder();
          sql.append(" UPDATE order_histroy ");
          sql.append(" SET order_condition='C' ");
          sql.append(" WHERE date_add(curdate(), interval -3 week) > payment_date ");
          pstmt = con.prepareStatement(sql.toString());
          cnt = pstmt.executeUpdate();
        }catch(Exception e){
          System.out.println("보증금 업데이트 등급 수정 실패: "+e);
        }finally{
          DBClose.close(con, pstmt);
        }
        return cnt;
      }//update() end
    
    // 보증금 삭제
    public int cart_del(int order_no) {
      int cnt = 0;
      try {
        con = dbopen.getConnection();
        sql = new StringBuilder();
        sql.append(" DELETE from deposit ");
        sql.append(" WHERE order_no = ? ");
        pstmt = con.prepareStatement(sql.toString());
        pstmt.setInt(1, order_no);
        cnt = pstmt.executeUpdate();
      } catch (Exception e) {
        System.out.println("보증금받은사람들 리스트에서 삭제실패 : " + e);
      } finally {
        dbclose.close(con, pstmt);
      }
      return cnt;
    }// delete() end
}
