package com.ips.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	@RequestMapping("/")
	public String indepage()
	{
		return "index";
	}
	@RequestMapping("/property")
	public String prepage()
	{
		return "property";
	}
	@RequestMapping("/index")
	public String indexpage()
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
	public String agentptage()
	{
		return "agent";
	}
	@RequestMapping("/about")
	public String aboutpage()
	{
		return "about";
	}
	@RequestMapping("/contact")
	public String contactpage()
	{
		return "contact";
	}
	@RequestMapping("/property-agent")
	public String agentpage()
	{
		return "property-agent";
	}
	@RequestMapping("/404")
	public String errorpage()
	{
		return "404";
	}
	@RequestMapping("/property-list")
	public String listpage()
	{
		return "property-list";
	}
	@RequestMapping("/property-type")
	public String ptypepage()
	{
		return "property-type";
	}
	@RequestMapping("/read")
	public String redd()
	{
		return "read";
	}
	@RequestMapping("/detail")
	public String detail()
	{
		return "detail";
	}
	@RequestMapping("/hello")
	public String hpage()
	{
		return "hello";
	}
	@RequestMapping("/reports")
	public String reportsgpage()
	{
		return "reports";
	}
	@RequestMapping("/property-details")
	public String detasil()
	{
		return "property-details";
	}
	@RequestMapping("/viewProperty")
	public String viewepage()
	{
		return "viewProperty";
	}
	@RequestMapping("/login")
	public String viewage()
	{
		return "login";
	}
	@RequestMapping("/testimonial")
	public String testpage()
	{
		return "testimonial";
	}}
