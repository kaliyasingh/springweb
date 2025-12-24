package com.ips.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class myController {
	
	@RequestMapping("/index")
	public String indexpage()
	{
		return "index";
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
	@RequestMapping("/testimonial")
	public String testpage()
	{
		return "testimonial";
	}

}
