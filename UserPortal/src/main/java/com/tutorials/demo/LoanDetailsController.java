package com.tutorials.demo;
import com.tutorials.LoanDetaislDao.LoanDetailsDAO;
import com.tutorials.Utils.*;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mysql.jdbc.Constants;
import com.tutorials.bean.LoanDetailsPojo;
import com.tutorials.bean.LoanDetailsVO;
import com.tutorials.bean.UserLoanBean;
import com.tutorials.userregbean.UserRegBean;

@Controller
@RequestMapping("loanDetailsControl")
public class LoanDetailsController {
	
	
	@Autowired
	LoanDetailsDAO detaislDAO;
	
	private Logger logger = Logger.getLogger(LoanDetailsController.class);
	@RequestMapping(value="/addLoanDetails")
	public String addLoanDetails(ModelMap model, HttpServletRequest request, HttpServletResponse response) {
		
		logger.info("Inside COntroller");
	
		List tenList=new ArrayList();;
		String tenLi=com.tutorials.Utils.Constants.tenureData;
		String [] arrOftenList=tenLi.split(",");
		
		for(int i=0; i<arrOftenList.length; i++) {
			tenList.add(arrOftenList[i]);
		}
		
		logger.info("list of tenure "+tenList);
		for(int j=0; j<tenList.size(); j++) {
			logger.info(j);
			logger.info("list value--"+tenList.get(j));
			
		}	
		//LoanDetailsPojo loanDetailsPojo=new LoanDetailsPojo();
		
		model.put("tenureList", tenList);
		model.put("loanDetailsModel",new LoanDetailsVO());
		return "LoanDetails";
	}
	
	
	@RequestMapping(value="/saveLoanDetails")
	public String saveLoanDetails(@ModelAttribute("loanDetailsModel") LoanDetailsVO loanDetailsVO, Model model) {
		
		logger.info("Inside SaveLoanDetails--");
		
		String str=null;
		try {
			
			str=loanDetailsVO.getArea_city();
			
			str=detaislDAO.saveLoanDetails(loanDetailsVO);
			
			model.addAttribute("str", str);
			/*
			
			LoanDetailsVO detailsVO=new LoanDetailsVO();
			UserLoanBean loanBean=new UserLoanBean();
			
			detailsVO.setLoan_bank_name(loanDetailspojo.getLoan_bank_name());
			detailsVO.setEmi(loanDetailspojo.getEmi());
			detailsVO.setEmi_paid_date(loanDetailspojo.getEmi_paid_date());
			detailsVO.setLoan_date(loanDetailspojo.getLoan_date());
			detailsVO.setLoan_type(loanDetailspojo.getLoan_type());
			detailsVO.setLoan_date(loanDetailspojo.getLoan_date());
			detailsVO.setDatetimeCreated(new Date());
			detailsVO.setDatetimeUpdated(new Date());
			
			loanBean.setArea_city(loanDetailspojo.getArea_city());
			loanBean.setBuilder(loanDetailspojo.getBuilder());
			loanBean.setContact_num(loanDetailspojo.getContact_num());
			loanBean.setPincode(loanDetailspojo.getPincode());
			loanBean.setProp_Address(loanDetailspojo.getProp_Address());
			loanBean.setProperty_name(loanDetailspojo.getProperty_name());
			
			
			detailsVO.setLoanBean(loanBean);
			//loanDetailsVO.setLoanBean(loanDetailsVO);
			str=detaislDAO.saveLoanDetails(detailsVO);
			model.addAttribute("saved", str);
			
				
		*/}catch (Exception e) {
				logger.info(e);
				logger.fatal(e);
		}
		return "LoanDetails";
		
		
		
		
	}
	
}
