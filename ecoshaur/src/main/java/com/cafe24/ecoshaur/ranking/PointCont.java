package com.cafe24.ecoshaur.ranking;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import net.utility.Utility;

@Controller
public class PointCont {
 
  @Autowired
  private PointDAO dao;
  
  public PointCont() {
	  System.out.println("---PointCont()객체 생성 됨");
  }
  
  @RequestMapping(value = "Point.do", method = RequestMethod.GET)
  public ModelAndView List() {
	  ModelAndView mav = new ModelAndView();
	  mav.setViewName("rank/pointList");   
	  mav.addObject("root", Utility.getRoot());
	  mav.addObject("list", dao.list());	 	
	  return mav;
  }//PointList() end
 
}
