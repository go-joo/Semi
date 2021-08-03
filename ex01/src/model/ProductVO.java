package model;

public class ProductVO {
	public String prod_id;
	public String prod_name;
	public String mall_id;
	public int price;
	public String detail;
	public String image;
	public String prod_del;
	
	public String getProd_id() {
		return prod_id;
	}
	public void setProd_id(String prod_id) {
		this.prod_id = prod_id;
	}
	public String getProd_name() {
		return prod_name;
	}
	public void setProd_name(String prod_name) {
		this.prod_name = prod_name;
	}
	public String getMall_id() {
		return mall_id;
	}
	public void setMall_id(String mall_id) {
		this.mall_id = mall_id;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getProd_del() {
		return prod_del;
	}
	public void setProd_del(String prod_del) {
		this.prod_del = prod_del;
	}
	@Override
	public String toString() {
		return "ProductVO [prod_id=" + prod_id + ", prod_name=" + prod_name + ", mall_id=" + mall_id + ", price="
				+ price + ", detail=" + detail + ", image=" + image + ", prod_del=" + prod_del + "]";
	}
	
}
