package com.tutorials.demo;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.client.ClientHttpRequestFactory;
import org.springframework.http.client.HttpComponentsClientHttpRequestFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.tutorials.Utils.Encryption;
import com.tutorials.Utils.PasswordGeneratorClass;
import com.tutorials.bean.AutoMobSaveBean;
import com.tutorials.bean.EmploymentDetailsBean;
import com.tutorials.bean.LapNameBean;
import com.tutorials.bean.LaptopEmiBean;
import com.tutorials.bean.LoginBean;
import com.tutorials.bean.LoginBeanVO;
import com.tutorials.bean.ProjectDetailsRepsonse;
import com.tutorials.dao.PortalDao;
import com.tutorials.userregDao.UserRegisterDAO;
import com.tutorials.userregbean.UserRegBean; 

@Controller

public class HomeController {
	
	@Autowired
	PortalDao portalDao;
	
	@Autowired
	UserRegisterDAO userRegDao;
	
	
	String url="http://localhost:8080/RestAPI/rest/produceboth/both";
	
	
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String home(Model model) {
                    LoginBean logBean = new LoginBean();
                    model.addAttribute("logBean", logBean);
                    System.out.println("---------Inside Login Controller.java-----------");
                    return "LoginPage";

    }               

    @RequestMapping(value = "/addStudent", method = RequestMethod.POST)
   	public String addStudent(@ModelAttribute("logBean") @Valid LoginBean logBean, BindingResult result, ModelMap model,HttpServletRequest request)
   {
    String techStatus="";       	
	HttpSession session = request.getSession(true);
	LoginBeanVO beanVO=null;
	EmploymentDetailsBean detailsBean=null;
	
	
	RestTemplate restTemplate = new RestTemplate();
	
	
	
	List employList=new ArrayList<>();
	if (result.hasErrors()) {
		return "LoginPage";
	}
		String changePasswordFromPortal=logBean.getPassWord();
		
		changePasswordFromPortal=Encryption.encrypt(changePasswordFromPortal);
		
		beanVO=portalDao.validateUserFromDb(logBean);
		
		if("notValidated".equals(beanVO.getStatus())) {
		request.setAttribute("notValidatedFlag", "Y");
		return "LoginPage";
		}
		else {
			if (!PasswordGeneratorClass.checkPassword(changePasswordFromPortal,beanVO.getUser_Pass())) {
				model.put(com.tutorials.Utils.Constants.CHANGE_PASSWORD, logBean);
				model.put(com.tutorials.Utils.Constants.ERROR_MSG,
						"Password Doesnt Matched");
				return "LoginPage";
			}
			
		}		
		session.setAttribute("userName", logBean.getUserName());
		session.setAttribute(com.tutorials.Utils.Constants.USER_SESSION_EMAIL, beanVO.getUser_Email());
		session.setAttribute(com.tutorials.Utils.Constants.USER_SESSION_MODEL, logBean);
		
		
       if("HCLTECH".equals(logBean.getDomain())) {
    	  techStatus="HCLTECH";
		}else if("STRAWBERRY".equals(logBean.getDomain())) {
			techStatus="STRW";
		}else if("KMG".equals(logBean.getDomain())) {
			techStatus="KMG";
		}
       detailsBean=portalDao.getEmploymentList(techStatus);
       
       ProjectDetailsRepsonse projDetailsResponse=restTemplate.getForObject(url, ProjectDetailsRepsonse.class);
       
        model.put("empId", detailsBean.getEmpID());
        model.put("empName", detailsBean.getEmpName());
        model.put("compName", detailsBean.getCompanyName());
        model.put("wrkLocation", detailsBean.getWorkingLocation());
        model.put("tower", detailsBean.getTower());
        model.put("appTower", detailsBean.getAppTower());
        model.put("techSpec", detailsBean.getTechnicalSpecs());
        
        model.put("projCode", projDetailsResponse.getProjectCode());
        model.put("projName", projDetailsResponse.getProjectName());
        model.put("golubId", projDetailsResponse.getGolubID());
        
        
        
       System.out.println("dfdfdfd>>>"+detailsBean.getEmpName()+"projDetailsResponse>>>>>>"+projDetailsResponse.getProjectCode());
       
		model.put("techStatus", techStatus);
		return "Index";
	}
                
