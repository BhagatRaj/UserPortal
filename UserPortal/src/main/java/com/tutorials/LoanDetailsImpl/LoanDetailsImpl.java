package com.tutorials.LoanDetailsImpl;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.tutorials.LoanDetaislDao.LoanDetailsDAO;
import com.tutorials.bean.LoanDetailsVO;


@Repository("detaislDAO")
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

	public String saveLoanDetails(LoanDetailsVO loanDetailsVO) {
		Session session=sessionFactory.getCurrentSession();
		session.persist(loanDetailsVO);
		return "save";
	}

}
