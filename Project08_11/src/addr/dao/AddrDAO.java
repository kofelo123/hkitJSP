package addr.dao;

import java.sql.*;
import java.util.*;

import addr.dto.AddrDTO;


public class AddrDAO {

	Connection con=null;
	ResultSet rs= null;
	String sql="";
	PreparedStatement pstmt = null;
	String searchSql="";
	
	public AddrDAO() {
		try{
			Class.forName("com.mysql.jdbc.Driver");
		}catch(ClassNotFoundException e){
			e.printStackTrace();
		}
		
		try{
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/addr","hkitJeongwon","gj0123");
		}catch(SQLException e){
			e.printStackTrace();
		}
		
	}
	
	public Vector getAddressList(){//쿼리문 수행후 결과를 vector에 저장하기
		
		Vector datas = new Vector();
		
		sql="select * from addrbook order by id desc";

		try{
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				AddrDTO addrbook = new AddrDTO();
				
				addrbook.setId(rs.getInt("id"));
				addrbook.setName(rs.getString("name"));
				addrbook.setEmail(rs.getString("email"));
				addrbook.setBirthday(rs.getString("birthday"));
				addrbook.setPhonenum(rs.getString("phonenum"));
				addrbook.setCompany(rs.getString("company"));
				addrbook.setMemo(rs.getString("memo"));
				datas.add(addrbook);
			}
			rs.close();
			pstmt.close();
			con.close();
		}catch(SQLException e){
			e.printStackTrace();
		}
		return datas;
	}	
	
	public boolean insertData(AddrDTO addrBean){
		sql = "insert into addrbook(name,email,phonenum,birthday,company,memo)values(?,?,?,?,?,?)";
		try{
		pstmt=con.prepareStatement(sql);
		pstmt.setString(1, addrBean.getName());
		pstmt.setString(2, addrBean.getEmail());
		pstmt.setString(3, addrBean.getPhonenum());
		pstmt.setString(4, addrBean.getBirthday());
		pstmt.setString(5, addrBean.getCompany());
		pstmt.setString(6, addrBean.getMemo());
		pstmt.executeUpdate();
		
		pstmt.close();
		con.close();
		}catch(SQLException e){
			e.printStackTrace();
			return false;
		}
			return true;
	}
	
	public AddrDTO selectById(String id){
		sql="select * from addrbook where id=?";
		AddrDTO addrBean=null;
		try{
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			rs.next();
			addrBean = new AddrDTO();
			addrBean.setId(rs.getInt("id"));
			addrBean.setName(rs.getString("name"));
			addrBean.setEmail(rs.getString("email"));
			addrBean.setBirthday(rs.getString("birthday"));
			addrBean.setPhonenum(rs.getString("phonenum"));
			addrBean.setCompany(rs.getString("company"));
			addrBean.setMemo(rs.getString("memo"));
			
			rs.close();
			pstmt.close();
			con.close();
		}catch(SQLException e){
			e.printStackTrace();
		}
		return addrBean;
	}
	
	public boolean updateBean(AddrDTO addrBean){
		System.out.println(addrBean);
		sql="update addrbook set name=?,email=?,phonenum=?,birthday=?,company=?,memo=? where id=?";
		try{
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,addrBean.getName());
			pstmt.setString(2, addrBean.getEmail());
			pstmt.setString(3, addrBean.getPhonenum());
			pstmt.setString(4, addrBean.getBirthday());
			pstmt.setString(5, addrBean.getCompany());
			pstmt.setString(6, addrBean.getMemo());
			pstmt.setInt(7, addrBean.getId());
			pstmt.executeUpdate();
			
			pstmt.close();
			con.close();
		}catch(SQLException e){
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
	public boolean deleteById(String id){
		sql="delete from addrbook where id=?";
		try{
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.executeUpdate();
			
			pstmt.close();
			con.close();
		}catch(SQLException e){
			e.printStackTrace();
			return false;
		}
		
		return true;
		
		
	}
	public Vector getSearchAddressList(String searchSql){
		
		Vector datas = new Vector();
	
		sql="select * from addrbook "+searchSql+" order by id desc";
		try{
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while(rs.next()){
				AddrDTO addrbook = new AddrDTO();
				
				addrbook.setId(rs.getInt("id"));
				addrbook.setName(rs.getString("name"));
				addrbook.setEmail(rs.getString("email"));
				addrbook.setBirthday(rs.getString("birthday"));
				addrbook.setPhonenum(rs.getString("phonenum"));
				addrbook.setCompany(rs.getString("company"));
				addrbook.setMemo(rs.getString("memo"));
				datas.add(addrbook);
			}
			rs.close();
			pstmt.close();
			con.close();
		}catch(SQLException e){
			e.printStackTrace();
		}
		return datas;
	}
}