    @RequestMapping(value = "/Logout")
	public String Logout(Model model, HttpServletRequest request) {
		
		HttpSession httpSession=request.getSession();
		httpSession.removeAttribute("userName");
		request.getSession().invalidate();
		LoginBean logBean = new LoginBean();
		model.addAttribute("logBean", logBean);
		return "LoginPage";

	}
                
        @RequestMapping(value = "/Exit")
		public String Exit(Model model) {
			LoginBean logBean = new LoginBean();
			model.addAttribute("logBean", logBean);
			return "Index";
		}
        
        		
    			@RequestMapping(value = "/showlaptopEmi")
    					public String showlaptopEmi( Model model) {	
    					LaptopEmiBean laptopEmiBean=null;
    					Map<String, String> lapDropDownMap=new HashMap();
    					List laplist=new ArrayList();
    					LapNameBean lapNameBean=null;
    					laplist=portalDao.showLapList();
    					if(laplist.size()>0) {
    					Iterator iterator=laplist.iterator();
    					while(iterator.hasNext()) {
    					laptopEmiBean=(LaptopEmiBean)iterator.next();
    					lapNameBean=new LapNameBean();
    					lapNameBean.setLapNameKey(laptopEmiBean.getLapModel());
    					lapNameBean.setLapNameValue(laptopEmiBean.getLapName());
    					lapDropDownMap.put(lapNameBean.getLapNameKey(), lapNameBean.getLapNameValue());
    					}
    					}
    									
    					model.addAttribute("laptopEmiBean",lapDropDownMap);
    					return "lapTopEmiPage";
    					}
    			
    			@RequestMapping(value = "/showEmiList")
				public ModelAndView showEmiList(@RequestParam("userName") String userName, ModelAndView mav, ModelMap modelMap) {
					AutoMobSaveBean mobshowBean = new AutoMobSaveBean();
					List list = new ArrayList();
					if (null != userName && userName.equals("vicky")) {
			
						list = portalDao.findEmiOption(userName, mobshowBean);
					} else {
			
						mav.addObject("noList", "No Emi List for available User");
					}
					if(list.size()>=14) {
						mav.addObject("Info_Msg", com.tutorials.Utils.Constants.INFO_MSG);
						mav.addObject("Completed", "Y");
						mav.setViewName("ShowEmiList");
					}
					else {							
						mav.setViewName("ShowEmiList");
						mav.addObject("emiList", list);
					}
						return mav;
				}
		
		@RequestMapping(value = "/ShowAddEmiPage")
			public String AddDetails() {
				return "addEmiforAutMob";
			}
		
		@RequestMapping(value = "/addEmiforAutMob", method = RequestMethod.POST)
		public @ResponseBody String addEmiforAutMob(@RequestParam("month") String month,@RequestParam("amountPaid") String amountPaid, @RequestParam("paidDate") String paidDate,@RequestParam("bikeName") String bikeName)
				{
					AutoMobSaveBean autoMobSaveBean = new AutoMobSaveBean();
					autoMobSaveBean.setMonth(month);
					autoMobSaveBean.setAmountToPaid(amountPaid);
					autoMobSaveBean.setDateOfPaid(paidDate);
					autoMobSaveBean.setBikeName(bikeName);
					autoMobSaveBean = portalDao.saveEmiDetails(autoMobSaveBean);
					return "Data saved Successfully";
				}
		
		@RequestMapping(value="/doSetup")
			public @ResponseBody String doSetup(@RequestParam("userName")String userName,
					@RequestParam("userPass")String userPass,
						HttpServletRequest request){
						String success=portalDao.saveUserSetup(userName,userPass);
						return success;
				}
		
		@RequestMapping(value ="/showSetup")
			public String showSetupPage(Model model) {
				return "UserSetup";
			}
		
		@RequestMapping(value = "/saveLoanEmiDetails", method = RequestMethod.POST)
	    public String addUserRegsterDetails(@ModelAttribute("userRegister") UserRegBean userRegBean, Model model) {
			String str=null;
			userRegBean.setUser_Pass(Encryption.encrypt(userRegBean.getUser_Pass()));
			str=userRegDao.addUserRegDetails(userRegBean);
			model.addAttribute("userSetupFlag",str);
			return "UserSetup";
	    }
		
		
}