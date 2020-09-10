package com.cafe24.ecoshaur.category;


import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;


import net.utility.UploadSaveManager;
import net.utility.Utility;

@Controller
public class RentalCont {
  @Autowired
  private RentalDAO dao;

  public RentalCont() {}
  
//��ü���� 
 @RequestMapping(value = "Category.do", method = RequestMethod.GET)
 public ModelAndView CategoryList(int nowpage, String col, String search) {
   // recordPerPage = ������������ ǥ�õ� ����
   int recordPerPage = 8;
   int endRow   = nowpage * recordPerPage;

   
   ModelAndView mav = new ModelAndView();
   mav.setViewName("category/Category");   
   mav.addObject("root", Utility.getRoot());
   if(search.isEmpty())
     mav.addObject("list", dao.list(nowpage, recordPerPage));
   else
     mav.addObject("list", dao.list_search(nowpage, recordPerPage, col, search));
   mav.addObject("recordPerPage", recordPerPage);
   mav.addObject("end", endRow);
   mav.addObject("nowpage", nowpage);
   mav.addObject("count", dao.count());
   return mav;
 }// CategoryList() end
 
 
//�ұ׷�
@RequestMapping(value = "CategoryDT.do", method = RequestMethod.GET)
public ModelAndView CategoryDTList(String category, int nowpage, String col, String search) {
  int recordPerPage = 8;
  int endRow   = nowpage * recordPerPage;
  
  ModelAndView mav = new ModelAndView();
  mav.setViewName("category/CategoryDT");   
  mav.addObject("root", Utility.getRoot());// 
  mav.addObject("cg", category);
  if(search.isEmpty())
    mav.addObject("list", dao.listDT(category, nowpage, recordPerPage));
  else
    mav.addObject("list", dao.listDT_search(category, nowpage, recordPerPage, col, search));
  mav.addObject("category", dao.category(category));
  
  mav.addObject("recordPerPage", recordPerPage);
  mav.addObject("end", endRow);
  mav.addObject("nowpage", nowpage);
  mav.addObject("count", dao.countDT(category));
  return mav;
}// CategoryList() end


@RequestMapping(value = "CategoryDT.do", method = RequestMethod.POST)
public ModelAndView testCheck(HttpServletRequest req, String cg, int nowpage) {
  int recordPerPage = 8;
  int endRow   = nowpage * recordPerPage;
  
  String[] valueArr = req.getParameterValues("test_check");
  ModelAndView mav = new ModelAndView();
  mav.setViewName("category/CategoryDT");
  int size = valueArr.length;
  mav.addObject("root", Utility.getRoot());// 
  mav.addObject("cg", cg);
  mav.addObject("list", dao.select_listDT(valueArr ,size, nowpage, recordPerPage));
  mav.addObject("category", dao.category(cg));
  
  
  mav.addObject("recordPerPage", recordPerPage);
  mav.addObject("end", endRow);
  mav.addObject("nowpage", nowpage);
  mav.addObject("count", dao.countDTC(valueArr ,size));
  return mav;
}
 
// ��ǰ���
@RequestMapping(value = "Rental_resister.do", method = RequestMethod.GET)
public ModelAndView Rental_resister() {
  ModelAndView mav = new ModelAndView();
  mav.setViewName("category/Rental_resister");   
  mav.addObject("minor", dao.MNcategory());
  return mav;
}// CategoryList() end

 @RequestMapping(value = "Rental_resister.do", method = RequestMethod.POST)
 public ModelAndView createProc(RentalDTO dto, HttpServletRequest req, String ctCode) {
   ModelAndView mav = new ModelAndView();
   mav.setViewName("category/msgView");
   mav.addObject("root", Utility.getRoot());
   
   String code = dao.category_code(ctCode);
   dto.setCategory_code(code);

   // ��ǰ��Ϲ�ȣ �۾�
   String number = dao.Max_code(code);        // ī�װ��ڵ忡 �ش��ϴ� ��ǰ��Ϲ�ȣ �ִ밪 ��������
   String max_num = number.substring(7, 13);  // ��ȣ�κи� ��������
   int Int_maxNum = Integer.parseInt(max_num); // ��ȣ�� ������ �ٲٱ�
   String max_number = String.format("%06d", Int_maxNum+1); // 000001 �������� �ٲٱ�
   String product_no = code + "-"  + max_number;
   dto.setProduct_no(product_no);

   
//---------------------------------------------------------------------------
   String basePath = req.getRealPath("/category/storage");

   MultipartFile PosterMF = dto.getPosterMF();
   String poster = UploadSaveManager.saveFileSpring30(PosterMF, basePath);
   dto.setThmb_name(poster);
   
   MultipartFile filenameMF = dto.getFilenameMF();  
   String image = UploadSaveManager.saveFileSpring30(filenameMF, basePath);
   dto.setImage_name(image);
//---------------------------------------------------------------------------
   dto.setCategory_code(dao.category_code(ctCode));

   int cnt = dao.create(dto);
   
   if(cnt!=1) {
     mav.addObject("msg1", "<script>alert('��ǰ��Ͽ� �����Ͽ����ϴ�'); window.location.href = './Category.do?nowpage=1&col=&search=';</script>");
   } else {
     mav.addObject("msg1", "<script>alert('��ǰ��Ͽ� �����Ͽ����ϴ�'); window.location.href = './Category.do?nowpage=1&col=&search=';</script>");
   }
   
   return mav;
 }// createProc() end

 
 
