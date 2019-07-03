package com.zhuoxun365.service;

import java.util.List;

import cn.edu.hnucm.shop.entity.Category;
import cn.edu.hnucm.shop.service.CategoryService;

public class CategoryServiceTest {

	public static void main(String[] args) {
		testFindAll();
	}
	
	public static void testFindAll(){
		CategoryService service = new CategoryService();
		
		List<Category> list = service.findAll(); //

		for (Category category : list) { //遍历一级类目
			System.out.println("|--" + category.getName());
			
			for (Category child : category.getChilds()) { //遍历当前一级类目下的所有二级类目
				System.out.println("    |--" + child.getName());
			}
		}
	}

}
