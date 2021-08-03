package model;

public class PurchaseVO {
	private String order_id;
	private String name;
	private String tel;
	private String address;
	private String paytype;
	private String status;
	private String padte;
	private String email;
	
	public String getOrder_id() {
		return order_id;
	}
	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPaytype() {
		return paytype;
	}
	public void setPaytype(String paytype) {
		this.paytype = paytype;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getPadte() {
		return padte;
	}
	public void setPadte(String padte) {
		this.padte = padte;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	@Override
	public String toString() {
		return "PurchaseVO [order_id=" + order_id + ", name=" + name + ", tel=" + tel + ", address=" + address
				+ ", paytype=" + paytype + ", status=" + status + ", padte=" + padte + ", email=" + email + "]";
	}

}
