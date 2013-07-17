package tool;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Arrays;

public class UserDB {

	public static boolean CheckAccount(String us,String pass){
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/phonebook", "root", "");
			String sql = "select * from user where user_name=? and password=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1,us);
			ps.setString(2,pass);
			ResultSet rs = ps.executeQuery();
			return rs.next();
		}
		catch(Exception e){
			
		}
		return false;
	}

	public static boolean addUser(User u)
	{
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/phonebook", "root", "");
			String sql="select * from tb_contact where user_name=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, u.getUserName());
			ResultSet rs=ps.executeQuery();
			if(rs.next())
				return false;
			sql = "insert into tb_contact values(0,?, ?, ?, ?, ?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, u.getUserName());
			ps.setString(2, u.getNiceName());
			ps.setString(3, u.getUserPhone());
			ps.setString(4, u.getSex());
			ps.setInt(5, u.getAge());
			ps.execute();
			return true;
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return false;
	}
	public static boolean delUser(String user_name){
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/phonebook", "root", "");
			
			String sql="select * from tb_contact where user_name=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, user_name);
			ResultSet rs=ps.executeQuery();
			if(!rs.next())
				return false;
			sql="delete from tb_contact where user_name=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, user_name);
			ps.execute();
			return true;
		}
		catch(Exception ex){
			ex.printStackTrace();
		}
		return true;
	}
	public static boolean updateUser(User u){
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/phonebook", "root", "");
				
			String sql="update tb_contact set nice_name=?,user_age=?,user_phone=?,user_sex=? where user_name=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, u.getNiceName());
			ps.setInt(2,u.getAge());
			ps.setString(3,u.getUserPhone());
			ps.setString(4,u.getSex());
			ps.setString(5,u.getUserName());
			ps.execute();
			return true;
		}
		catch(Exception ex){
			ex.printStackTrace();
		}
		return false;
	}
	
	public static User[] getUser(){
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/phonebook", "root", "");
			String sql = "select * from tb_contact";
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ResultSet rs=ps.executeQuery();
			ArrayList<User>  al = new ArrayList<>();
			while(rs.next()){
				User us=new User();
				us.setAge(rs.getInt("user_age"));
				us.setId(rs.getInt("user_id"));
				us.setUserName(rs.getString("user_name"));
				us.setNiceName(rs.getString("nice_name"));
				us.setUserPhone(rs.getString("user_phone"));
				us.setSex(rs.getString("user_sex"));
				al.add(us);
			}
			if(al.isEmpty())
				return null;
			User[] us=new User[1];
			return Arrays.copyOf(al.toArray(us), al.size());
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return null;
	}
}
