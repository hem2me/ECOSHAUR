package com.cafe24.ecoshaur.ranking;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


import net.utility.DBClose;
import net.utility.DBOpen;

@Component
public class PointDAO {
	@Autowired
	private DBOpen dbopen;
	
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	StringBuilder sql = null;
	ArrayList<PointDTO> pointlist = null;
	ArrayList<JoinDTO> list = null;
	
	
	public PointDAO() {
	}

	/*
	 MySQL Client
	 SELECT m.id, m.pro_name, m.mem_name, m.grade, p.point
	 FROM point AS p 
	 JOIN member AS m 
	 ON p.id=m.id 
	 ORDER BY point DESC;
	 
	 RNUM
	 sql.append(" SELECT *  ");
	 sql.append(" FROM( ");
	 sql.append(" 		SELECT A.*, @rownum:=@rownum+1 AS RNUM ");
	 sql.append(" 		FROM( ");
	 sql.append(" 				SELECT m.pro_name, m.mem_name, p.point ");
	 sql.append(" 				FROM point AS p ");
	 sql.append(" 				JOIN member AS m ON p.id=m.id ");
	 sql.append(" 				JOIN(SELECT @rownum:=0) R ");
	 sql.append(" 			) AS A ");
	 sql.append(" 		ORDER BY point DESC ");
	 sql.append(" 	  ) AS B ");
	 sql.append(" WHERE RNUM BETWEEN 1 AND 10; ");
	*/
	
	public ArrayList<JoinDTO> list() {
		try {
			JoinDTO dto = new JoinDTO();
			con = dbopen.getConnection();
			sql = new StringBuilder();
			sql.append(" SELECT m.id, m.pro_name, m.mem_name, m.grade, p.point ");
			sql.append(" FROM point AS p ");
			sql.append(" JOIN member AS m ");
			sql.append(" ON p.id=m.id ");
			sql.append(" ORDER BY point DESC ");  
			pstmt = con.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				list = new ArrayList<JoinDTO>();
				do {
					dto = new JoinDTO();
					dto.setId(rs.getString("id"));
					dto.setPro_name(rs.getString("pro_name"));
					dto.setMem_name(rs.getString("mem_name"));
					dto.setGrade(rs.getString("grade"));
					dto.setPoint(rs.getInt("point"));
					list.add(dto);
				} while (rs.next());
			} else {
				list = null;
			}//if end
		} catch (Exception e) {
			System.out.println("포인트 순위 불러오기 실패:" + e);
		} finally {
			DBClose.close(con, pstmt, rs);
		}//try end
		return list;
	}//list end


}
