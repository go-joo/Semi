package model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
	//로그인
	public UserVO read(String id) {
		UserVO vo=new UserVO();
		try {
			String sql="select * from userinfo where id=?";
			PreparedStatement ps=Db.con.prepareStatement(sql);
			ps.setString(1, id);
			ResultSet rs=ps.executeQuery();
			if(rs.next()) {
				vo.setId(rs.getString("id"));
				vo.setPass(rs.getString("pass"));
				vo.setUname(rs.getString("uname"));
				vo.setEmail(rs.getString("email"));
				vo.setTel(rs.getString("tel"));
				vo.setAddress(rs.getString("address"));
				
			}
		}catch(Exception e) {
			System.out.println("오류:"+e.toString());
		}
		return vo;
	}
}
