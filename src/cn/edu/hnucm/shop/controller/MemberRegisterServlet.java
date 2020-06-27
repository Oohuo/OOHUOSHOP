package cn.edu.hnucm.shop.controller;

import java.io.IOException;
import java.util.Date;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.edu.hnucm.shop.entity.Member;
import cn.edu.hnucm.shop.service.MemberService;

/**
 * 处理注册会员的Servlet
 */
@WebServlet("/member_register")
public class MemberRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//step1： 获取客户端提交的数据
		String mobile = request.getParameter("mobile");
		String pwd = request.getParameter("pwd");
		String pwd2 = request.getParameter("pwd2");
		
		String regexp="^((13[0-9])|(15[^4])|(18[0,2,3,5-9])|(17[0-8])|(147))\\d{8}$";
		//判断数据是否符合要求
		Pattern p=Pattern.compile(regexp);
		Matcher m=p.matcher(mobile);
		if (!m.matches()) {//电话号码合法化判断
			request.setAttribute("msg", "注册失败，手机号不合法！");
			request.getRequestDispatcher("/member_register.jsp").forward(request, response);
		}else {//密码判断
			if (!pwd.equals(pwd2)||pwd.equals("")||pwd2.equals("")) {
				request.setAttribute("msg", "注册失败，两次密码不一致或为空");
				request.setAttribute("zhanghao", mobile);
				request.getRequestDispatcher("/member_register.jsp").forward(request, response);
			}else {
				Member mbr = new Member();
				mbr.setMobile(mobile);
				mbr.setNick_name("匿名");
				mbr.setRegister_time(new Date());
				
				//step2: 业务逻辑处理
				MemberService service = new MemberService();
				//根据手机号查询会员对象
				Member temp = service.findByMobile(mobile);
				if(temp != null){ //手机号已经存在 
					request.setAttribute("msg", "注册失败，手机号已经被注册了！");
					
					request.getRequestDispatcher("/member_register.jsp").forward(request, response);
				}else{
					pwd=service.encryptionPaw(pwd);
					mbr.setPwd(pwd);
					service.save(mbr);
					
					//跳转到登录页面
					response.sendRedirect(request.getContextPath() + "/member_login.jsp");
				}
			}
		}
		
		
	}

}
