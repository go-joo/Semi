package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.UserDAO;
import model.UserVO;

@WebServlet(value={"/user/login","/user/logout"})
public class User extends HttpServlet {
	private static final long serialVersionUID = 1L;

   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		session.setAttribute("user", null);
		response.sendRedirect("/home");
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserDAO dao=new UserDAO();
		UserVO vo=dao.read(request.getParameter("id"));
		int result=0; //아이디가없는경우
		
		if(vo.getId()!=null) {
			if(vo.getPass().equals(request.getParameter("pass"))) {
				result=1; //로그인성공
				HttpSession session=request.getSession();
				session.setAttribute("user", vo);
			}else {
				result=2; //비밀번호가 틀린경우
			}
		}
		PrintWriter out=response.getWriter();
		out.print(result);
	}

}
