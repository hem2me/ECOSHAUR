package com.cafe24.ecoshaur.payment;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import net.utility.Utility;

@Controller
public class CartCont {
  @Autowired
  private CartDAO dao;
  

  public CartCont() {
    System.out.println("---CartCont()객체 생성 됨");
  }
  
//�긽�꽭蹂닿린
   @RequestMapping(value = "Cart.do", method = RequestMethod.GET)
   public ModelAndView list(String id, int nowpage) {
     int recordPerPage = 4;
     int endRow   = nowpage * recordPerPage;
     ModelAndView mav = new ModelAndView();
     
     mav.setViewName("cart/Cart");
     mav.addObject("cart_list", dao.list(id, nowpage, recordPerPage));
     mav.addObject("rental_list", dao.rental_pdlist(id, nowpage, recordPerPage));
     mav.addObject("id", id);
     mav.addObject("price", dao.total(id));
    
     mav.addObject("recordPerPage", recordPerPage);
     mav.addObject("end", endRow);
     mav.addObject("nowpage", nowpage);
     mav.addObject("count", dao.count(id));
     return mav;
   }// read() end
   
   // �옣諛붽뎄�땲 異붽�
   @RequestMapping(value = "Cart.do", method = RequestMethod.POST)
   public ModelAndView add(int price_daily, int deposit, CartDTO dto, int nowpage) {
     ModelAndView mav = new ModelAndView();
     mav.setViewName("member/msgView");
     
     // 珥앷툑�븸 怨꾩궛
     int total_price = (price_daily*dto.getQuantity())*(Integer.parseInt(dto.getRental_period())) + deposit;
     dto.setTotal_price(total_price);
     
     // �옣諛붽뎄�땲 異붽�
     dao.create(dto);
     
     mav.addObject("msg1", "<script>window.location.href = 'Cart.do?nowpage=1&id=" + dto.getId() + "';</script>");
     
     return mav;
   }// read() end
   
  //�옣諛붽뎄�땲 寃곗젣�럹�씠吏�
  @RequestMapping(value = "Cartpayment.do", method = RequestMethod.GET)
  public ModelAndView rental_pdlist(String id, int nowpage) {
    int recordPerPage = 4;
    int endRow   = nowpage * recordPerPage;
    ModelAndView mav = new ModelAndView();
    
    mav.setViewName("cart/Cartpayment");
    mav.addObject("cart_list", dao.list(id, nowpage, recordPerPage));
    mav.addObject("rental_list", dao.rental_pdlist(id, nowpage, recordPerPage));
    mav.addObject("point", dao.Point(id));
    mav.addObject("id", id);
    mav.addObject("total_price", dao.total_price(id));
    
    mav.addObject("recordPerPage", recordPerPage);
    mav.addObject("end", endRow);
    mav.addObject("nowpage", nowpage);
    mav.addObject("count", dao.count(id));
    return mav;
  }// read() end

  /* point          : point
   * cid            : id
   * payment        : 二쇰Ц�궡�뿭�꽌 
   * credit_card    : 二쇰Ц�궡�뿭�꽌
   * card_num       : 二쇰Ц�궡�뿭�꽌
   * address        : 二쇰Ц�꽌
   * address_r      : 二쇰Ц�꽌
   * delivery_method: 二쇰Ц�꽌
   * tel            : 二쇰Ц�꽌
   * 
   * point�뒗 id�� point瑜� 媛��졇���꽌 �룷�씤�듃媛먯냼 怨꾩궛 �뀋
   * 二쇰Ц�꽌�뒗 odto�� id, �룷�씤�듃瑜� 怨꾩궛�븳 珥앷껐�젣湲덉븸, 寃곗젣�긽�뭹媛��닔,  二쇰Ц�꽌踰덊샇瑜� 怨꾩궛�썑 媛��졇���꽌 �엯�젰
   * 二쇰Ц�궡�뿭�꽌�뒗 ohdto�� id, �룷�씤�듃瑜� 怨꾩궛�븳 珥앷껐�젣湲덉븸, 二쇰Ц�꽌踰덊샇 媛��졇���꽌 id瑜� �씠�슜�빐�꽌 移댄듃�뀒�씠釉붿뿉 �긽�뭹踰덊샇, �닔�웾媛��졇�삤怨� �엯�젰
   */
  
  @RequestMapping(value = "Cartpayment.do", method = RequestMethod.POST)
  public ModelAndView cartpayproc(String cid, OrderDTO odto, OrderHistoryDTO ohdto, PointDTO pdto) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("cart/msgView");
    
