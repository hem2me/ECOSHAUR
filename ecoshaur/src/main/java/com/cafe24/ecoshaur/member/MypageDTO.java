package com.cafe24.ecoshaur.member;

public class MypageDTO {
	private String id_receive;		//마이페이지
	private String product_no;		//마이페이지
	private String product_name;	//마이페이지
	private String title;			//마이페이지
	private String reg_date;		//마이페이지
	
	private String pro_name;		//유저페이지
	private String id;				//유저페이지
	private String mem_name;		//유저페이지
	private String email;			//유저페이지
	private String grade;			//유저페이지
	private String joined_date;		//유저페이지
	private int point;				//유저페이지
	private int likecnt;			//유저페이지
	
	public MypageDTO() {}
	
	public MypageDTO(String id_receive, String product_no, String product_name, String title, String reg_date, String pro_name, String id, String mem_name, String email, String grade, String joined_date, int point, int likecnt) {
		this.id_receive = id_receive;
		this.product_no = product_no;
		this.product_name = product_name;
		this.title = title;
		this.reg_date = reg_date;
		this.pro_name = pro_name;
		this.id = id;
		this.mem_name = mem_name;
		this.email = email;
		this.grade = grade;
		this.joined_date = joined_date;
		this.point = point;
		this.likecnt = likecnt;
	}

	public String getId_receive() {
		return id_receive;
	}

	public void setId_receive(String id_receive) {
		this.id_receive = id_receive;
	}

	public String getProduct_no() {
		return product_no;
	}

	public void setProduct_no(String product_no) {
		this.product_no = product_no;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getReg_date() {
		return reg_date;
	}

	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}

	public String getPro_name() {
		return pro_name;
	}

	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getMem_name() {
		return mem_name;
	}

	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}
	
	public String getJoined_date() {
		return joined_date;
	}

	public void setJoined_date(String joined_date) {
		this.joined_date = joined_date;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public int getLikecnt() {
		return likecnt;
	}

	public void setLikecnt(int likecnt) {
		this.likecnt = likecnt;
	}
	
}