 // ��ǰ�󼼺���
 @RequestMapping(value = "RentalRead.do", method = RequestMethod.GET)
 public ModelAndView Rental_Read(String product_no) {
   ModelAndView mav = new ModelAndView();
   mav.setViewName("category/RentalRead");   
   
   // ���ƿ�, �Ⱦ�� �ۼ�Ʈ
   double good = dao.Rental_good(product_no); // ���ƿ� �� ��������
   double bad = dao.Rental_bad(product_no);   // �Ⱦ�� �� ��������
   double sum = good + bad;           
   good = good / sum * 100;                 // ���ƿ� �� �ۼ�Ʈ
   good = Integer.parseInt(String.valueOf(Math.round(good))); // ������ �ٲٱ�
   if(good != 0)
     bad = 100 - good;
   else
     bad = 0;
   mav.addObject("good", good);
   mav.addObject("bad", bad);
   ////////////////////////////////////////////////////////////////////
   mav.addObject("dto", dao.Read(product_no));
   String code = dao.rental_code(product_no);
   mav.addObject("code", dao.category_minor(code));
   
   return mav;
 }// CategoryList() end
 
 // ��ǰ����
 @RequestMapping(value = "rental_update.do", method = RequestMethod.GET)
 public ModelAndView Rental_update(String product_no) {
   ModelAndView mav = new ModelAndView();
   mav.setViewName("category/rental_update"); 
   mav.addObject("dto", dao.Read(product_no));
   String code = dao.rental_code(product_no);
   String minor = dao.category_minor(code);
   mav.addObject("select_minor", minor);
   mav.addObject("minor", dao.MNcategory());
   return mav;
 }// CategoryList() end
 
 @RequestMapping(value = "rental_update.do", method = RequestMethod.POST)
 public ModelAndView Rental_updateProc(RentalDTO dto, String ctCode, String old_thmb_name, String old_image_name, HttpServletRequest req) {
   ModelAndView mav = new ModelAndView();
   mav.setViewName("category/msgView");
   mav.addObject("root", Utility.getRoot());
      
   String code = dao.category_code(ctCode);
   dto.setCategory_code(code);

   // ������Ʈ 
//---------------------------------------------------------------------------
   String basePath = req.getRealPath("category/storage");
   
   if(dto.getPosterMF().getSize() != 0) { // ����� ������ �Ѵٸ�?
     MultipartFile PosterMF = dto.getPosterMF();
     String poster = UploadSaveManager.saveFileSpring30(PosterMF, basePath);
     dto.setThmb_name(poster);
   }
   else {
     dto.setThmb_name(old_thmb_name);
   }
   if(dto.getFilenameMF().getSize() != 0) { // �̹��� ������ �Ѵٸ�?
     MultipartFile filenameMF = dto.getFilenameMF();  
     String image = UploadSaveManager.saveFileSpring30(filenameMF, basePath);
     dto.setImage_name(image);
   }
   else {
     dto.setImage_name(old_image_name);
   }
//---------------------------------------------------------------------------
   dto.setCategory_code(dao.category_code(ctCode));

   int cnt = dao.update(dto, basePath, old_thmb_name, old_image_name);
   if(cnt!=1) {
     mav.addObject("msg1", "<script>alert('��ǰ������ �����Ͽ����ϴ�'); window.location.href = './Category.do?nowpage=1&col=&search=';</script>");
   } else {
     mav.addObject("msg1", "<script>alert('��ǰ������ �����Ͽ����ϴ�'); window.location.href = './Category.do?nowpage=1&col=&search=';</script>");
   }
   
   return mav;
 }// CategoryList() end
 
 
//��ǰ����
@RequestMapping(value = "rental_delete.do", method = RequestMethod.GET)
public ModelAndView Rental_delete(String product_no) {
 ModelAndView mav = new ModelAndView();
 mav.setViewName("category/rental_delete");  
 mav.addObject("product_no", product_no);
 return mav;
}// CategoryList() end

@RequestMapping(value = "rental_delete.do", method = RequestMethod.POST)
public ModelAndView Rental_deleteProc(String product_no, HttpServletRequest req) {
 ModelAndView mav = new ModelAndView();
 mav.setViewName("category/msgView");
 
 //�������� ������ ���� ��Ʈ��� ��������
 String saveDirectory = req.getRealPath("category/storage");
 RentalDTO dto = dao.Read(product_no);
 String thum = dto.getThmb_name();
 String image = dto.getImage_name();
 int cnt = dao.delete(product_no, saveDirectory, thum, image);
 if(cnt!=1) {
   mav.addObject("msg1", "<script>alert('��ǰ������ �����Ͽ����ϴ�'); window.location.href = './Category.do?nowpage=1&col=&search=';</script>");
 } else {
   mav.addObject("msg1", "<script>alert('��ǰ������ �����Ͽ����ϴ�'); window.location.href = './Category.do?nowpage=1&col=&search=';</script>");
 }
 
 return mav;
}// CategoryList() end
 

 
}
