package com.tutorials.FileUploadDao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.tutorials.BaseDao.BaseDAO;
import com.tutorials.bean.ExcelVO;

public class FileUploadDao extends BaseDAO{

	
	public boolean saveFileDataInDB(List<ExcelVO> employeeList){
		String sql = "insert into expensedata (Date, Amount, Owner, Description, Validated) "
				+ " VALUES (:date, :amount, :owner, :description, :validated)";
		try {
			List<Map<String, String>> batchUpdateParams = new ArrayList<>();
			
				for(ExcelVO vo : employeeList){
					Map<String, String> paramMap = new HashMap<String, String>();
					paramMap.put("date", vo.getDate());
					paramMap.put("amount", vo.getAmount());
					paramMap.put("owner", vo.getOwner());
					paramMap.put("description", vo.getDescription());
					paramMap.put("validated", vo.getValidated());
					//paramMap.put("totalTransactionAmount", vo.getTotalTransactionAmount());
					batchUpdateParams.add(paramMap);
				}
				
				getNamedParamJdbcTemplate().batchUpdate(sql, batchUpdateParams.toArray(new Map[batchUpdateParams.size()] ));
			
		} catch (Exception e) {
			e.printStackTrace(); 
			return false;
		}
		
		return true;
		
	}
}
