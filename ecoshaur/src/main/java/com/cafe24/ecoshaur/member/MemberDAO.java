package com.cafe24.ecoshaur.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.cafe24.ecoshaur.category.RentalDTO;
import com.cafe24.ecoshaur.member.MemberDTO;
import com.cafe24.ecoshaur.payment.CartDTO;

import net.utility.DBClose;
import net.utility.DBOpen;

@Component
public class MemberDAO {
    @Autowired
    private DBOpen dbopen;
    @Autowired
    private DBClose dbclose;

    Connection con = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    StringBuilder sql = null;
    ArrayList<MemberDTO> list = null;
    ArrayList<MypageDTO> mypage = null;
    ArrayList<OrderDTO> order_sheet = null;
    ArrayList<BoardDTO> board_list = null;
    ArrayList<QnaDTO> qna_list = null; 
    
    //유저페이지
    ArrayList<MypageDTO> userpage = null;
    ArrayList<MypageDTO> user_rental = null;
    ArrayList<BoardDTO> user_board = null;

    public MemberDAO() { }

    public String loginProc(MemberDTO dto) {
	    String grade=null;
	    try{
		con=dbopen.getConnection();
	      sql=new StringBuilder();
	      sql.append(" SELECT grade ");
	      sql.append(" FROM member ");
	      sql.append(" WHERE id=? AND pw=? ");
	      sql.append(" AND grade IN ('U', 'S', 'P', 'D','W','M') ");
	      pstmt=con.prepareStatement(sql.toString());
	      pstmt.setString(1, dto.getId());
	      pstmt.setString(2, dto.getPw());
	      rs= pstmt.executeQuery();
	      if(rs.next()){
	          grade=rs.getString("grade");
	      }else{
	          grade=null;
	      }//if end
	    }catch(Exception e){
	      System.out.println("로그인실패:" + e);
	    }finally {
	      DBClose.close(con, pstmt, rs);
	    }//try end
	    return grade;  
	  }//loginProc() end
	
  // 최근 로그인
    public int lastdate(String id){
        int cnt = 0;
        try{
          con = dbopen.getConnection();
          sql = new StringBuilder();
          sql.append(" UPDATE member");
          sql.append(" SET lastdate=curdate() ");
          sql.append(" WHERE id = ?");
          pstmt = con.prepareStatement(sql.toString());
          pstmt.setString(1, id);
          cnt = pstmt.executeUpdate();
        }catch(Exception e){
          System.out.println("최근로그인 수정 실패: "+e);
        }finally{
          DBClose.close(con, pstmt);
        }
        return cnt;
      }//update() end
    
    
	public int duplicateID(String id) {
		 int cnt=0;
	      try {
	        con=dbopen.getConnection();          
	        sql=new StringBuilder();
	        sql.append(" SELECT COUNT(id) as cnt ");
	        sql.append(" FROM member ");
	        sql.append(" WHERE id=? ");
	        pstmt=con.prepareStatement(sql.toString());
	        pstmt.setString(1, id);
	        rs=pstmt.executeQuery();
	        if(rs.next()) {
	          cnt=rs.getInt("cnt");
	        }
	      }catch (Exception e) {
	        System.out.println("아이디 중복 확인 실패 : " + e);
	      }finally {
	        DBClose.close(con, pstmt, rs);
	      }//try end
	      return cnt;

	  }//duplecateID() end
	
	
	//회원가입
	public int insertmember(MemberDTO dto) {
		int cnt=0;
		try {
			con = dbopen.getConnection();
	        sql = new StringBuilder();
	        sql.append(" INSERT INTO member(id, mem_name, pw, birth, contact_number, email, "
	                  + "zip, address, address_r, grade, joined_date, lastdate, pro_name) ");
	        sql.append("values(?,?,?,?,?,?,?,?,?, 'U', now(), now(),?)");
	        pstmt = con.prepareStatement(sql.toString());
	        pstmt.setString(1, dto.getId());
	        pstmt.setString(2, dto.getMem_name());
	        pstmt.setString(3, dto.getPw());
	        pstmt.setString(4, dto.getBirth());
	        pstmt.setString(5, dto.getContact_number());
	        pstmt.setString(6, dto.getEmail());
	        pstmt.setString(7, dto.getZip());
	        pstmt.setString(8, dto.getAddress());
	        pstmt.setString(9, dto.getAddress_r());
	        pstmt.setString(10, dto.getPro_name());
	        cnt = pstmt.executeUpdate();
	      } catch (Exception e) {
	        System.out.println("회원가입실패 : " + e);
	      } finally {
	        dbclose.close(con, pstmt);
	      }
	      return cnt;
		}//insertmember() end
	
