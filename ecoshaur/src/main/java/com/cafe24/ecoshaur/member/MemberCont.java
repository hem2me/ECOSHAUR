package com.cafe24.ecoshaur.member;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.Cookie;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.cafe24.ecoshaur.category.RentalDTO;

import net.utility.UploadSaveManager;
import net.utility.Utility;

@Controller
public class MemberCont {
  
  @Autowired
  private MemberDAO dao;
  @Autowired
  private JavaMailSender mailSender;
  
  public MemberCont() {
    System.out.println("---MemberCont()객체 생성 됨");
  }  
   
//濡쒓렇�씤
  @RequestMapping(value="login.do", method=RequestMethod.GET)
  public ModelAndView loginForm(MemberDTO dto) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("member/loginForm");
    mav.addObject("root", Utility.getRoot());
 
    return mav;
  }//createForm() end
  
  
  	//濡쒓렇�씤 寃곌낵
  @RequestMapping(value = "loginProc.do", method = RequestMethod.POST)
	public ModelAndView loginProc(MemberDTO dto, HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		String grade = dao.loginProc(dto);
		HttpSession session = request.getSession();
		String id=null;
		if (grade != null) {
			mav.setViewName("member/loginProc");
			id=dto.getId();
			String pro_name = dao.getProname(id);
			session.setAttribute("id", id);
			session.setAttribute("grade", grade);
			session.setAttribute("pro_name", pro_name);
			// 理쒓렐濡쒓렇�씤 �뾽�뜲�씠�듃
			dao.lastdate(id);
		}else {
			mav.setViewName("member/msgView");
			mav.addObject("msg1", "<script>alert('濡쒓렇�씤�뿉 �떎�뙣�븯���뒿�땲�떎'); window.history.back();</script>");
		}
		
		return mav;
	}
  
	//濡쒓렇�븘�썐
	@RequestMapping(value = "logout.do", method = RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();

		mav.setViewName("member/logout");
		session.invalidate();

		return mav;
	}
  
  //�빟愿��룞�쓽
  @RequestMapping(value="agree.do", method=RequestMethod.GET)
  public ModelAndView agreement(HttpSession session) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("member/agreement");
    mav.addObject("root", Utility.getRoot());
 
    return mav;
  }//createForm() end
  
  
//荑좏궎瑜� �솢�슜�븯�뿬 �븘�씠�뵒 以묐났�솗�씤�쓣 �빐�빞留� �쉶�썝媛��엯 �븳�떎
 @RequestMapping("memberForm.do")
 public void idCheckProc3(HttpServletRequest req, HttpServletResponse resp) {
	 String uid=req.getParameter("uid");
	 
	 if(uid != null) {
		 try{
			 int cnt=dao.duplicateID(uid);
		     System.out.println("asd");
		     //1)text�쓳�떟-----------------------
		     /*
		     resp.setContentType("text/plain; charset=UTF-8");
		     PrintWriter out=resp.getWriter();
		     out.println(cnt);
		     out.flush();
		     out.close();
		     */ 
		     
		     //2)json�쓳�떟-----------------------
		     // https://mvnrepository.com�뿉�꽌
		     // json-simple寃��깋�썑 
		     // pom.xml�뿉 �쓽議댁꽦 異붽��빐�빞 �븿
		     JSONObject json=new JSONObject();
		     //json.put(key, value)
		     json.put("count", cnt);
		     resp.setContentType("text/plain; charset=UTF-8");
		     PrintWriter out=resp.getWriter();
		     out.println(json.toString());
		     out.flush();
		     out.close();
    
		 }catch (Exception e) {
		     System.out.println("�븘�씠�뵒以묐났�솗�씤荑좏궎�떎�뙣:"+e);
		   }//try end
	 }

   
 }//idCheckProc3() end
   
  //�쉶�썝媛��엯
  @RequestMapping(value="memberForm.do", method=RequestMethod.GET)
  public ModelAndView memberForm(MemberDTO dto, HttpServletRequest req, HttpSession session) throws Exception{
	  ModelAndView mav=new ModelAndView();
	  mav.setViewName("member/memberForm");
	  mav.addObject("root", Utility.getRoot());
	  
	  return mav;
  }//memberForm() end
  
