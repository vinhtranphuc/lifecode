package com.tranphucvinh.controller.home;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tranphucvinh.service.PageInfoService;

@Controller
@RequestMapping("/home/about-me")
public class AboutMeController {
	
	@Autowired
	private PageInfoService pageInfoService;
	
	@RequestMapping(value = {"", "/"}, method = RequestMethod.GET)
    public String index(Model model) {
		model.addAllAttributes(pageInfoService.getAboutUs());
        return "home/about-me/index";
    }
}
