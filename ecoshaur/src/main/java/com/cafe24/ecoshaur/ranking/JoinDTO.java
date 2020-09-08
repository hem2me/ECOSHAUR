package com.cafe24.ecoshaur.ranking;


public class JoinDTO {
  private String id; 			
  private String pro_name;		
  private String mem_name;		
  private String grade;			
  private int point;			
  private String evaluation;	
  private String id_receive;	
  private int cnt;			

  
  public JoinDTO() {}
  
  public JoinDTO(String id, String pro_name, String mem_name, String grade, int point, String evaluation, String id_receive, int cnt) {
	  this.id = id;
	  this.pro_name = pro_name;
	  this.mem_name = mem_name;
	  this.grade = grade;
	  this.point = point;
	  this.evaluation = evaluation;
	  this.id_receive = id_receive;
	  this.cnt = cnt;
  }

  public String getId() {
	  return id;
  }

  public void setId(String id) {
	  this.id = id;
  }

  public String getPro_name() {
	  return pro_name;
  }

  public void setPro_name(String pro_name) {
	  this.pro_name = pro_name;
  }

  public String getMem_name() {
	  return mem_name;
  }

  public void setMem_name(String mem_name) {
	  this.mem_name = mem_name;
  }

  public String getGrade() {
	  return grade;
  }

  public void setGrade(String grade) {
	  this.grade = grade;
  }

  public int getPoint() {
	  return point;
  }

  public void setPoint(int point) {
	  this.point = point;
  }

  public String getEvaluation() {
	  return evaluation;
  }

  public void setEvaluation(String evaluation) {
	  this.evaluation = evaluation;
  }

  public String getId_receive() {
	  return id_receive;
  }

  public void setId_receive(String id_receive) {
	  this.id_receive = id_receive;
  }

public int getCnt() {
	return cnt;
}

public void setCnt(int cnt) {
	this.cnt = cnt;
}
 
  
}
