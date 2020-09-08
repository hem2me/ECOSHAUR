package com.cafe24.ecoshaur.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.cafe24.ecoshaur.admin.AdminDAO;

import net.utility.UploadSaveManager;
import net.utility.Utility;

@Controller
public class AdminCont {
  @Autowired
  private AdminDAO dao;

  public AdminCont() {
    System.out.println("---AdminCont()객체 생성 됨");
  }
  
//�긽�꽭蹂닿린
 @RequestMapping(value = "admin/index.do", method = RequestMethod.GET)
 public ModelAndView index() {
   ModelAndView mav = new ModelAndView();
   mav.setViewName("admin/index");     
   
   // 珥앷툑�븸
   mav.addObject("total_price", dao.total_price());
   
   // �떊洹쒗쉶�썝 �닔
   mav.addObject("new_user", dao.new_user());
   
   // 諛⑸Ц�옄 �닔
   mav.addObject("visitor", dao.visitor());
   
   // 嫄곕옒 珥� 媛��닔
   mav.addObject("total_order", dao.total_order());
   
   // 理쒓렐 嫄곕옒紐⑸줉
   // Rental
   mav.addObject("Rlist", dao.Rental_list());
   // Order_history
   mav.addObject("Olist", dao.orderhistory_list());
   // Order_sheet -> id
   mav.addObject("IDlist", dao.ID_list());
   
   // top �룷�씤�듃
   mav.addObject("top_point", dao.top_point());
   
   // �솚遺� TOP �닚�쐞
   mav.addObject("topFail_rental", dao.topFail_rental());
   mav.addObject("topFail_condition", dao.topFail_condition()); // Deposit �쑝濡� 諛쏆쓬
   
   // 移댄뀒怨좊━蹂� �슂�빟紐⑸줉
   mav.addObject("Category_info", dao.Category_info());
   return mav;
 }// read() end
  
  //理쒓렐 二쇰Ц紐⑸줉
  @RequestMapping(value = "admin/pages/newOrderList.do", method = RequestMethod.GET)
  public ModelAndView newOrderList() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("admin/pages/newOrderList");     
    
    // 理쒓렐 嫄곕옒紐⑸줉
    // Rental
    mav.addObject("Rlist", dao.Rental_list_t());
    // Order_history
    mav.addObject("Olist", dao.orderhistory_list_t());
    // Order_sheet -> id
    mav.addObject("IDlist", dao.ID_list_t());
    
    return mav;
  }
  
  //Top �룷�씤�듃
  @RequestMapping(value = "admin/pages/top_point.do", method = RequestMethod.GET)
  public ModelAndView top_point() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("admin/pages/top_point");     
    
 // top �룷�씤�듃
    mav.addObject("top_point", dao.top_point_t());
    
    return mav;
  }
  
  
  // top �솚遺� 
  @RequestMapping(value = "admin/pages/BadTopUser.do", method = RequestMethod.GET)
  public ModelAndView badTopuser() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("admin/pages/BadTopUser");     
    
 // �솚遺� TOP �닚�쐞
    mav.addObject("topFail_rental", dao.topFail_rental_t());
    mav.addObject("topFail_condition", dao.topFail_condition_t()); // Deposit �쑝濡� 諛쏆쓬
    
    return mav;
  }
  
