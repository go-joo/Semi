package controller;

import java.io.*;
import java.io.PrintWriter;

import javax.servlet.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import model.ProductDAO;
import model.ProductVO;
import model.SqlVO;


@WebServlet(value={"/home","/pro/list.json","/pro/list","/pro/insert","/pro/read","/pro/delete","/pro/update","/pro/pdetail","/pro/simage"})
public class Product extends HttpServlet {
	private static final long serialVersionUID = 1L;
	   ProductDAO dao=new ProductDAO();
	   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	      response.setContentType("text/html;charset=UTF-8");
	      PrintWriter out=response.getWriter();
	      String path=request.getServletPath();
	      RequestDispatcher dis=null;
	      switch(path) {
	      case "/pro/simage":
	    	  request.setAttribute("vo",dao.read(request.getParameter("prod_id")));
	    	  request.setAttribute("pageName","/pro/simage.jsp");
	          dis=request.getRequestDispatcher("/home.jsp");
	          dis.forward(request, response);
	          break;
	      case "/pro/pdetail":
	    	  request.setAttribute("vo",dao.read(request.getParameter("prod_id")));
	    	  request.setAttribute("pageName","/pro/pdetail.jsp");
	          dis=request.getRequestDispatcher("/home.jsp");
	          dis.forward(request, response);
	          break;
	      case "/pro/delete":
	    	  ProductVO oldVO=dao.read(request.getParameter("prod_id"));
	    	  dao.delete(request.getParameter("prod_id"));
	    	  if(oldVO.getImage()!=null) {
	    		  File file=new File("c:/image/"+oldVO.getImage());
	    		  file.delete();
	    	  }
	    	  response.sendRedirect("/home");
	    	  break;
	      case "/pro/read":
	    	  request.setAttribute("vo",dao.read(request.getParameter("prod_id")));
	    	  request.setAttribute("pageName","/pro/read.jsp");
	          dis=request.getRequestDispatcher("/home.jsp");
	          dis.forward(request, response);
	          break;
	      case "/pro/insert":
	    	  request.setAttribute("prod_id",dao.getCode());
	    	  request.setAttribute("pageName","/pro/insert.jsp");
	          dis=request.getRequestDispatcher("/home.jsp");
	          dis.forward(request, response);
	          break;
	      case "/pro/list":
	         request.setAttribute("pageName","/pro/list.jsp");
	         dis=request.getRequestDispatcher("/home.jsp");
	         dis.forward(request, response);
	         break;
	      case "/pro/list.json":
	      SqlVO svo=new SqlVO();
	      svo.setKey(request.getParameter("key"));
	      svo.setWord(request.getParameter("word"));
	      svo.setPage(Integer.parseInt(request.getParameter("page")));
	      svo.setPerpage(Integer.parseInt(request.getParameter("perpage")));
	      svo.setOrder(request.getParameter("order"));
	      svo.setDesc(request.getParameter("desc"));
	      out.print(dao.list(svo));
	      break;
	      case "/home":
	         request.setAttribute("pageName","/pro/home.jsp");
	         dis=request.getRequestDispatcher("/home.jsp");
	         dis.forward(request, response);
	         break;
	      }
	   }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		   request.setCharacterEncoding("UTF-8");
		   String path=request.getServletPath();
		   
		   MultipartRequest multi=new MultipartRequest(request, "c:/image", 1024*1024*10, "UTF-8", new DefaultFileRenamePolicy());
		   //System.out.println("fileName.........." + multi.getFilesystemName("image"));
		   
		   ProductVO vo = new ProductVO();
		   vo.setProd_id(multi.getParameter("prod_id"));
		   vo.setProd_name(multi.getParameter("prod_name"));
		   vo.setMall_id(multi.getParameter("mall_id"));
		   vo.setPrice(Integer.parseInt(multi.getParameter("price")));
		   vo.setDetail(multi.getParameter("detail"));
		   vo.setImage(multi.getFilesystemName("image"));
		   String prod_del=multi.getParameter("prod_del")==null?"0":"1";
		   vo.setProd_del(prod_del);
		   
		   switch(path) {
		   case "/pro/update":
			   ProductVO oldVO=dao.read(vo.getProd_id());
			   if(multi.getFilesystemName("image")==null) {//새로업로드한 이미지가 없는경우
				   vo.setImage(oldVO.getImage());
			   }else { //새로업로드한 이미지가 있는경우
				   if(oldVO.getImage() != null) { //예전이미지가 있는경우 
					   File file=new File("c:/image" +oldVO.getImage());
					   file.delete();
				   }
			   }
			   dao.update(vo);
			   break;
			   
		   case "/pro/insert":
			   dao.insert(vo);
			   break;
		   }
		   response.sendRedirect("/home");
	   }
	}

