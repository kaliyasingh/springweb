package com.ips.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ips.dao.adminDao;
import com.ips.daoimpl.adminInfodaoImpl;
import com.ips.pojo.Admin;

@Controller
public class loginController {
	
	adminInfodaoImpl daoImpl;

	@Autowired
	public void setDaoImpl(adminInfodaoImpl daoImpl) {
		this.daoImpl = daoImpl;
	}

	@RequestMapping(value = "/checkadmin", method = RequestMethod.POST)
	public String checkadmin(@ModelAttribute("admin") Admin a, Model m) {
	    if (daoImpl.checkAdmin(a)) {
	        m.addAttribute("username", a.getUsername());
	        return "dashboard";
	    } else {
	        m.addAttribute("msg", "Invalid Username or Password");
	        return "admin";
	    }
	}


}