//�쉶�썝 愿�由�
 @RequestMapping(value = "admin/pages/member_list.do", method = RequestMethod.GET)
 public ModelAndView member_list() {
   ModelAndView mav = new ModelAndView();
   mav.setViewName("admin/pages/member_list");     
   
   // �쉶�썝紐⑸줉 由ъ뒪�듃
   mav.addObject("list", dao.member_list());
   
   return mav;
 }
 

  //�쉶�썝 愿�由� �닔�젙
  @RequestMapping(value = "admin/pages/member_manager.do", method = RequestMethod.GET)
  public ModelAndView member_manager(String id) {
    ModelAndView mav = new ModelAndView();
    
    mav.setViewName("admin/pages/member_manager");
    
    mav.addObject("mymem", dao.member_read(id));
    return mav;
  }
  
  //�쉶�썝 愿�由� �닔�젙
  @RequestMapping(value = "admin/pages/member_manager.do", method = RequestMethod.POST)
    public ModelAndView member_managerProc(MemberDTO dto, String old_pro_name, HttpServletRequest req) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("member/msgView");
    if(dto.getPro_name1().getSize() != 0) {
  //---------------------------------------------------------------------------
      String basePath = req.getRealPath("member/storage");
      MultipartFile pro_name1 = dto.getPro_name1();
      String poster = UploadSaveManager.saveFileSpring30(pro_name1, basePath);
      dto.setPro_name(poster);
    }
 //---------------------------------------------------------------------------
    else {
      dto.setPro_name(old_pro_name);
    }
    int cnt=dao.update(dto);
    if(cnt!=1) {  
        mav.addObject("msg1", "<script>alert('�쉶�썝�닔�젙�뿉 �떎�뙣�븯���뒿�땲�떎'); window.location.href = 'member_list.do';</script>");
      } else {
        mav.addObject("msg1", "<script>alert('�쉶�썝�닔�젙�뿉 �꽦怨듯븯���뒿�땲�떎'); window.location.href = 'member_list.do';</script>");
      }
    
    return mav;
  }
  
  
  // �쉶�썝 �룷�씤�듃
  @RequestMapping(value = "admin/pages/point.do", method = RequestMethod.GET)
  public ModelAndView member_point() {
    ModelAndView mav = new ModelAndView();
    
    mav.setViewName("admin/pages/point");
    
    //point
    mav.addObject("point", dao.point());
    // �쉶�썝紐⑸줉 由ъ뒪�듃
    mav.addObject("list", dao.member_list());
    
    return mav;
  }
  
  // �쉶�썝 �룷�씤�듃
  @RequestMapping(value = "admin/pages/point.do", method = RequestMethod.POST)
  public ModelAndView member_pointProc(PointDTO dto) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("admin/pages/msgView");
    
    int cnt = dao.point_insert(dto);
    
    if(cnt!=1) {  
      mav.addObject("msg1", "<script>alert('�룷�씤�듃利앷컧�뿉 �떎�뙣�븯���뒿�땲�떎'); window.location.href = 'point.do';</script>");
      return mav;
    }
    else {
      mav.addObject("msg1", "<script>window.location.href = 'point.do';</script>");
      return mav;
    }
  }

  // �쉶�썝 醫뗭븘�슂/�떕�뼱�슂
  @RequestMapping(value = "admin/pages/rating.do", method = RequestMethod.GET)
  public ModelAndView member_rating() {
    ModelAndView mav = new ModelAndView();
    
    mav.setViewName("admin/pages/rating");
    
    //rating
    mav.addObject("rating", dao.rating());
    // �쉶�썝紐⑸줉 由ъ뒪�듃
    mav.addObject("list", dao.member_list());

    // Rental
    mav.addObject("Rlist", dao.rental_list());
    
    
    return mav;
  }
  
  
  // �쉶�썝 醫뗭븘�슂/�떕�뼱�슂
  @RequestMapping(value = "admin/pages/rating.do", method = RequestMethod.POST)
  public ModelAndView member_ratingProc(RatingDTO dto) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("admin/pages/msgView");
    
    dto.setId_receive(dao.rental_writer(dto.getNo()));
    int cnt = dao.rating_insert(dto);
    
    if(cnt!=1) {  
      mav.addObject("msg1", "<script>alert('�룊媛��엯�젰�뿉 �떎�뙣�븯���뒿�땲�떎'); window.location.href = 'rating.do';</script>");
      return mav;
    }
    else {
      mav.addObject("msg1", "<script>window.location.href = 'rating.do';</script>");
      return mav;
    }
  }
  
  // �긽�뭹紐⑸줉
  @RequestMapping(value = "admin/pages/rental_list.do", method = RequestMethod.GET)
  public ModelAndView rental_list() {
    ModelAndView mav = new ModelAndView();
    
    mav.setViewName("admin/pages/rental_list");
    
    // Rental
    mav.addObject("Rlist", dao.rental_list());
    
    
    return mav;
  }
  
  // �긽�뭹�닔�젙
  @RequestMapping(value = "admin/pages/rental_manager.do", method = RequestMethod.GET)
  public ModelAndView rental_manager(String product_no) {
    ModelAndView mav = new ModelAndView();
    
    mav.setViewName("admin/pages/rental_manager");
    
 // Rental
    mav.addObject("dto", dao.rental_read(product_no));
    
    RentalDTO dto = dao.rental_read(product_no);
    String reg_date = dto.getReg_date().substring(0, 10);
    mav.addObject("reg_date", reg_date);
    String code = dao.rental_code(product_no);
    String minor = dao.category_minor(code);
    mav.addObject("select_minor", minor);
    mav.addObject("minor", dao.MNcategory());
    return mav;
  }
  
