package com.tutorials.CredDaoImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.tutorials.CreditDao.CreditDao;
import com.tutorials.bean.CreditCardBean;
import com.tutorials.bean.LaptopEmiBean;
import com.tutorials.sqlConstants.MedSqlConstants;

public class CreditDaoImpl implements CreditDao {
	private DataSource dataSource;
	JdbcTemplate jdbcTemplate;
	
	
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	public CreditCardBean creditDetails (CreditCardBean creditCardBean, String userName) {
		//String insertQuery="insert into autoemi(StartMonth,AmountPaid,DateOfPaid,BikeName)  values('"+autoMobSaveBean.getMonth()+"','"+autoMobSaveBean.getAmountToPaid()+"','"+autoMobSaveBean.getDateOfPaid()+"','"+autoMobSaveBean.getBikeName()+"')"; 
		String insertQuery="insert into creditcard(CardName,CardNum,CreditExp,CredExpMonth,ExpenseYear,Comment,CardType,CardUser)  values(?,?,?,?,?,?,?,?)";
		
		jdbcTemplate =new JdbcTemplate(dataSource);
		Object[] args = new Object[] {creditCardBean.getCardName(),creditCardBean.getCardNum(),creditCardBean.getCreditExpAm(),creditCardBean.getCreditExpMonth(),creditCardBean.getCreditExpYear(), creditCardBean.getComment(),creditCardBean.getCardType(),userName};
		int out=jdbcTemplate.update(insertQuery, args);
		if(out!=0){
			System.out.println("Employee Saved with"+creditCardBean.getCardNum());
		}else{
			System.out.println("Failed");
		}
		
		
	/*	try{
			Connection connection=null;
			connection=dataSource.getConnection();	
			
			PreparedStatement preparedStatement=connection.prepareStatement(insertQuery);
			preparedStatement.setString(1, autoMobSaveBean.getMonth());
			preparedStatement.setString(2, autoMobSaveBean.getAmountToPaid());
			preparedStatement.setString(3, autoMobSaveBean.getDateOfPaid());
			preparedStatement.setString(4, autoMobSaveBean.getBikeName());

			preparedStatement.executeUpdate();
			preparedStatement.close();
			
			
			
		}catch (SQLException e) {
			e.printStackTrace();
		}*/
		
		return creditCardBean;
	}
	

	@Override
	public List<CreditCardBean> getcreditDetailsForUser(String userName) {
		//CreditCardBean cardBean2=null; 
		CreditCardBean cardBean=null;
		Connection connection=null;
		List <CreditCardBean>list=new ArrayList<CreditCardBean>();
		String sql="select cardName, cardNumber, cardType from carddetails where cardUser=?";
		try {
			connection=dataSource.getConnection();
			PreparedStatement preparedStatement=connection.prepareStatement(sql);
			preparedStatement.setString(1, userName);
			ResultSet resultSet=preparedStatement.executeQuery();
			while(resultSet.next()){
				cardBean=new CreditCardBean();
				cardBean.setCardName(resultSet.getString("cardName"));
				cardBean.setCardNum(resultSet.getString("cardNumber"));
				cardBean.setCardType(resultSet.getString("cardType"));
				
				list.add(cardBean);
				
			}
			
			
		}catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	
	
	public List<CreditCardBean> getcreditDetails (CreditCardBean cardBean, String userName, String test) {
		//String sql="select CardName,CardNum,CreditExp,CredExpMonth,ExpenseYear,Comment,CardType,CardUser from creditcard where CardName=? and CardNum=? and CardUser=?";
		CreditCardBean cardBean2=null;
		Connection connection=null;
		List<CreditCardBean> cardBeansList=new ArrayList<>();
		StringBuilder sqlBuilder=new StringBuilder();
		String toDate=cardBean.getToDate();
		String fromDate=cardBean.getCardDate();
		
		
		
		try {
			
			sqlBuilder.append(MedSqlConstants.queryForCreditDetailsList);
			if("addEmi".equals(test))
			{
				sqlBuilder.append(" where CardUser=? ");
			}else {
				
				
				sqlBuilder.append(" where CredExpMonth between"+"?"+" and "+"?");
				//CDate(?) and CardNum=? ");
			}
			
			connection=dataSource.getConnection();
			PreparedStatement preparedStatement=connection.prepareStatement(sqlBuilder.toString());
			if(!"addEmi".equals(test)) {
			preparedStatement.setString(1, cardBean.getCardDate());
			preparedStatement.setString(2, cardBean.getToDate());
			//preparedStatement.setString(3, cardBean.getCardNum());
			
			}else {
				preparedStatement.setString(1, userName);
			}
			ResultSet set=preparedStatement.executeQuery();
			
			while(set.next()) {
				cardBean2=new CreditCardBean();
				cardBean2.setCardName(set.getString("CardName"));
				cardBean2.setCardNum(set.getString("CardNum"));
				cardBean2.setCreditExpAm(set.getString("CreditExp"));
				cardBean2.setCreditExpMonth(set.getString("CredExpMonth"));
				cardBean2.setCreditExpYear(set.getString("ExpenseYear"));
				cardBean2.setComment(set.getString("Comment"));
				cardBean2.setCardType(set.getString("CardType"));
				cardBean2.setUserName(set.getString("CardUser"));
				cardBeansList.add(cardBean2);
				
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return cardBeansList;		
	}

	@Override
	public List<CreditCardBean> getcardNumber(String cardName) {
		Connection connection=null;
		List cadNumberList=new ArrayList();
		try {
			String sqlQuery="select distinct CardNum,CardType from creditcard where CardName=?";
			CreditCardBean cardBean=null;
			connection=dataSource.getConnection();
			PreparedStatement preparedStatement=connection.prepareStatement(sqlQuery);
			preparedStatement.setString(1, cardName);
			ResultSet resultSet=preparedStatement.executeQuery();
			while(resultSet.next()){
				cardBean=new CreditCardBean();
				cardBean.setCardNum(resultSet.getString("CardNum"));
				cardBean.setCardType(resultSet.getString("CardType"));
				cadNumberList.add(cardBean);
				
			}
			
		}catch (Exception e) {
			// TODO: handle exception
		}
		return cadNumberList;
	}

	public List <CreditCardBean>findCardDetailsForUser(String User){
		Connection connection=null;
		String sqlQueryForCardDetails="select cardUser,cardName,cardNumber,ExpiryDate,CVV,cardType from carddetails where cardUser=?";
		List<CreditCardBean> beansList=new ArrayList<>();
		try {
			CreditCardBean cardBean=null;
			connection=dataSource.getConnection();
			PreparedStatement preparedStatement=connection.prepareStatement(sqlQueryForCardDetails);
			preparedStatement.setString(1, User);
			ResultSet resultSet=preparedStatement.executeQuery();
			while(resultSet.next()){
				cardBean=new CreditCardBean();
				cardBean.setCardUser(resultSet.getString("cardUser"));
				cardBean.setCardName(resultSet.getString("cardName"));
				cardBean.setCardNum(resultSet.getString("cardNumber"));
				cardBean.setCreditExpYear(resultSet.getString("ExpiryDate"));
				cardBean.setCVV(resultSet.getString("CVV"));
				cardBean.setCardType(resultSet.getString("cardType"));
				beansList.add(cardBean);
				
			}
		
		
		}catch (Exception e) {
			e.printStackTrace();
		}
		return beansList;
	
	}
	}
