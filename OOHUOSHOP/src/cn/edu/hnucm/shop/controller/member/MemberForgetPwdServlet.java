package cn.edu.hnucm.shop.controller.member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.edu.hnucm.shop.entity.Member;
import cn.edu.hnucm.shop.service.MemberService;

/**
 * Servlet implementation class MemberForgetPwdServlet
 */
@WebServlet("/forgetpwd")
public class MemberForgetPwdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberForgetPwdServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//System.out.println(111);
		String mobile = request.getParameter("mobile");
		String fpwd = request.getParameter("fpwd");
		MemberService service = new MemberService();
		//System.out.println(222);
		Member mbr = service.findByMobile(mobile);
		//System.out.println(333);
		
		//System.out.println(mbr.getPwd());
		mbr.setPwd(fpwd);
		//System.out.println(mbr.getPwd());
		service.update(mbr);
		//System.out.println(444);
		response.sendRedirect(request.getContextPath() + "/member_login.jsp");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
