
package com.cafe24.ecoshaur;


import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.cafe24.ecoshaur.admin.OrderDTO;
import com.cafe24.ecoshaur.category.RentalDAO;
import com.cafe24.ecoshaur.home.HomeDTO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
  
  @Autowired
  private SearchDAO dao;
  
  // http://localhost:9090/ecoshaur/
  @RequestMapping(value = "index.do", method=RequestMethod.GET)
  public ModelAndView home() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("index");
    mav.addObject("mainlist", dao.mainlist());
    
    try {
      // 휴면계정 업데이트
      dao.human_update();
      
      // 보증금받을사람 리스트 받아오기
      ArrayList<OrderDTO> list = new ArrayList<OrderDTO>();
      list = dao.des_list();
      
      // 보증금 받을사람 등급업데이트
      dao.des_update();
      
      // 보증금 받은사람들 보증금리스트에서 지우기
      if(list.size() !=0) {
        for(int i=0;i<list.size();i++) {
          dao.cart_del(list.get(i).getOrder_no());
        } 
      }
    }catch(Exception e) { }
    
    return mav;
  }//home() end
  
  @RequestMapping(value = "search.do", method = RequestMethod.GET)
  public ModelAndView search(String search) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("search");  
    
    mav.addObject("Rlist", dao.rental_search(search));
    mav.addObject("Blist", dao.board_search(search));
    mav.addObject("search", search);
    
    
    return mav;
  }// read() end
  
  
  @RequestMapping(value = "404error.do")
  public String error() {
    return "error";
  }
}// class end