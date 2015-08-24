package com.mygoogle.myapp;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping(value = "/map")
public class MapController {
	
	private static final Logger logger = LoggerFactory.getLogger(MapController.class);
	
	@RequestMapping(method = RequestMethod.GET)
	public String getGoogleMap(Model model) {
		
		logger.info("Welcome home! The client locale is ");
		
/*		model.addAttribute("faceBookAppKey", "" );
		model.addAttribute("googleAppKey", "" );*/
		
		return "map/googleMap";
	}
	
	@RequestMapping(value="/googleMap2", method = RequestMethod.GET)
	public String getGoogleMap2(Model model) {
		
		logger.info("Welcome home! The client locale is ");	
		
		return "map/googleMap2";
	}
}
