package cn.edu.hnucm.shop.controller.member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.edu.hnucm.shop.service.OrdersService;

/**
 * Servlet implementation class OrderStatus
 */
@WebServlet("/member/orders/status")
public class OrderStatus extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//step1:数据获取
		int id=Integer.parseInt(request.getParameter("id"));
		int status=Integer.parseInt(request.getParameter("status")); 
		//step2:业务处理
		OrdersService service=new OrdersService();
		service.updateStatus(id, status);
		//step3:执行跳转
		response.sendRedirect(request.getContextPath() + "/member/orders");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
