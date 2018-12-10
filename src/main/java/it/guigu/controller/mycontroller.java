package it.guigu.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import it.guigu.server.myServer;
import mybatisg.model.Employee;

@RestController
public class mycontroller {
	@Autowired
	myServer se;
	public  <T,E> Map<E, T> returndata(E key,T value){
		Map<E,T> mp=new HashMap<>();
		mp.put(key, value);
		return mp;	
	}
	@GetMapping("/all/")
	public Map<String, Object>  mmms(){
		
		return mmm(0);
}
	@GetMapping("/dep")
	public Map<String, ?> dep(){		
		return returndata("dep", se.selectdep());
	}
	@GetMapping("/select/{id}")
	public Map<String, Object>  mmm(@PathVariable(value="id")Integer n){
		//获取第1页，10条内容，默认查询总数count
		
		PageHelper.startPage(n, 10);
		//紧跟着的第一个select方法会被分页
		List<Employee> list =se.select();
		PageInfo<Employee> pageInfo = new PageInfo<Employee>(list, 5);
		
		Map<String, Object> mp=new HashMap<>();
		mp.put("list", list);
		mp.put("cnum", pageInfo.getPageNum());
		mp.put("ff", pageInfo.getNavigateFirstPage());
		mp.put("allpage", pageInfo.getPages());
		mp.put("allnum", pageInfo.getTotal());
		return mp;
}
	@PostMapping("/insert")
	Map<String, String> inser(@Validated Employee emp,BindingResult ValidateResult){
		System.out.println(emp);
		Map<String, String> mp=returndata("empName","用户名格式正确");
		mp.put("email", "邮箱格式正确");
		mp.put("mess", "添加失败");
		mp.put("stuemail", "has-success");
		mp.put("stuempName", "has-success");
		if(ValidateResult.hasErrors()) {
			for(FieldError error :ValidateResult.getFieldErrors()) {
				mp.put(error.getField(), error.getDefaultMessage());
				mp.put("stu"+error.getField(), "has-error");
			}
			return mp;
		}
		
		if(!se.is_name_ok(emp.getEmpName())) {
			mp.put("empName","用户名已存在");
			mp.put("stu_empName", "has-error");
			return mp;
		}
		if(se.insert(emp))
		{
			 mp.put("mess", "添加成功");	
			 
		}
		
		return mp;
	}
	
	@DeleteMapping("/delete/{id}")
	Map<String, String> lll(@PathVariable("id") Integer id) {
		Map<String, String> mp=	new HashMap<>();
		if(se.deletebyid(id))
			 mp.put("mess", "删除成功");	
		else {
			mp.put("mess", "删除出错");	
		}
		return mp;
	}
}
