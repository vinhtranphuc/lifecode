package com.tranphucvinh.controller.cms;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tranphucvinh.service.PageInfoService;

@Controller
@RequestMapping("/cms/page-info")
public class PageInfoController {
	
	@Autowired
	private PageInfoService pageInfoService;
	
	@RequestMapping(value = {"about-me", "about-me/"}, method = RequestMethod.GET)
    public String aboutUs(Model model) {
		model.addAllAttributes(pageInfoService.getAboutUs());
        return "cms/page-info/about-me";
    }
	
	@RequestMapping(value = {"contact", "contact/"}, method = RequestMethod.GET)
    public String contactUs(Model model) {
		model.addAllAttributes(pageInfoService.getContactUs());
        return "cms/page-info/contact";
    }
	
	@RequestMapping(value = {"social", "social/"}, method = RequestMethod.GET)
    public String social(Model model) {
		model.addAttribute("socials", pageInfoService.getSocials());
        return "cms/page-info/social";
    }
}
