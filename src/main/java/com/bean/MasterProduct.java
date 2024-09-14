package com.bean;

 import java.util.List; 
 
public class MasterProduct {

	List<LaptopBean> laptops;
	List<MobileBean> mobiles;
	List<CameraBean> cameras;
	List<SmartWatchBean> smartwatches;

	public List<LaptopBean> getLaptops() {
		return laptops;
	}

	public void setLaptops(List<LaptopBean> laptops) {
		this.laptops = laptops;
	}

	public List<MobileBean> getMobiles() {
		return mobiles;
	}

	public void setMobiles(List<MobileBean> mobiles) {
		this.mobiles = mobiles;
	}

	public List<CameraBean> getCameras() {
		return cameras;
	}

	public void setCameras(List<CameraBean> cameras) {
		this.cameras = cameras;
	}

	public List<SmartWatchBean> getSmartwatches() {
		return smartwatches;
	}

	public void setSmartwatches(List<SmartWatchBean> smartwatches) {
		this.smartwatches = smartwatches;
	}
	
}