	//회원정보 불러오기
	public MemberDTO read(String id) {
	      MemberDTO dto = new MemberDTO();
	      try {
	        con = dbopen.getConnection();
	        sql = new StringBuilder();
	        sql.append(" SELECT mem_name, birth, contact_number, email, zip, address, address_r, joined_date, lastdate, pro_name ");
	        sql.append(" FROM member ");
	        sql.append(" WHERE id = ? ");
	        pstmt = con.prepareStatement(sql.toString());
	        pstmt.setString(1, id);
	        rs = pstmt.executeQuery();
	        if (rs.next()) {
	          dto.setMem_name(rs.getString("mem_name"));
	          dto.setBirth(rs.getString("birth"));
	          dto.setContact_number(rs.getString("contact_number"));
	          dto.setEmail(rs.getString("email"));
	          dto.setZip(rs.getString("zip"));
	          dto.setAddress(rs.getString("address"));
	          dto.setAddress_r(rs.getString("address_r"));
	          dto.setJoined_date(rs.getString("joined_date"));
	          dto.setLastdate(rs.getString("lastdate"));
	          dto.setPro_name(rs.getString("pro_name"));
	   
	        }
	      } catch (Exception e) {
	        System.out.println("회원정보 가져오기 실패:" + e);
	      } finally {
	        DBClose.close(con, pstmt, rs);
	      }
	      return dto;
	    }// read()
	
	
	//회원정보 수정
	public int update(MemberDTO dto){
	    int cnt = 0;
	    try{
	      con = dbopen.getConnection();
	      sql = new StringBuilder();
	      sql.append(" UPDATE member");
	      sql.append(" SET mem_name=?, pw=?, birth=?, contact_number=?, email=?, zip=?, address=?, address_r=?, lastdate=?");
	      sql.append(" WHERE id = ?");
	      pstmt = con.prepareStatement(sql.toString());
	      pstmt.setString(1, dto.getMem_name());
	      pstmt.setString(2, dto.getPw());
	      pstmt.setString(3, dto.getBirth());
	      pstmt.setString(4, dto.getContact_number());
	      pstmt.setString(5, dto.getEmail());
	      pstmt.setString(6, dto.getZip());
	      pstmt.setString(7, dto.getAddress());
	      pstmt.setString(8, dto.getAddress_r());
	      pstmt.setString(9, dto.getLastdate());
	      pstmt.setString(10, dto.getId());
	      cnt = pstmt.executeUpdate();
	    }catch(Exception e){
	      System.out.println("회원정보 수정 실패: "+e);
	    }finally{
	      DBClose.close(con, pstmt);
	    }
	    return cnt;
	  }//update() end
	
