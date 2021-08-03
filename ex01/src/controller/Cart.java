package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.OrderVO;

@WebServlet(value={"/cart/list","/cart/insert","/cart/delete","/cart/update","/cart/olist"})
public class Cart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path=request.getServletPath();
		HttpSession session=request.getSession();
		ArrayList<OrderVO> cartList=(ArrayList<OrderVO>)session.getAttribute("cartList");
		if(cartList==null) cartList= new ArrayList<OrderVO>();
		RequestDispatcher dis=null;
		
		switch(path) {
			
		case "/cart/olist":
			request.setAttribute("pageName","/cart/olist.jsp");
			dis=request.getRequestDispatcher("/home.jsp");
			dis.forward(request, response);
			break;
		case "/cart/update":
			int quantity=Integer.parseInt(request.getParameter("quantity"));
			for (OrderVO cart:cartList) {
				if(cart.getProd_id().equals(request.getParameter("prod_id"))) {
					cart.setQuantity(quantity);
					break;
				}
			}
			session.setAttribute("cartList",cartList);
	         break;
		case "/cart/delete":
	         for(OrderVO cart:cartList) {
	            if(cart.getProd_id().equals(request.getParameter("prod_id"))) {
	               cartList.remove(cart);
	               break;
	            }
	         }
	         session.setAttribute("cartList",cartList);
	         break;
		case "/cart/list":
			request.setAttribute("pageName", "/cart/list.jsp");
			dis=request.getRequestDispatcher("/home.jsp");
			dis.forward(request, response);
			break;
			
		case "/cart/insert":
			OrderVO vo=new OrderVO();
			vo.setProd_id(request.getParameter("prod_id"));
			vo.setProd_name(request.getParameter("prod_name"));
			vo.setPrice(Integer.parseInt(request.getParameter("price")));
			quantity=1;
			for(OrderVO cart:cartList) {//카트에 이미 있는 상품인지 체크
				if(cart.getProd_id().equals(request.getParameter("prod_id"))) {
					quantity=cart.getQuantity()+1; //수량을 1증가시키고
					cartList.remove(cart); //기존 상품은 삭제
					break;
				}
			}
			vo.setQuantity(quantity);
			cartList.add(vo);
			session.setAttribute("cartList", cartList);
			break;
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