    // �룷�씤�듃瑜� 怨꾩궛�븳 珥앷껐�젣湲덉븸
    int total_price = dao.total_price(cid) - pdto.getPoint();
    // �옣諛붽뎄�땲 媛��닔
    int cartcnt = dao.get_cartCnt(cid);
    // 二쇰Ц�꽌踰덊샇 �옉�뾽
    int number = dao.OMax_code()+1;        // 移댄뀒怨좊━肄붾뱶�뿉 �빐�떦�븯�뒗 �긽�뭹紐⑸줉踰덊샇 理쒕�媛� 媛��졇�삤湲�
    // �옣諛붽뎄�땲 由ъ뒪�듃 (�긽�뭹踰덊샇 order)
    ArrayList<CartDTO> cdto = new ArrayList<CartDTO>();
    cdto = dao.list(cid);
    // �긽�뭹紐⑸줉 蹂댁쬆湲� (�긽�뭹踰덊샇 order)
    ArrayList<RentalDTO> rdto = new ArrayList<RentalDTO>();
    rdto = dao.rental_pdlist(cid);
    
    // �룷�씤�듃 利앷컧 �엯�젰
    int point_cnt = dao.pointUpdate(cid, pdto);
    if(point_cnt != 0)
      point_cnt = 1;
    // 二쇰Ц�꽌 �엯�젰
    int order_cnt = dao.order_create(odto, cid, total_price, number, cartcnt);
    if(order_cnt != 0)
      order_cnt = 1;
    // 二쇰Ц�궡�뿭�꽌 �엯�젰
    int orderhistory = dao.orderhistory_create(ohdto, cid, number, cdto, rdto, total_price);
    if(orderhistory != 0)
      orderhistory = 1;
    
    // �긽�뭹 媛��닔 �닔�젙
    for(int i=0;i<cdto.size();i++) {
      int qq = dao.rental_quantity(cdto.get(i).getProduct_no());
      int stat = qq - cdto.get(i).getQuantity();
      
      if(stat == 0) {
        dao.change_stat(cdto.get(i).getProduct_no());
      }
      else {
        dao.change_quantity(cdto.get(i).getProduct_no(), stat);
      }
    }
    
    // �옣諛붽뎄�땲 �궘�젣 
    int cart_del = dao.cart_del(cid);
    if(cart_del != 0)
      cart_del = 1;
    
    // �룷�씤�듃 �궗�슜�븞�뻽�쑝硫� 200 �룷�씤�듃 異붽�
    if(pdto.getPoint() == 0)
      dao.setpoint(cid, 200);
    
    int check = point_cnt + order_cnt + orderhistory + cart_del;
    
    if (check != 4) {
      mav.addObject("msg1", "<script>alert('寃곗젣�뿉 �떎�뙣�븯���뒿�땲�떎'); window.location.href = './';</script>");
    } else {
      mav.addObject("msg1", "<script>alert('寃곗젣�뿉 �꽦怨듯븯���뒿�땲�떎'); window.location.href = './';</script>");
    }

    return mav;
  }// read() end
  
  
// �옣諛붽뎄�땲 �궘�젣
 @RequestMapping(value = "CartDel.do")
 public ModelAndView CategoryList(int cart_no, HttpSession session) {   
     ModelAndView mav = new ModelAndView();
     mav.setViewName("member/msgView");
     String id=(String) session.getAttribute("id");
     
     dao.delete(cart_no);
     
     mav.addObject("msg1", "<script>window.location.href = 'Cart.do?nowpage=1&id=" + id + "';</script>");
     
     return mav;
 }// CategoryList() end
 
 
//諛섎궔肄붾뱶 �떊泥�
 @RequestMapping(value = "borrow.do", method = RequestMethod.GET)
 public ModelAndView borrow(int order_no) {
   ModelAndView mav = new ModelAndView();
   
   mav.setViewName("member/msgView");
   
   int cnt = dao.change_borrow(order_no, "A");
   
   if (cnt == 0) {
     mav.addObject("msg1", "<script>alert('諛섎궔�떊泥��뿉 �떎�뙣�븯���뒿�땲�떎'); window.location.href = 'mypage.do';</script>");
   } else {
     mav.addObject("msg1", "<script>alert('諛섎궔�떊泥��뿉 �꽦怨듯븯���뒿�땲�떎'); window.location.href = 'mypage.do';</script>");
   }
   
   return mav;
 }// read() end
 
  
}
