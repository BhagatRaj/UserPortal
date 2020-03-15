package com.tutorials.demo;



import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.tutorials.CreditDao.CreditDao;
import com.tutorials.bean.CreditCardBean;



@Controller
@RequestMapping("CreditController")
				public class CreditController {
	 		private Logger logger = Logger.getLogger(CreditController.class);
			private static final String baseURL = "http://localhost:8080/RestFulWS/rest/creditcardDetails";
				
					@Autowired
					CreditDao creditDao;
					
					@RequestMapping(value="/CreditDetails")
					public String CreditDetails(Model model, ModelMap model1, HttpServletRequest request) {
						//test for git
						//rajan
						CreditCardBean creditCardBean=null;
						List<CreditCardBean> cardList=null;
						
						HttpSession session=request.getSession(true);
						String userName=(String)session.getAttribute("userName");
						Map<String, List> cardListmap=new HashMap<>();
						List<CreditCardBean> creditCardlist=new ArrayList<CreditCardBean>();
						model1.put("yearList", Calendar.getInstance().get(Calendar.YEAR));
						creditCardlist=creditDao.getcreditDetailsForUser(userName);
						
						
						if(creditCardlist.size()>0) {
							
							model1.put("listforDropDown",creditCardlist);
						}
						model.addAttribute(cardListmap);
						model.addAttribute("creditCardBean",creditCardBean);
						return "CreditCardDetails";
					}
					//for git bash
					@RequestMapping(value = "/submitCreditDetails", method = RequestMethod.POST)
					public String submitCreditDetails(@ModelAttribute("creditCardBean") @Valid CreditCardBean creditCardBean,	
								HttpServletRequest request, ModelMap modelMap) {
							HttpSession session=request.getSession(true);
							CreditCardBean cardBean=new CreditCardBean();
							String userName=(String)session.getAttribute("userName");
							cardBean=creditDao.creditDetails(creditCardBean,userName);
							if(null!=cardBean) {
								modelMap.put("saveFlag", "Y");
							}
							
							return "CreditCardDetails";
						}
					
					@RequestMapping(value="/")
					public ModelAndView getCreditCardDetails(ModelAndView mav) {
						mav.setViewName("ShowEmiList");
						mav.addObject("emiList", "");
						return mav;
					}
					
					@RequestMapping(value="/showCreditDetails")
					public String showDetials()
					{
						return "";		
					}
					
					@RequestMapping(value = "/exitFromCredit")
					public String Exit(Model model) {
						CreditCardBean creditCardBean=new CreditCardBean();
						model.addAttribute("creditCardBean", creditCardBean);
						return "Index";
					}
					
					
					@RequestMapping(value = "/showDetailsForCreditEmi")
					public String showDetailsForCreditEmi(Model model,ModelMap map, HttpServletRequest request) {
						HttpSession session=request.getSession(true);
						CreditCardBean creditCardBean=new CreditCardBean();
						RestTemplate restTemplate = new RestTemplate();
						ResponseEntity<CreditCardBean> responseEntity=null;
						String userName=(String)session.getAttribute("userName");
						HttpEntity<CreditCardBean> restrequest = new HttpEntity<>(creditCardBean);
						/*
						if(null !=userName && !userName.isEmpty()) {
							creditCardBean=restTemplate.postForObject(baseURL, creditCardBean, CreditCardBean.class);	
						}*/
						//System.out.println(responseEntity.getBody());
						List<CreditCardBean> cardInfoList=creditDao.findCardDetailsForUser(userName);
						//request.setAttribute("cardInfoList", cardInfoList);
						
						map.put("ListDrop", cardInfoList);
						
						model.addAttribute("cardInfoList", cardInfoList);
						model.addAttribute("creditCardBean", creditCardBean);
						
						
						return "creditDetailsTabs";
					}
		
					@RequestMapping(value="/showCreditDetialsForCard", method = RequestMethod.GET)
					public @ResponseBody List<CreditCardBean> showCreditDetialsForCard(@RequestParam("cardName")String cardName, @RequestParam("cardNum")String cardNum, 
							@RequestParam("cardDate")String cardDate, @RequestParam("toDate")String toDate, HttpServletRequest request) {
						HttpSession session=request.getSession(true);
						CreditCardBean cardBean=new CreditCardBean();
						String userName=(String)session.getAttribute("userName");
						List<CreditCardBean> showCreditList=new ArrayList<CreditCardBean>();
						
						
						
						cardBean.setCardName(cardName);
						cardBean.setCardNum(cardNum);
						cardBean.setCardDate(cardDate);
						cardBean.setToDate(toDate);
						CreditCardBean cardBean2=new CreditCardBean();
						showCreditList=creditDao.getcreditDetails(cardBean,userName,"showEmi");				
						logger.info("CreditList>>"+showCreditList);
						
						request.setAttribute("showCreditList", showCreditList);
						
						return showCreditList;
					}
					
					@RequestMapping(value="/getcardNumber", method = RequestMethod.GET)
					public @ResponseBody List<CreditCardBean> getcardNumber(@RequestParam("cardName")String cardName) {
						
						List <CreditCardBean>list=new ArrayList<CreditCardBean>();
						
						CreditCardBean cardBean2=new CreditCardBean();
						list=creditDao.getcardNumber(cardName);
						
						return list;
					}

					@RequestMapping(value = "/generate/pdf.htm", method = RequestMethod.GET)
					 ModelAndView generatePdf(HttpServletRequest request,
					   HttpServletResponse response) throws Exception {
					  System.out.println("Calling generatePdf()...");
					  
					  CreditCardBean employee = new CreditCardBean();
					  employee.setCardName("Yashwant");
					  employee.setCardUser("Chavan");
					  
					  ModelAndView modelAndView = new ModelAndView("pdfView", "command",employee);
					  
					  return modelAndView;
					 }	
}
