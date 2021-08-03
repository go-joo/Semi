package model;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.json.simple.*;

public class ProductDAO {
	//상품정보삭제
	public void delete(String prod_id) {
		try {
			String sql="delete from product where prod_id=?";
			PreparedStatement ps=Db.con.prepareStatement(sql);
			ps.setString(1, prod_id);
			ps.execute();
		}catch(Exception e) {
			
		}
	}
	//상품정보수정
	public void update(ProductVO vo) {
		try {
			String sql="update product set prod_name=?,price=?,prod_del=?,mall_id=?,detail=?,image=? where prod_id=?";
			PreparedStatement ps=Db.con.prepareStatement(sql);
			ps.setString(7, vo.getProd_id());
			ps.setString(1, vo.getProd_name());
			ps.setInt(2, vo.getPrice());
			ps.setString(3, vo.getProd_del());
			ps.setString(4, vo.getMall_id());
			ps.setString(5, vo.getDetail());
			ps.setString(6, vo.getImage());
			ps.execute();
		}catch(Exception e) {
			
		}
		
		
	}
	
	public ProductVO read(String prod_id) {
		ProductVO vo = new ProductVO();
		try {
			String sql="select * from pmall where prod_id=?";
			PreparedStatement ps=Db.con.prepareStatement(sql);
			ps.setString(1, prod_id);
			ResultSet rs=ps.executeQuery();
			if(rs.next()) {
				vo.setProd_id(rs.getString("prod_id"));
				vo.setProd_name(rs.getString("prod_name"));
				vo.setMall_id(rs.getString("mall_id"));
				vo.setProd_del(rs.getString("prod_del"));
				vo.setPrice(rs.getInt("price"));
				vo.setDetail(rs.getString("detail"));
				vo.setImage(rs.getString("image"));
			}
		}catch(Exception e) {
			System.out.println("오류:"+e.toString());
		}
		return vo;
	}
	public String getCode() {
		String prod_id="P001";
		try {
			String sql="select max(prod_id) from product";
			PreparedStatement ps=Db.con.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			if(rs.next()) {
				String lastId=rs.getString("max(prod_id)");
				prod_id="P" + (Integer.parseInt(lastId.substring(1))+1);
			}
		}catch(Exception e) {
			System.out.println("에러:"+e.toString());
		}
		
		return prod_id;
	}
	public void insert(ProductVO vo) {
		
		try {
			String sql="insert into product(prod_id,prod_name,price,prod_del,mall_id,detail,image) values(?,?,?,?,?,?,?)";
			PreparedStatement ps=Db.con.prepareStatement(sql);
			ps.setString(1, vo.getProd_id());
			ps.setString(2, vo.getProd_name());
			ps.setInt(3, vo.getPrice());
			ps.setString(4, "0");
			ps.setString(5, vo.getMall_id());
			ps.setString(6, vo.getDetail());
			ps.setString(7, vo.getImage());
			ps.execute();
		}catch(Exception e) {
			
		}
		
		
	}
	
   //상품목록
   public JSONObject list(SqlVO vo) {
      JSONObject jObject =new JSONObject();
     
      try {
         String sql="{call list(?,?,?,?,?,?,?,?,?)}";
         CallableStatement cs=Db.con.prepareCall(sql);
         cs.setString(1, "pmall");
         cs.setString(2, vo.getKey());
         cs.setString(3, vo.getWord());
         cs.setInt(4, vo.getPage());
         cs.setInt(5, vo.getPerpage());
         cs.setString(6, vo.getOrder());
         cs.setString(7, vo.getDesc());
         cs.registerOutParameter(8, oracle.jdbc.OracleTypes.CURSOR);
         cs.registerOutParameter(9, oracle.jdbc.OracleTypes.INTEGER);
         cs.execute();
        
         ResultSet rs=(ResultSet)cs.getObject(8);

         JSONArray array=new JSONArray();
         while(rs.next()) {
            JSONObject obj=new JSONObject();
            obj.put("prod_id",rs.getString("prod_id"));
            obj.put("prod_name",rs.getString("prod_name"));
            obj.put("image",rs.getString("image"));
            obj.put("price",rs.getInt("price"));
            obj.put("prod_del",rs.getString("prod_del"));
            obj.put("mall_name",rs.getString("mall_name"));
            obj.put("mall_id",rs.getString("mall_id"));
            obj.put("detail",rs.getString("detail"));
            array.add(obj);
         }
         jObject.put("array",array);
         
         int count=cs.getInt(9);
         jObject.put("count",count);
      }catch(Exception e) {System.out.println("에러: "+e.toString());}
      return jObject;
   }
}