	//회원탈퇴
		public int delete(String id){
	        int cnt = 0;
	        try{
	          con = dbopen.getConnection();
	          sql = new StringBuilder();
	          sql.append(" UPDATE  member ");
	          sql.append(" set grade='H' ");
	          sql.append(" WHERE id = ? ");
	          pstmt = con.prepareStatement(sql.toString());
	          pstmt.setString(1, id);
	          cnt = pstmt.executeUpdate();
	        }catch(Exception e){
	          System.out.println(e.toString());
	        }finally{
	          DBClose.close(con, pstmt);
	        }
	        return cnt;
	    }//delete() end
	
		
	//내 상품목록
	public ArrayList<MypageDTO> mypage(String id) {
		try {
			MypageDTO dto = new MypageDTO();
			con = dbopen.getConnection();
			sql = new StringBuilder();
			sql.append(" SELECT m.id, r.product_no, r.product_name, r.title, r.reg_date");
			sql.append(" FROM rental_list AS r ");
			sql.append(" JOIN member AS m ");
			sql.append(" ON r.id = m.id ");
			sql.append(" WHERE r.id = ? ");

			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				mypage = new ArrayList<MypageDTO>();
				do {
					dto = new MypageDTO();
					dto.setId_receive(rs.getString("id"));
					dto.setProduct_no(rs.getString("product_no"));
					dto.setProduct_name(rs.getString("product_name"));
					dto.setTitle(rs.getString("title"));
					dto.setReg_date(rs.getString("reg_date"));
					mypage.add(dto);
				} while (rs.next());
			} else {
				mypage= null;
			} // if end
		} catch (Exception e) {
			System.out.println("목록 불러오기 실패:" + e);
		} finally {
			DBClose.close(con, pstmt, rs);
		} // try end
		return mypage;
	}//list end
	
	
	// 비밀번호 찾기
			public int findPw(String id, String email) {
			int cnt = 0;
			try {
					// DB연결
					con = dbopen.getConnection();
							
					//4)SQL문 작성
					sql=new StringBuilder();
				    sql.append(" SELECT count(email) cnt FROM member ");
					sql.append(" WHERE id=? and email=? ");
						
					pstmt=con.prepareStatement(sql.toString());
					pstmt.setString(1, id);
					pstmt.setString(2, email);
					rs = pstmt.executeQuery();
			        if (rs.next()) {
			          cnt= rs.getInt("cnt");
			        }
						} catch (Exception e) {
							System.out.println("비밀번호 찾기 실패 : " + e);
						} finally {
							DBClose.close(con, pstmt);
						} // try end
						return cnt;
				} // find_password() end
		
			
			// 임시비밀번호로 수정
			public int memberSamplepasswd(String id, String email, String pw) {
				int cnt = 0;
				try {
					// DB연결
					con = dbopen.getConnection();
					
					//4)SQL문 작성
				    sql=new StringBuilder();
				    sql.append(" UPDATE member ");
					sql.append(" SET pw=? ");
					sql.append(" WHERE id=? and email=? ");
				
					pstmt=con.prepareStatement(sql.toString());
					pstmt.setString(1, pw);
					pstmt.setString(2, id);
					pstmt.setString(3, email);
					cnt = pstmt.executeUpdate();
				} catch (Exception e) {
					System.out.println("임시비밀번호로 수정 실패 : " + e);
				} finally {
					DBClose.close(con, pstmt);
				} // try end
				return cnt;
		} // memberSamplepasswd() end
		
		
		//내 주문서
		public ArrayList<OrderDTO> order_sheet(String id) {
			try {
				OrderDTO dto = new OrderDTO();
				con = dbopen.getConnection();
				sql = new StringBuilder();
				sql.append(" SELECT order_no, payment_price, id, recipient, delivery_method, address, address_R, tel");
				sql.append(" FROM order_sheet ");
				sql.append(" WHERE id = ? ");

				pstmt = con.prepareStatement(sql.toString());
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					order_sheet = new ArrayList<OrderDTO>();
					do {
						dto = new OrderDTO();
						dto.setOrder_no(rs.getInt("order_no"));
						dto.setPayment_price(rs.getInt("payment_price"));
						dto.setId(rs.getString("id"));
						dto.setRecipient(rs.getString("recipient"));
						dto.setDelivery_method(rs.getString("delivery_method"));
						dto.setAddress(rs.getString("address"));
						dto.setAddress_R(rs.getString("address_R"));
						dto.setTel(rs.getString("tel"));
						order_sheet.add(dto);
					} while (rs.next());
				} else {
					order_sheet= null;
				} // if end
			} catch (Exception e) {
				System.out.println("주문서 목록 불러오기 실패:" + e);
			} finally {
				DBClose.close(con, pstmt, rs);
			} // try end
			return order_sheet;
		}//order_sheet() end
		
		
		//내가 쓴 게시판 글 목록
		public ArrayList<BoardDTO> board_list(String id) {
			try {
				BoardDTO dto = new BoardDTO();
				con = dbopen.getConnection();
				sql = new StringBuilder();
				sql.append(" SELECT title, contents, post_date, id, postno");
				sql.append(" FROM board ");
				sql.append(" WHERE id = ? ");

				pstmt = con.prepareStatement(sql.toString());
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					board_list = new ArrayList<BoardDTO>();
					do {
						dto = new BoardDTO();
						dto.setTitle(rs.getString("title"));
						dto.setContents(rs.getString("contents"));
						dto.setId(rs.getString("id"));
						dto.setPost_date(rs.getString("post_date"));
						dto.setPostno(rs.getInt("postno"));
						board_list.add(dto);
					} while (rs.next());
				} else {
					board_list= null;
				} // if end
			} catch (Exception e) {
				System.out.println("커뮤니티 글 목록 불러오기 실패:" + e);
			} finally {
				DBClose.close(con, pstmt, rs);
			} // try end
			return board_list;
		}//board_list() end
		
		
		// 1:1문의 글 목록
		public ArrayList<QnaDTO> qna_list(String id) {
			try {
				QnaDTO dto = new QnaDTO();
				con = dbopen.getConnection();
				sql = new StringBuilder();
				sql.append(" SELECT title, contents, post_date, id, image_name, head, pcode, ccode");
				sql.append(" FROM qna ");
				sql.append(" WHERE id = ? ");
				sql.append(" order by pcode, ccode ");

				pstmt = con.prepareStatement(sql.toString());
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					qna_list = new ArrayList<QnaDTO>();
					do {
						dto = new QnaDTO();
						dto.setTitle(rs.getString("title"));
						dto.setContents(rs.getString("contents"));
						dto.setId(rs.getString("id"));
						dto.setPost_date(rs.getString("post_date"));
						dto.setImage_name(rs.getString("image_name"));
						dto.setHead(rs.getString("head"));
						dto.setPcode(rs.getInt("pcode"));
						dto.setCcode(rs.getInt("ccode"));
						qna_list.add(dto);
					} while (rs.next());
				} else {
					qna_list= null;
				} // if end
			} catch (Exception e) {
				System.out.println("문의사항 글 목록 불러오기 실패:" + e);
			} finally {
				DBClose.close(con, pstmt, rs);
			} // try end
			return qna_list;
		}//qna_list() end
		
		
		//잔여포인트
		public int point_p(String id){
		    int cnt = 0;
		    try{
		      con = dbopen.getConnection();
		      sql = new StringBuilder();
		      sql.append(" SELECT sum(point) as cnt ");
		      sql.append(" FROM point ");
		      sql.append(" WHERE id = ? ");
		      pstmt = con.prepareStatement(sql.toString());
		      pstmt.setString(1, id);
		      rs=pstmt.executeQuery();
		      if (rs.next()) {
		    	  cnt=rs.getInt("cnt");
		      }
		    }catch(Exception e){
		      System.out.println("잔여포인트 불러오기 실패: "+e);
		    }finally{
		      DBClose.close(con, pstmt, rs);
		    }
		    return cnt;
		  }//point_p() end
		
		
		//사용포인트
		public int point_m(String id){
		int cnt = 0;
		 try{
				 con = dbopen.getConnection();
				 sql = new StringBuilder();
				 sql.append(" SELECT sum(point) as cnt ");
				 sql.append(" FROM point ");
				 sql.append(" WHERE id = ? and point<0 ");
				 pstmt = con.prepareStatement(sql.toString());
				 pstmt.setString(1, id);
				 rs=pstmt.executeQuery();
				 if (rs.next()) {
					  cnt=rs.getInt("cnt");
					     }
					}catch(Exception e){
					 System.out.println("사용포인트 불러오기 실패: "+e);
					  }finally{
					   DBClose.close(con, pstmt, rs);
					  }
					  return cnt;
		 }//point_m() end
		
		//총 좋아요 수
		public int rating_good(String id){
		int cnt = 0;
			try{
					con = dbopen.getConnection();
					sql = new StringBuilder();
					sql.append(" SELECT count(evaluation) as cnt ");
					sql.append(" FROM rating ");
					sql.append(" WHERE id_receive = ? and evaluation='Good' ");
					pstmt = con.prepareStatement(sql.toString());
					pstmt.setString(1, id);
					rs=pstmt.executeQuery();
					if (rs.next()) {
						cnt=rs.getInt("cnt");
							  }
						}catch(Exception e){
						 System.out.println("총 좋아요 수 불러오기 실패: "+e);
						  }finally{
							 DBClose.close(con, pstmt, rs);
						}
						return cnt;
		}//rating_good() end
		
		
		//총 싫어요 수
		public int rating_bad(String id){
		int cnt = 0;
			try{
					con = dbopen.getConnection();
					sql = new StringBuilder();
					sql.append(" SELECT count(evaluation) as cnt ");
					sql.append(" FROM rating ");
					sql.append(" WHERE id_receive = ? and evaluation='Bad' ");
					pstmt = con.prepareStatement(sql.toString());
					pstmt.setString(1, id);
					rs=pstmt.executeQuery();
					if (rs.next()) {
						cnt=rs.getInt("cnt");
									}
						}catch(Exception e){
							System.out.println("총 싫어요 수 불러오기 실패: "+e);
								}finally{
							 DBClose.close(con, pstmt, rs);
						}
							return cnt;
		}//rating_bad() end
		
		

	  //내 주문내역서
	    public ArrayList<OrderHistoryDTO> order_history(String order_no) {
	      ArrayList<OrderHistoryDTO> list = new ArrayList<OrderHistoryDTO>();
	      OrderHistoryDTO dto = new OrderHistoryDTO();
	      try {
	        con = dbopen.getConnection();
	        sql = new StringBuilder();
	        sql.append(" SELECT order_detail_no, order_no, product_no, quantity, rental_period, total_price, payment, credit_card, card_num, payment_date, order_condition, deposit ");
	        sql.append(" FROM order_history ");
	        sql.append(" WHERE order_no = ? ");
	        sql.append(" ORDER BY order_detail_no DESC ");

	        pstmt = con.prepareStatement(sql.toString());
	        pstmt.setString(1, order_no);
	        rs = pstmt.executeQuery();
	        if (rs.next()) {
	          list = new ArrayList<OrderHistoryDTO>();
	          do {
	            dto = new OrderHistoryDTO();
	            dto.setOrder_detail_no(rs.getInt("order_detail_no"));
	            dto.setOrder_no(rs.getInt("order_no"));
	            dto.setProduct_no(rs.getString("product_no"));
	            dto.setQuantity(rs.getInt("quantity"));
	            dto.setRental_period(rs.getInt("rental_period"));
	            dto.setTotal_price(rs.getInt("total_price"));
	            dto.setPayment(rs.getString("payment"));
	            dto.setCredit_card(rs.getString("credit_card"));
	            dto.setCard_num(rs.getString("card_num"));
	            dto.setPayment_date(rs.getString("payment_date"));
	            dto.setOrder_condition(rs.getString("order_condition"));
	            dto.setDeposit(rs.getInt("deposit"));
	            list.add(dto);
	          } while (rs.next());
	        } else {
	          list= null;
	        } // if end
	      } catch (Exception e) {
	        System.out.println("주문서 목록 불러오기 실패:" + e);
	      } finally {
	        DBClose.close(con, pstmt, rs);
	      } // try end
	      return list;
	    }//order_sheet end
	    
	    
	  //내 주문서
	    public OrderDTO order_sheetRead(String order_no) {
	      OrderDTO dto = new OrderDTO();
	      try {
	        con = dbopen.getConnection();
	        sql = new StringBuilder();
	        sql.append(" SELECT order_no, payment_price, id, recipient, delivery_method, address, address_R, tel");
	        sql.append(" FROM order_sheet ");
	        sql.append(" WHERE order_no = ? ");

	        pstmt = con.prepareStatement(sql.toString());
	        pstmt.setString(1, order_no);
	        rs = pstmt.executeQuery();
	        if (rs.next()) {
	            dto = new OrderDTO();
	            dto.setOrder_no(rs.getInt("order_no"));
	            dto.setPayment_price(rs.getInt("payment_price"));
	            dto.setId(rs.getString("id"));
	            dto.setRecipient(rs.getString("recipient"));
	            dto.setDelivery_method(rs.getString("delivery_method"));
	            dto.setAddress(rs.getString("address"));
	            dto.setAddress_R(rs.getString("address_R"));
	            dto.setTel(rs.getString("tel"));
	        } // if end
	      } catch (Exception e) {
	        System.out.println("주문서 read 불러오기 실패:" + e);
	      } finally {
	        DBClose.close(con, pstmt, rs);
	      } // try end
	      return dto;
	    }//order_sheet end
	    
	    
	  //상품 목록 가져오기
	    public ArrayList<RentalDTO> Rental_list(String order_no) {
	      RentalDTO dto = new RentalDTO();
	      ArrayList<RentalDTO> list = new ArrayList<RentalDTO>();
	      try {
	        con = dbopen.getConnection();
	        sql = new StringBuilder();
	        sql.append(" SELECT A.product_no, A.title, A.sub_title, A.product_name, A.price_daily, A.deposit, A.total_quantity, A.remaining_quantity, A.thmb_name, A.id ");
	        sql.append(" FROM rental_list A ");
	        sql.append(" INNER JOIN order_history B ");
	        sql.append(" ON A.product_no = B.product_no ");
	        sql.append(" WHERE B.order_no = ? ");
	        sql.append(" ORDER BY B.order_detail_no DESC ");
	        pstmt = con.prepareStatement(sql.toString());
	        pstmt.setString(1, order_no);
	        rs = pstmt.executeQuery();
	        if (rs.next()) {
	          do {
	            dto = new RentalDTO();
	            dto.setProduct_no(rs.getString("product_no"));
	            dto.setTitle(rs.getString("title"));
	            dto.setSub_title(rs.getString("sub_title"));
	            dto.setProduct_name(rs.getString("product_name"));
	            dto.setPrice_daily(rs.getInt("price_daily"));
	            dto.setDeposit(rs.getInt("deposit"));
	            dto.setTotal_quantity(rs.getInt("total_quantity"));
	            dto.setRemaining_quantity(rs.getInt("remaining_quantity"));
	            dto.setThmb_name(rs.getString("thmb_name"));
	            dto.setId(rs.getString("id"));
	            list.add(dto);
	          } while (rs.next());
	        } else {
	          list = null;
	        } // if end
	      } catch (Exception e) {
	        System.out.println("Category목록 실패:" + e);
	      } finally {
	        DBClose.close(con, pstmt, rs);
	      }
	      return list;
	    }
	    
	  //유저페이지 회원정보
	    public MypageDTO userpage(String id) {
	      MypageDTO dto = new MypageDTO();
	      try {
	        con = dbopen.getConnection();
	        sql = new StringBuilder();
	        sql.append(" SELECT m.pro_name pro_name, m.id id, m.mem_name mem_name, m.email email, m.grade grade, m.joined_date joined_date, p.point point, COUNT(r.evaluation) AS likecnt ");
	        sql.append(" FROM member AS m ");
	        sql.append(" JOIN point AS p ON m.id = p.id ");
	        sql.append(" JOIN rating AS r ON m.id = r.id_receive ");
	        sql.append(" WHERE m.id = ? ");
	        pstmt = con.prepareStatement(sql.toString());
	        pstmt.setString(1, id);
	        rs = pstmt.executeQuery();
	        if (rs.next()) {
	            dto = new MypageDTO();
	            dto.setPro_name(rs.getString("pro_name"));
	            dto.setId(rs.getString("id"));
	            dto.setMem_name(rs.getString("mem_name"));
	            dto.setEmail(rs.getString("email"));
	            dto.setGrade(rs.getString("grade"));
	            dto.setJoined_date(rs.getString("joined_date"));
	            dto.setPoint(rs.getInt("point"));
	            dto.setLikecnt(rs.getInt("likecnt"));
	        }// if end
	      } catch (Exception e) {
	        System.out.println("유저 정보 불러오기 실패:" + e);
	      } finally {
	        DBClose.close(con, pstmt, rs);
	      }//try end
	      return dto;
	    }//userpage end
	    
	    //유저페이지 상품 목록
	    public ArrayList<MypageDTO> user_rental(String id) {
	      try {
	        MypageDTO dto = new MypageDTO();
	        con = dbopen.getConnection();
	        sql = new StringBuilder();
	        sql.append(" SELECT m.id id, l.product_no product_no, l.product_name product_name, l.title title, l.reg_date reg_date ");
	        sql.append(" FROM rental_list AS l ");
	        sql.append(" JOIN member AS m ");
	        sql.append(" ON m.id = l.id ");
	        sql.append(" WHERE m.id = ? ");
	        pstmt = con.prepareStatement(sql.toString());
	        pstmt.setString(1, id);
	        rs = pstmt.executeQuery();
	        if (rs.next()) {
	          user_rental = new ArrayList<MypageDTO>();
	          do {
	            dto = new MypageDTO();
	            dto.setId(rs.getString("id"));
	            dto.setProduct_no(rs.getString("product_no"));
	            dto.setProduct_name(rs.getString("product_name"));
	            dto.setTitle(rs.getString("title"));
	            dto.setReg_date(rs.getString("reg_date"));
	            user_rental.add(dto);
	          } while (rs.next());
	        } else {
	          user_rental = null;
	        }//if end
	      } catch (Exception e) {
	        System.out.println("유저 렌탈 목록 불러오기 실패:" + e);
	      } finally {
	        DBClose.close(con, pstmt, rs);
	      }//try end
	      return user_rental;
	    }//user_rental() end
	    
	    //유저 게시글 목록
	    public ArrayList<BoardDTO> user_board(String id) {
	      try {
	          BoardDTO dto = new BoardDTO();
	          con = dbopen.getConnection();
	          sql = new StringBuilder();
	          sql.append(" SELECT title, contents, post_date, id, postno");
	          sql.append(" FROM board ");
	          sql.append(" WHERE id = ? ");
	          pstmt = con.prepareStatement(sql.toString());
	          pstmt.setString(1, id);
	          rs = pstmt.executeQuery();
	          if (rs.next()) {
	            user_board = new ArrayList<BoardDTO>();
	            do {
	              dto = new BoardDTO();
	              dto.setTitle(rs.getString("title"));
	              dto.setContents(rs.getString("contents"));
	              dto.setPost_date(rs.getString("post_date"));
	              dto.setId(rs.getString("id"));
	              dto.setPostno(rs.getInt("postno"));
	              user_board.add(dto);
	            } while (rs.next());
	          } else {
	            user_board= null;
	          }//if end
	      } catch (Exception e) {
	        System.out.println("커뮤니티 글 목록 불러오기 실패:" + e);
	      } finally {
	        DBClose.close(con, pstmt, rs);
	      }//try end
	      return user_board;
	    }//user_board() end
	    
	    // 프로필사진 이름 가져오기
	    public String getProname(String id) {
	      String name="";
	         try {
	           con=dbopen.getConnection();          
	           sql=new StringBuilder();
	           sql.append(" SELECT pro_name ");
	           sql.append(" FROM member ");
	           sql.append(" WHERE id=? ");
	           pstmt=con.prepareStatement(sql.toString());
	           pstmt.setString(1, id);
	           rs=pstmt.executeQuery();
	           if(rs.next()) {
	             name=rs.getString("pro_name");
	           }
	         }catch (Exception e) {
	           System.out.println("프로필사진 이름가져오기 실패 : " + e);
	         }finally {
	           DBClose.close(con, pstmt, rs);
	         }//try end
	         return name;
	     }
	    
}
