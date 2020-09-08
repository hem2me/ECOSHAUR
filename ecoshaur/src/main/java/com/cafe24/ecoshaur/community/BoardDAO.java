package com.cafe24.ecoshaur.community;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.cafe24.ecoshaur.category.RentalDTO;

import net.utility.DBClose;
import net.utility.DBOpen;

@Component
public class BoardDAO {
    @Autowired
    private DBOpen dbopen;
    @Autowired
    private DBClose dbclose;

    Connection con = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    StringBuilder sql = null;
    ArrayList<BoardDTO> list = null;
     
    BoardDTO dto = null;

    public BoardDAO() { }
    
    //湲�紐⑸줉
    public ArrayList<BoardDTO> list(int nowpage, int recordPerPage){
      try{        
        BoardDTO dto = new BoardDTO();
        
        int startRow = ((nowpage-1) * recordPerPage) ;
        int endRow   = recordPerPage;
        
        con = dbopen.getConnection();
        sql = new StringBuilder();
        sql.append(" SELECT postno, title, post_date, id, view, good, bad ");
        sql.append(" FROM board");       
        sql.append(" ORDER BY postno DESC");
        sql.append(" LIMIT " + startRow + " , " + endRow + " ") ;        
        pstmt = con.prepareStatement(sql.toString());
        rs = pstmt.executeQuery();
        if(rs.next()){
          list = new ArrayList<BoardDTO>();
          do {
            dto = new BoardDTO();
            dto.setPostno(rs.getInt("postno")); 
            dto.setTitle(rs.getString("title"));
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

      }catch(Exception e){
         System.out.println("�옄�쑀寃뚯떆�뙋 紐⑸줉 �떎�뙣:"+e);
      }finally{
         DBClose.close(con, pstmt, rs);
      }//end
      return list;
    }//list() end
    
    //湲�寃��깋
    public ArrayList<BoardDTO> list_search(int nowpage, int recordPerPage, String col, String search){
      try{        
        BoardDTO dto = new BoardDTO();
        
        int startRow = ((nowpage-1) * recordPerPage) ;
        int endRow   = recordPerPage;
        
        con = dbopen.getConnection();
        sql = new StringBuilder();
        sql.append(" SELECT postno, title, post_date, id, view, good, bad ");
        sql.append(" FROM board");
        String data="";
        if(col.equals("subject")) {
          data += " WHERE (title LIKE '%" + search + "%') ";
        } else if(col.equals("content")) {
          data += " WHERE contents LIKE '%" + search + "%' ";
        } else if(col.equals("subject_content")) {
          data += " WHERE (title LIKE '%" + search + "%' ";
          data += " OR contents LIKE '%" + search + "%') ";
        }
        sql.append(data);       
        sql.append(" ORDER BY postno DESC");
        sql.append(" LIMIT " + startRow + " , " + endRow + " ") ;        
        pstmt = con.prepareStatement(sql.toString());
        rs = pstmt.executeQuery();
        if(rs.next()){
          list = new ArrayList<BoardDTO>();
          do {
            dto = new BoardDTO();
            dto.setPostno(rs.getInt("postno")); 
            dto.setTitle(rs.getString("title"));
            dto.setPost_date(rs.getString("post_date"));
            dto.setId(rs.getString("id"));
            dto.setView(rs.getInt("view"));
            dto.setGood(rs.getInt("good"));
            dto.setBad(rs.getInt("bad"));
            list.add(dto);
          } while (rs.next());
        } else {
          list = null;
        } // if end
      } catch (Exception e) {
        System.out.println("�옄�쑀寃뚯떆�뙋 紐⑸줉 �떎�뙣:" + e);
      } finally {
        DBClose.close(con, pstmt, rs);
      }
      return list;
    }
    // 紐⑸줉 理쒕� �럹�씠吏� �닔
    public int count() {
      int count=0;
      try {
        // DB�뿰寃�
        con = dbopen.getConnection();
        
        //4)SQL臾� �옉�꽦
          sql=new StringBuilder();
          sql.append(" SELECT count(*) as cnt FROM board ");
          pstmt=con.prepareStatement(sql.toString());
          rs = pstmt.executeQuery();
        if(rs.next()) { // cursor 媛� �엳�뒗吏�?
          count = rs.getInt("cnt");
        }else {
          System.out.println("�뻾 媛��닔瑜� �뼸吏�紐삵븿!!");
        }// if end
      }catch(Exception e) {
        System.out.println(" 移댁슫�듃�떎�뙣:" + e);
      }finally {
        DBClose.close(con, pstmt ,rs);
      }// try end
      return count;
    } // count() end
    
    public BoardDTO read(int postno){
      try{
        con = dbopen.getConnection();
        sql = new StringBuilder();
        sql.append(" SELECT postno, title, contents, image_name, post_date, id, view, good, bad ");
        sql.append(" FROM board");       
        sql.append(" WHERE postno = ?");       
        
        pstmt = con.prepareStatement(sql.toString());
        pstmt.setInt(1, postno);
        rs = pstmt.executeQuery();
        if(rs.next()){
            dto = new BoardDTO();
            dto.setPostno(rs.getInt("postno"));
            dto.setTitle(rs.getString("title"));
            dto.setContents(rs.getString("contents"));
            dto.setImage_name(rs.getString("image_name"));
            dto.setPost_date(rs.getString("post_date"));
            dto.setId(rs.getString("id"));
            dto.setView(rs.getInt("view"));
            dto.setGood(rs.getInt("good"));
            dto.setBad(rs.getInt("bad"));
        }
      }catch(Exception e){
         System.out.println("�옄�쑀寃뚯떆�뙋 蹂닿린 �떎�뙣:"+e);
      }finally{
         DBClose.close(con, pstmt, rs);
      }//end
      return dto;
    }//read() end    
    
    public int create(BoardDTO dto) {
      int cnt = 0;
      try {
        con = dbopen.getConnection();
        sql = new StringBuilder();
        sql.append(" INSERT INTO board(postno, title, contents, image_name, post_date, id, view, good, bad)");
        sql.append(" VALUES((select ifnull(max(postno),0)+1 from board as TB),");
        sql.append(" ?, ?, ?, now(), ?, ?, ?, ?)");
       
        pstmt = con.prepareStatement(sql.toString());
        pstmt.setString(1, dto.getTitle());
        pstmt.setString(2, dto.getContents());
        pstmt.setString(3, dto.getImage_name());
        pstmt.setString(4, dto.getId());
        pstmt.setInt(5, dto.getView());
        pstmt.setInt(6, dto.getGood());
        pstmt.setInt(7, dto.getBad());
        cnt = pstmt.executeUpdate();
      } catch (Exception e) {
          System.out.println("�옄�쑀寃뚯떆臾� �벑濡앹떎�뙣"+e);
      } finally {
          dbclose.close(con, pstmt, rs);
      }//end
      return cnt;
    }//create() end 
    
    public int delete(int postno) {
      int cnt = 0;
      try {
        con = dbopen.getConnection();
        sql = new StringBuilder();
        sql.append(" DELETE FROM board");
        sql.append(" WHERE postno=?");  
        pstmt = con.prepareStatement(sql.toString());
        pstmt.setInt(1, postno);
        cnt = pstmt.executeUpdate();
      } catch (Exception e) {
          System.out.println("�궘�젣�떎�뙣"+e);
      } finally {
          dbclose.close(con, pstmt);
      }//end
      return cnt;
    }//delete() end
    
    public int update(BoardDTO dto) {
      int cnt = 0; 
      try {
        con = dbopen.getConnection();
        sql = new StringBuilder();
        sql.append(" UPDATE board");
        sql.append(" SET title=?, contents=?, image_name=?");
        sql.append(" WHERE postno=?"); 
        pstmt = con.prepareStatement(sql.toString());
        pstmt.setString(1, dto.getTitle());
        pstmt.setString(2, dto.getContents());
        pstmt.setString(3, dto.getImage_name());
        pstmt.setInt(4, dto.getPostno());
        cnt = pstmt.executeUpdate();

      } catch (Exception e) {
        System.out.println("�닔�젙�떎�뙣"+e);
      } finally {
          dbclose.close(con, pstmt, rs);
      }//end
      return cnt;
    }//update() end 
    
    //議고쉶�닔 利앷�
    public int vupdate(int postno){
      int cnt = 0; 
      try {
        con = dbopen.getConnection();
        sql = new StringBuilder();
        sql.append(" UPDATE board");
        sql.append(" SET view=view+1 ");
        sql.append(" WHERE postno=?"); 
        pstmt = con.prepareStatement(sql.toString());
        pstmt.setInt(1, postno);        
        cnt = pstmt.executeUpdate();

      } catch (Exception e) {
        System.out.println("議고쉶�닔 �떎�뙣"+e);
      } finally {
          dbclose.close(con, pstmt, rs);
      }//end
      return cnt;
    }//vupdate() end 
    
    //醫뗭븘�슂 利앷�
    public int gupdate(int postno){
      int cnt = 0; 
      try {
        con = dbopen.getConnection();
        sql = new StringBuilder();
        sql.append(" UPDATE board");
        sql.append(" SET good=good+1 ");
        sql.append(" WHERE postno=?"); 
        pstmt = con.prepareStatement(sql.toString());
        pstmt.setInt(1, postno);        
        cnt = pstmt.executeUpdate();

      } catch (Exception e) {
        System.out.println("醫뗭븘�슂 �떎�뙣"+e);
      } finally {
          dbclose.close(con, pstmt, rs);
      }//end
      return cnt;
    }//gupdate() end 
    
    //�떕�뼱�슂 利앷�
    public int bupdate(int postno){
      int cnt = 0; 
      try {
        con = dbopen.getConnection();
        sql = new StringBuilder();
        sql.append(" UPDATE board");
        sql.append(" SET bad=bad+1 ");
        sql.append(" WHERE postno=?"); 
        pstmt = con.prepareStatement(sql.toString());
        pstmt.setInt(1, postno);        
        cnt = pstmt.executeUpdate();

      } catch (Exception e) {
        System.out.println("�떕�뼱�슂 �떎�뙣"+e);
      } finally {
          dbclose.close(con, pstmt, rs);
      }//end
      return cnt;
    }//bupdate() end 
}