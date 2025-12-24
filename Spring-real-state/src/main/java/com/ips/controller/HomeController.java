package com.ips.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ips.daoimpl.adminInfodaoImpl;
import com.ips.pojo.Admin;

@Controller
public class HomeController {

	@RequestMapping("/viewProperty")
	public String viewepage()
	{
		return "viewProperty";
	}
	@RequestMapping("/property-list")
	public String listpage()
	{
		return "property-list";
	}
	@RequestMapping("/property")
	public String prepage()
	{
		return "property";
	}
	
	@RequestMapping("/hello")
	public String hpage()
	{
		return "hello";
	}
	@RequestMapping("/property_list")
	public String prelistpage()
	{
		return "property_list";
	}
	
	
	@RequestMapping("/")
	public String indepage()
	{
		return "index";
	}
	@RequestMapping("/admin")
	public String adminpage()
	{
		return "admin";
	}
	@RequestMapping("/dashboard")
	public String dashboardpage()
	{
		return "dashboard";
	}
	@RequestMapping("/agent")
	public String agentpage()
	{
		return "agent";
	}
	@RequestMapping("/login")
	public String usepage()
	{
		return "login";
	}
	@RequestMapping("/reg")
	public String regpage()
	{
		return "reg";
	}
	@RequestMapping("/reports")
	public String reportsgpage()
	{
		return "reports";
	}
	
}
