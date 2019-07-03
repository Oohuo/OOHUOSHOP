package cn.edu.hnucm.shop.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.edu.hnucm.shop.entity.Category;
import cn.edu.hnucm.shop.entity.Product;
import cn.edu.hnucm.shop.entity.common.Page;
import cn.edu.hnucm.shop.service.CategoryService;
import cn.edu.hnucm.shop.service.ProductService;

/**
 * 商品的详情展示
 */
@WebServlet("/product_detail")
public class ProductDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//
		String idStr = request.getParameter("id");
		Integer id = Integer.valueOf(idStr);
		
		//
		ProductService productService = new ProductService();
		Product product = productService.findOne(id);
		request.setAttribute("product", product);
		
		//查询商品所属的类目对象
		Integer cate_id = product.getCate_id();
		CategoryService categoryService = new CategoryService();
		Category cate = categoryService.findOne(cate_id);
		request.setAttribute("cate", cate);
		
		//当前商品所属类目下的热门商品列表
		Page<Product> hotsPage = productService.findBySubCategory(cate_id, 1, 3);
		request.setAttribute("hots", hotsPage.getItems());
		
		//
		request.getRequestDispatcher("/product_detail.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
