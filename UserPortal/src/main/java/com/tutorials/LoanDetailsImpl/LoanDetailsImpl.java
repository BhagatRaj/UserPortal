package com.tutorials.LoanDetailsImpl;

import java.io.Serializable;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tutorials.LoanDetaislDao.LoanDetailsDAO;
import com.tutorials.bean.LoanDetailsVO;
import com.tutorials.bean.LoanPropBean;


@Service("detaislDAO")
public class LoanDetailsImpl  implements LoanDetailsDAO{
	
	@Autowired
	private SessionFactory sessionFactory;

	@Autowired
	private HibernateTemplate hibernateTemplate;
	
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}


	
	@Transactional
	public Serializable saveLoanDetails(LoanDetailsVO loanDetailsVO) {
		Session session=sessionFactory.getCurrentSession();
		Serializable id=session.save(loanDetailsVO);
		return "save"+id;
	}

}
