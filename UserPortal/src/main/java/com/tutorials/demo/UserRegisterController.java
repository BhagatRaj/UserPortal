package com.tutorials.demo;

import java.io.Serializable;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tutorials.Utils.Encryption;
import com.tutorials.Utils.PasswordGeneratorClass;
import com.tutorials.bean.ChangePassword;
import com.tutorials.bean.LoginBean;
import com.tutorials.usereg.service.UserRegService;
import com.tutorials.userregDao.UserRegisterDAO;
import com.tutorials.userregbean.UserRegBean;


@Controller
@RequestMapping("userRegController")
		public class UserRegisterController {
		
			@Autowired
			UserRegisterDAO userRegDao;
			
			@RequestMapping(value = "/saverUserRegistration", method = RequestMethod.POST)
			    public String addUserRegsterDetails(@ModelAttribute("userRegister") UserRegBean userRegBean, Model model) {
					String str=null;
					userRegBean.setUser_Pass(Encryption.encrypt(userRegBean.getUser_Pass()));
					str=userRegDao.addUserRegDetails(userRegBean);
					model.addAttribute("userSetupFlag",str);
					return "UserSetup";
			    }
		
			@RequestMapping(value="/viewMyProfile")
			public String viewMyProfile(ModelMap model, HttpServletRequest request,	HttpServletResponse response) throws Exception {
					HttpSession session = request.getSession();
					LoginBean userSession = (LoginBean) session.getAttribute(com.tutorials.Utils.Constants.USER_SESSION_MODEL);
					String userEmai_id=(String)session.getAttribute(com.tutorials.Utils.Constants.USER_SESSION_EMAIL);
					if(userSession !=null) {
						UserRegBean regBean=null;
						
						try {
							regBean=userRegDao.viewProfile(userEmai_id);
							model.put("regBeanModel", regBean);
							
						}catch (Exception e) {
							e.printStackTrace();
						}
					}else {
						
						//model.put(key, value)
					}	
					return "viewProfile";
				}
			
			@RequestMapping(value="/changePassword")
			public String changePassword(ModelMap model, HttpServletRequest request,
						HttpServletResponse response) throws Exception {
				HttpSession session = request.getSession();
				if (session.getAttribute(com.tutorials.Utils.Constants.USER_SESSION_MODEL) != null) {
					model.put(com.tutorials.Utils.Constants.CHANGE_PASSWORD, new ChangePassword());
					return "changePassword";
				}
				return "/login";
			}

			
			@RequestMapping(value = "/passWordChange")
			public String passWordChange(ModelMap model,@ModelAttribute("changePassword") ChangePassword changePassword,HttpServletRequest request,
					HttpServletResponse responsemode) throws Exception
			{	
				HttpSession session = request.getSession();
				if(session.getAttribute(com.tutorials.Utils.Constants.USER_SESSION_MODEL)!=null)
	{
		//LoginBean loginBean=null;
		UserRegBean regBean=null;
		String userEmail=null;
		String changePasswordFromPortal=changePassword.getOldPassword();
		
		try {
			userEmail=(String) session.getAttribute(com.tutorials.Utils.Constants.USER_SESSION_EMAIL);
			
			UserRegBean regBean2=userRegDao.viewProfile(userEmail);
			
			changePasswordFromPortal=Encryption.encrypt(changePasswordFromPortal);
			
			if (!PasswordGeneratorClass.checkPassword(changePasswordFromPortal,regBean2.getUser_Pass())) {
				model.put(com.tutorials.Utils.Constants.CHANGE_PASSWORD, changePassword);
				model.put(com.tutorials.Utils.Constants.ERROR_MSG,
						"Current Password is not matched with entered password.");
				return "changePassword";
			}
			regBean2.setUser_Pass(Encryption.encrypt(changePassword.getConfirmPassword()));						
			Serializable result=userRegDao.updatePasswordForUser(regBean2);
			
			if(result!=null) {
				
				return "/";
			}
			
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}
				return null;
				
			}
}
