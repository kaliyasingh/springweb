package com.ips.daoimpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import com.ips.dao.adminDao;
import com.ips.pojo.Admin;

@Component
public class adminInfodaoImpl implements adminDao {

	private JdbcTemplate jTemplate;
	@Autowired
	public void setjTemplate(JdbcTemplate jTemplate) {
		this.jTemplate = jTemplate;
	}

	@Override
	public boolean checkAdmin(Admin a) {
//		   Admin user=null;
//	        try {
//				user= jTemplate.queryForObject("select from userinfo where email =? and password=?",
//						new BeanPropertyRowMapper<Admin>(Admin.class),
//						new Object[] {a.getEmail(),a.getPassword()});
//				        return true;
//			} catch (Exception e) {
//				return false;
//			}
		if(a.getUsername().equals("admin")&&a.getPassword().equals("ad123"))
		{
			return true;
			
		}
		else
		{
		 return 	false;
		}
		
	 	}
	
	@Override
	public boolean addNewAdmin(Admin a) {
		try {
			int count = jTemplate.update("insert into userinfo('username','password','email','phone')values(?,?,?,?)",
					     new Object[] {a.getUsername(),a.getPassword(),a.getEmail(),a.getPhone()});
			  return count>0;
			}
		    catch (Exception e) {
				System.out.println(e);
				return false;
			}
	}

   
	
}
