package com.tutorials.LoanDetaislDao;

import java.io.Serializable;

import com.tutorials.bean.LoanDetailsVO;
import com.tutorials.bean.LoanPropBean;

public interface LoanDetailsDAO {
	
	
	public Serializable saveLoanDetails(LoanDetailsVO detailsVO);

}