//�쉶�썝媛��엯 寃곌낵
  @RequestMapping(value="memberProc.do", method=RequestMethod.POST)
  public ModelAndView memberProc(MemberDTO dto, HttpServletRequest req, HttpSession session) throws Exception {
	  ModelAndView mav = new ModelAndView();
	  
	  mav.addObject("check", dao.insertmember(dto));
	  
	  mav.setViewName("member/memberProc");
	  return mav;
  }
  
  //�쉶�썝�젙蹂� 蹂닿린
  @RequestMapping(value="mypage.do", method=RequestMethod.GET)
  public ModelAndView mypage(HttpServletRequest request, HttpSession session ){
	  ModelAndView mav = new ModelAndView();
	  String id=(String) session.getAttribute("id");
	  mav.addObject("mymem", dao.read(id));
	  mav.addObject("mypage", dao.mypage(id));
	  mav.addObject("order_sheet", dao.order_sheet(id));
	  mav.addObject("board_list", dao.board_list(id));
	  mav.addObject("qna_list", dao.qna_list(id));
	  mav.addObject("point_p", dao.point_p(id));
	  mav.addObject("point_m", dao.point_m(id));
	  mav.addObject("rating_good", dao.rating_good(id));
	  mav.addObject("rating_bad", dao.rating_bad(id));
	   
	  mav.setViewName("member/mypage");
	  return mav;
  }
  
  	//�쉶�썝�닔�젙
	@RequestMapping(value="ModifyForm.do", method=RequestMethod.GET)
	  public ModelAndView ModifyForm(String id) {
	    ModelAndView mav = new ModelAndView();
	    mav.setViewName("member/ModifyForm");
	    mav.addObject("mymem", dao.read(id));
	    return mav;
	  }//ModifyForm() end
	  
	
	  //�쉶�썝�닔�젙
	  @RequestMapping(value="ModifyProc.do", method=RequestMethod.POST)
	  public ModelAndView ModifyProc(MemberDTO dto ) {
	    ModelAndView mav = new ModelAndView();
	    mav.setViewName("member/msgView");
	    int cnt=dao.update(dto);
	    if(cnt!=1) { 
	        mav.addObject("msg1", "<script>alert('�쉶�썝�닔�젙�뿉 �떎�뙣�븯���뒿�땲�떎'); window.location.href = '../login.do';</script>");
	      } else {
	        mav.addObject("msg1", "<script>alert('�쉶�썝�닔�젙�뿉 �꽦怨듯븯���뒿�땲�떎'); window.location.href = '../login.do';</script>");
	      }
	    
	    return mav;
	  }//ModifyProc() end
	  
	//�쉶�썝�깉�눜
		@RequestMapping(value="delete.do", method=RequestMethod.GET)
		public ModelAndView deleteForm(HttpSession session) {
		      ModelAndView mav = new ModelAndView();
		      mav.setViewName("member/memberdel");

		      return mav;
		  }//deleteForm() end

		//�쉶�썝�깉�눜
		@RequestMapping(value="deleteProc.do", method=RequestMethod.GET)
		  public ModelAndView deleteProc(HttpSession session) {
		      ModelAndView mav = new ModelAndView();
		      mav.setViewName("member/msgView");
		      String id = (String) session.getAttribute("id");
		      int cnt = dao.delete(id);
		      if(cnt!=1) {
		        mav.addObject("msg1", "<script>alert('�쉶�썝�깉�눜�뿉 �떎�뙣�븯���뒿�땲�떎'); window.location.href = 'login.do';</script>");
		      } else {
		        mav.addObject("msg1", "<script>alert('�쉶�썝�깉�눜�뿉 �꽦怨듯븯���뒿�땲�떎'); window.location.href = 'login.do';</script>");
		      }
		      return mav;
		  }//deleteProc() end
  
		///鍮꾨�踰덊샇 李얘린
		  @RequestMapping(value="findpw.do", method=RequestMethod.GET)
		  public ModelAndView findPw(MemberDTO dto, HttpServletRequest req) throws Exception {
			  ModelAndView mav = new ModelAndView();
			  
			  mav.setViewName("member/findPw");
			  return mav;
			  
		  }
		  
		///鍮꾨�踰덊샇 李얘린
		  @RequestMapping(value="findPwProc.do", method=RequestMethod.POST)
		  public ModelAndView findPwProc(MemberDTO dto) {
			  ModelAndView mav = new ModelAndView();
			  
			  int cnt = dao.findPw(dto.getId(), dto.getEmail());
			  System.out.println(cnt);
			  if(cnt==1) {
				  mav.setViewName("member/findPwProc");
				  
				  String setfrom = "ecoshaur@gmail.com";       
				  String tomail  = dto.getEmail();     // 諛쏅뒗 �궗�엺 �씠硫붿씪
				  String title	 ="�엫�떆 鍮꾨�踰덊샇�엯�땲�떎";  
				  String content =null;
				  	try {
				  	  MimeMessage message = mailSender.createMimeMessage();
				      MimeMessageHelper messageHelper 
				                        = new MimeMessageHelper(message, true, "UTF-8");
				      
				    //-------------------------�엫�떆鍮꾨�踰덊샇 留뚮뱾怨� DB�닔�젙�븯湲�---------------------------------------
						String pw = "";
						char[] charSet = new char[] { 	'0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
														'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J',
														'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T',
														'U', 'V', 'W', 'X', 'Y', 'Z', 'a', 'b', 'c', 'd',
														'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n',
														'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x',
														'y', 'z'};

						for (int i = 0; i < 10; i++) {
							int index = (int)((Math.random() * charSet.length));
							pw += charSet[index];
						}
						
						int cnt2 = dao.memberSamplepasswd(dto.getId(), dto.getEmail(), pw);
						if(cnt2 != 0){
				//-------------------------------�씠硫붿씪 蹂대궡湲�----------------------------------------------
							content="�쉶�썝�떂�씠 �슂泥��븯�떊 鍮꾨�踰덊샇�뒗 " + pw + " �엯�땲�떎";	
						    messageHelper.setFrom(setfrom);  // 蹂대궡�뒗�궗�엺 �깮�왂�븯嫄곕굹 �븯硫� �젙�긽�옉�룞�쓣 �븞�븿
						    messageHelper.setTo(tomail);     // 諛쏅뒗�궗�엺 �씠硫붿씪
						    messageHelper.setSubject(title); // 硫붿씪�젣紐⑹� �깮�왂�씠 媛��뒫�븯�떎
						    messageHelper.setText(content);  // 硫붿씪 �궡�슜
						     
						    mailSender.send(message);
						}
					} catch(Exception e){
					   System.out.println(e);
					}

				  }
			  else {
				  mav.setViewName("member/msgView");
			      mav.addObject("msg1", "<script>alert('鍮꾨�踰덊샇李얘린�뿉 �떎�뙣�븯���뒿�땲�떎'); window.location.href = './';</script>");
			  }
		 
		  	return mav;
		  }
		  
		  

	    //二쇰Ц�궡�뿭�꽌 蹂닿린
	      @RequestMapping(value="order_history.do", method=RequestMethod.GET)
	      public ModelAndView order_history(String order_no, HttpSession session){
	        ModelAndView mav = new ModelAndView();
	        String id=(String) session.getAttribute("id");
	        
	        mav.addObject("member", dao.read(id));
	        mav.addObject("order", dao.order_sheetRead(order_no));
	        ArrayList<OrderHistoryDTO> dto = new ArrayList<OrderHistoryDTO>();
	        dto = dao.order_history(order_no);
	        mav.addObject("dto", dto);
	        ArrayList<RentalDTO> rdto = new ArrayList<RentalDTO>();
	        rdto = dao.Rental_list(order_no);
	        mav.addObject("Rdto", rdto);
	        
	        
	        // 珥� �씪�씪���뿬猷�, 珥� 蹂댁쬆湲� 怨꾩궛, 珥� 湲덉븸
	        int daily_total = 0;
	        int deposit_total = 0;
	        int total = 0;
	        for(int i=0;i<rdto.size();i++) {
	          daily_total += rdto.get(i).getPrice_daily() * dto.get(i).getQuantity() * dto.get(i).getRental_period();
	          deposit_total += rdto.get(i).getDeposit();
	        }
	        total = daily_total + deposit_total;
	        
	        // �궗�슜�븳 �룷�씤�듃 怨꾩궛
	        int real_total = dto.get(0).getTotal_price();
	        int point = real_total - total;
	        
	        mav.addObject("daily_total", daily_total);
	        mav.addObject("deposit_total", deposit_total);
	        mav.addObject("point", point);
	        mav.addObject("total", real_total);
	        
	        mav.setViewName("member/order_history");
	        return mav;
	      }
	      
	      
	    //�쑀���젙蹂� 蹂닿린
	      @RequestMapping(value="Userpage.do", method=RequestMethod.GET)
	      public ModelAndView userpage(String id){
	        ModelAndView mav = new ModelAndView();
	        mav.addObject("root", Utility.getRoot());
	        mav.addObject("dto", dao.userpage(id));
	        mav.addObject("user_rental", dao.user_rental(id));
	        mav.addObject("user_board", dao.user_board(id));
	        mav.setViewName("member/userpage");
	        return mav;
	      }//userpage() end
		  
}//class end
