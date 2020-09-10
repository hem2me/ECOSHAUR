package com.cafe24.ecoshaur.community;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import net.utility.UploadSaveManager;

@Controller
public class BoardCont {
  @Autowired
  BoardDAO dao;

  //�� ���
  @RequestMapping("Board.do")
  public ModelAndView Board(int nowpage,String col, String search) {
    int recordPerPage = 8;
    int endRow   = nowpage * recordPerPage;   
    ModelAndView mav = new ModelAndView();    
    mav.setViewName("community/Board");
    if(search.isEmpty())
      mav.addObject("list", dao.list(nowpage, recordPerPage));
    else
      mav.addObject("list", dao.list_search(nowpage, recordPerPage, col, search));
    mav.addObject("end", endRow);
    mav.addObject("nowpage", nowpage);
    mav.addObject("recordPerPage", recordPerPage);
    mav.addObject("count", dao.count());
    return mav;
  }
  
  
  
  //�� �󼼺���
  @RequestMapping("BRead.do")
  public ModelAndView Bread(int postno) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("community/BRead");
    //��ȸ�� ����
    dao.vupdate(postno);
    mav.addObject("dto", dao.read(postno));
    return mav;
  }

  //�� �ۼ� ������ ȣ��
  @RequestMapping(value = "BCreate.do", method = RequestMethod.GET)
  public String BCreate() {
    return "community/BCreate";
  }

  //�� �ۼ�
  @RequestMapping(value = "BCreate.do", method = RequestMethod.POST)
  public ModelAndView BCreate(BoardDTO dto, HttpServletRequest req) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("community/BResult");
    String basePath = req.getRealPath("/community/storage");
    
    MultipartFile posterMF = dto.getPosterMF();

    String poster = UploadSaveManager.saveFileSpring30(posterMF, basePath);

    dto.setImage_name(poster);

    int cnt = dao.create(dto);
    if (cnt == 0) {
      mav.addObject("msg",  "<p>�� �ۼ��� �����Ͽ����ϴ�.�Ф�</p>");
    } else {
      mav.addObject("msg",  "<p>�� �ۼ��� �����Ͽ����ϴ�!</p>");
    }
    return mav;
  }

  //�� ���� ������ ȣ��
  @RequestMapping(value="BUpdate.do", method=RequestMethod.GET)
  public ModelAndView BUpdate(BoardDTO dto) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("community/BUpdate");
    mav.addObject("dto", dao.read(dto.getPostno()));
    return mav;
  }
  
  //�� ���� 
  @RequestMapping(value="BUpdate.do", method=RequestMethod.POST)
  public ModelAndView BUpdate(BoardDTO dto, HttpServletRequest req) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("community/BResult");
    
    String basePath = req.getRealPath("/community/storage");
    
    //������ ����� ���� ��������
    BoardDTO oldDTO = dao.read(dto.getPostno());

    MultipartFile posterMF = dto.getPosterMF();    
    if(posterMF.getSize()>0) {
      
      //1)������ ������ ���
      //�ű� ���� ����
      String poster = UploadSaveManager.saveFileSpring30(posterMF, basePath);
      dto.setImage_name(poster);      
    }else {
      
      //2)������ �������� ���� ���
      //���� ���� �ҷ�����
      dto.setImage_name(oldDTO.getImage_name());
    }
       
    int cnt = dao.update(dto);
    if(cnt == 0) {
      mav.addObject("msg",  "<p>�� ������ �����Ͽ����ϴ�.�Ф�</p>");
    } else {
      mav.addObject("msg",  "<p>�� ������ �����Ͽ����ϴ�!</p>");
    }
    return mav;
  }
  
  //�� ���� ������ ȣ��
  @RequestMapping(value="BDelete.do", method=RequestMethod.GET)
  public ModelAndView BDelete(BoardDTO dto) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("community/BDelete");
    mav.addObject("dto", dao.read(dto.getPostno()));
    return mav;
  }
   
  //�� ����
  @RequestMapping(value = "BDelete.do", method = RequestMethod.POST)
  public ModelAndView BDelete(BoardDTO dto, HttpServletRequest req) {
    ModelAndView mav = new ModelAndView();  
    mav.setViewName("community/BResult"); 
    int cnt = dao.delete(dto.getPostno());
    if (cnt == 0) {
      mav.addObject("msg",  "<p>�ۻ����� �����Ͽ����ϴ�.�Ф�</p>");
    } else {
      mav.addObject("msg",  "<p>���������� ���� �����Ǿ����ϴ�!</p>");
    }
    return mav;
  }
  
  //���ƿ�
  @RequestMapping(value="Good.do",method=RequestMethod.GET)
  public ModelAndView Good(int postno) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("community/BRead");
    dao.gupdate(postno);
    mav.addObject("dto", dao.read(postno));
    return mav;
  }
  
  //�Ⱦ��
  @RequestMapping(value="Bad.do",method=RequestMethod.GET)
  public ModelAndView Bad(int postno) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("community/BRead");
    dao.bupdate(postno);
    mav.addObject("dto", dao.read(postno));
    return mav;
  }
}