//�긽�뭹�닔�젙
 @RequestMapping(value = "admin/pages/rental_manager.do", method = RequestMethod.POST)
 public ModelAndView rental_managerProc(RentalDTO dto, String old_thmb_name, String old_image_name, String ctCode, HttpServletRequest req) {
   ModelAndView mav = new ModelAndView();
   mav.setViewName("member/msgView");
   
   // �긽�뭹�냼遺꾨쪟 -> �긽�뭹肄붾뱶 蹂��솚 -> dto�뿉 �꽭�똿
   String code = dao.category_code(ctCode);
   dto.setCategory_code(code);
   
//-----------------------------------------------------------------------------------
   // �뜽�꽕�씪�뙆�씪 �씠由� ���옣
   if(dto.getPosterMF().getSize() != 0) {
     String basePath = req.getRealPath("category/storage");
     MultipartFile PosterMF = dto.getPosterMF();
     String poster = UploadSaveManager.saveFileSpring30(PosterMF, basePath);
     dto.setThmb_name(poster);
   }
   else {
     dto.setThmb_name(old_thmb_name);
   }
   
   // �씠誘몄��뙆�씪 �씠由� ���옣 
   if(dto.getFilenameMF().getSize() != 0) {
     String basePath = req.getRealPath("category/storage");
     MultipartFile filenameMF = dto.getFilenameMF();
     String poster = UploadSaveManager.saveFileSpring30(filenameMF, basePath);
     dto.setImage_name(poster);
   }
//---------------------------------------------------------------------------
   else {
     dto.setImage_name(old_image_name);
   }
   String saveDirectory = Utility.getRoot();
   
   
   int cnt=dao.rental_update(dto, saveDirectory);
   if(cnt!=1) {  
       mav.addObject("msg1", "<script>alert('�긽�뭹�닔�젙�뿉 �떎�뙣�븯���뒿�땲�떎'); window.location.href = 'rental_list.do';</script>");
     } else {
       mav.addObject("msg1", "<script>alert('�긽�뭹�닔�젙�뿉 �꽦怨듯븯���뒿�땲�떎'); window.location.href = 'rental_list.do';</script>");
     }
   
   return mav;
 }
  
  
//二쇰Ц�꽌 紐⑸줉
@RequestMapping(value = "admin/pages/order_list.do", method = RequestMethod.GET)
public ModelAndView order_list() {
  ModelAndView mav = new ModelAndView();
  mav.setViewName("admin/pages/order_list");     
  
  // �쉶�썝紐⑸줉 由ъ뒪�듃
  mav.addObject("list", dao.Order_list());
  
  return mav;
}

//二쇰Ц�꽌 紐⑸줉 �닔�젙 
@RequestMapping(value = "admin/pages/order_manager.do", method = RequestMethod.GET)
public ModelAndView order_manager(String order_no) {
  ModelAndView mav = new ModelAndView();
  
  mav.setViewName("admin/pages/order_manager");
  
  mav.addObject("ord", dao.order_read(order_no));
  return mav;
}

//二쇰Ц�꽌 紐⑸줉 �닔�젙
@RequestMapping(value = "admin/pages/order_manager.do", method = RequestMethod.POST)
  public ModelAndView Order_manager(OrderDTO dto, HttpServletRequest req) {
  ModelAndView mav = new ModelAndView();
  mav.setViewName("member/msgView");

  int cnt=dao.order_update(dto);
  if(cnt!=1) {  
      mav.addObject("msg1", "<script>alert('二쇰Ц�꽌 紐⑸줉 �닔�젙�뿉 �떎�뙣�븯���뒿�땲�떎'); window.location.href = 'order_list.do';</script>");
    } else {
      mav.addObject("msg1", "<script>alert('二쇰Ц�꽌 紐⑸줉 �닔�젙�뿉 �꽦怨듯븯���뒿�땲�떎'); window.location.href = 'order_list.do';</script>");
    }
  
  return mav;
}
  
//二쇰Ц�궡�뿭�꽌 紐⑸줉
@RequestMapping(value = "admin/pages/orderh_list.do", method = RequestMethod.GET)
public ModelAndView orderh_list() {
ModelAndView mav = new ModelAndView();
mav.setViewName("admin/pages/orderh_list");
//二쇰Ц�궡�뿭�꽌 紐⑸줉 由ъ뒪�듃                                                                     
mav.addObject("list", dao.Orderh_list());
return mav;     
}
//二쇰Ц�궡�뿭�꽌 紐⑸줉 �닔�젙 
@RequestMapping(value = "admin/pages/orderh_manager.do", method = RequestMethod.GET)
public ModelAndView orderh_manager(String order_detail_no) {
ModelAndView mav = new ModelAndView();

mav.setViewName("admin/pages/orderh_manager");

mav.addObject("ordh", dao.orderh_read(order_detail_no));
return mav;
}

//二쇰Ц�궡�뿭�꽌 紐⑸줉 �닔�젙
@RequestMapping(value = "admin/pages/orderh_manager.do", method = RequestMethod.POST)
public ModelAndView Orderh_manager(OrderHistoryDTO dto, HttpServletRequest req) {
ModelAndView mav = new ModelAndView();
mav.setViewName("member/msgView");

int cnt=dao.orderh_update(dto);
if(cnt!=1) {  
  mav.addObject("msg1", "<script>alert('二쇰Ц�궡�뿭�꽌 紐⑸줉 �닔�젙�뿉 �떎�뙣�븯���뒿�땲�떎'); window.location.href = 'orderh_list.do';</script>");
} else {
  mav.addObject("msg1", "<script>alert('二쇰Ц�궡�뿭�꽌 紐⑸줉 �닔�젙�뿉 �꽦怨듯븯���뒿�땲�떎'); window.location.href = 'orderh_list.do';</script>");
}

return mav;
}
  
  
  
  
}
