package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.OrderVO;
import model.PurchaseDAO;
import model.PurchaseVO;
import model.SqlVO;
import model.UserVO;


@WebServlet(value={"/pur/list", "/pur/list.json", "/pur/plist.json", "/pur/insert", "/pur/insert_product"})
public class purchase extends HttpServlet {
	private static final long serialVersionUID = 1L;
    PurchaseDAO dao=new PurchaseDAO();   

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
	    PrintWriter out =response.getWriter();
	    String path=request.getServletPath();
	    RequestDispatcher dis=null;
	    
	    switch(path) {
	      case "/pur/plist.json":
	    	  out.println(dao.plist(request.getParameter("order_id")));
	    	  break;
	      case "/pur/list":
	         request.setAttribute("pageName","/pur/list.jsp");
	         dis=request.getRequestDispatcher("/home.jsp");
	         dis.forward(request, response);
	         break;
	      case "/pur/list.json":
	      SqlVO svo=new SqlVO();
	      svo.setKey(request.getParameter("key"));
	      svo.setWord(request.getParameter("word"));
	      svo.setPage(Integer.parseInt(request.getParameter("page")));
	      svo.setPerpage(Integer.parseInt(request.getParameter("perpage")));
	      svo.setOrder(request.getParameter("order"));
	      svo.setDesc(request.getParameter("desc"));
	      
	      HttpSession session=request.getSession();
	      UserVO userVO=(UserVO)session.getAttribute("user");
	      String id=userVO==null ? "" : userVO.getId();
	      out.print(dao.list(svo, id));
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
		switch(path) {
		case "/pur/insert_product" :
		      OrderVO ovo = new OrderVO();
		      ovo.setOrder_id(request.getParameter("order_id"));
		      ovo.setProd_id(request.getParameter("prod_id"));
		      ovo.setPrice(Integer.parseInt(request.getParameter("price")));
		      ovo.setQuantity(Integer.parseInt(request.getParameter("quantity")));
		      dao.insert_product(ovo);
		      break;
		   case "/pur/insert" :
			   	  HttpSession session=request.getSession();
			      UserVO userVO=(UserVO)session.getAttribute("user");
			      String id=userVO==null ? "" : userVO.getId();
			   
		         PurchaseVO vo = new PurchaseVO();
		         vo.setName(request.getParameter("name"));
		         vo.setAddress(request.getParameter("address"));
		         vo.setTel(request.getParameter("tel"));
		         vo.setPaytype(request.getParameter("paytype"));
		         vo.setEmail(request.getParameter("email"));
		         String order_id=dao.insert(vo, id);
		         PrintWriter out= response.getWriter();
		         out.print(order_id);
		         //장바구니비우기
		         session=request.getSession();
		         session.setAttribute("cartList",  null);
		         break;
		      }
	}

}
