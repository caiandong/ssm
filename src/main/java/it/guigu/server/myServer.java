package it.guigu.server;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mybatisg.dao.DepartmentMapper;
import mybatisg.dao.EmployeeMapper;
import mybatisg.model.Department;
import mybatisg.model.Employee;
import mybatisg.model.EmployeeExample;
import mybatisg.model.EmployeeExample.Criteria;

@Service
public class myServer {
	
	
	@Autowired
	private DepartmentMapper department;
	@Autowired
	private EmployeeMapper emp;
	public List<Department> selectdep(){
		return department.selectByExample(null);
	}
	public List<Employee> select() {
		//return emp.selectByExample(null); 
		return emp.allselectByExample(new EmployeeExample()); 
			
	
	}
	public boolean insert(Employee em) {
		return emp.insertSelective(em)>0;
	}
	public boolean deletebyid(Integer id) {
		return emp.deleteByPrimaryKey(id)>0;
	}
	public Boolean is_name_ok(String str) {
		
		EmployeeExample example = new EmployeeExample();
		Criteria cr = example.createCriteria();
		cr.andEmpNameEqualTo(str);
		return emp.countByExample(example)==0;
	}
}
