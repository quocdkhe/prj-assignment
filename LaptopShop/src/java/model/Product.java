/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Quoc
 */
public class Product {

    private int id;
    private String cpu;
    private long price;
    private int unitsSold;
    private int stockUnits;
    private String batteryCapacity;
    private String operatingSystem;
    private String screen;
    private String ram;
    private String productName;
    private String design;
    private String warrantyInfo;
    private String generalInfo;
    private String vga;
    private String hardDrive;
    private Brand brand;
    private Category category;
    private String image;

    public Product() {
    }

    public Product(int id, String cpu, long price, int unitsSold, int stockUnits, String batteryCapacity, String operatingSystem, String screen, String ram, String productName, String design, String warrantyInfo, String generalInfo, String vga, String hardDrive, Brand brand, Category category, String image) {
        this.id = id;
        this.cpu = cpu;
        this.price = price;
        this.unitsSold = unitsSold;
        this.stockUnits = stockUnits;
        this.batteryCapacity = batteryCapacity;
        this.operatingSystem = operatingSystem;
        this.screen = screen;
        this.ram = ram;
        this.productName = productName;
        this.design = design;
        this.warrantyInfo = warrantyInfo;
        this.generalInfo = generalInfo;
        this.vga = vga;
        this.hardDrive = hardDrive;
        this.brand = brand;
        this.category = category;
        this.image = image;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCpu() {
        return cpu;
    }

    public void setCpu(String cpu) {
        this.cpu = cpu;
    }

    public long getPrice() {
        return price;
    }

    public void setPrice(long price) {
        this.price = price;
    }

    public int getUnitsSold() {
        return unitsSold;
    }

    public void setUnitsSold(int unitsSold) {
        this.unitsSold = unitsSold;
    }

    public int getStockUnits() {
        return stockUnits;
    }

    public void setStockUnits(int stockUnits) {
        this.stockUnits = stockUnits;
    }

    public String getBatteryCapacity() {
        return batteryCapacity;
    }

    public void setBatteryCapacity(String batteryCapacity) {
        this.batteryCapacity = batteryCapacity;
    }

    public String getOperatingSystem() {
        return operatingSystem;
    }

    public void setOperatingSystem(String operatingSystem) {
        this.operatingSystem = operatingSystem;
    }

    public String getScreen() {
        return screen;
    }

    public void setScreen(String screen) {
        this.screen = screen;
    }

    public String getRam() {
        return ram;
    }

    public void setRam(String ram) {
        this.ram = ram;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getDesign() {
        return design;
    }

    public void setDesign(String design) {
        this.design = design;
    }

    public String getWarrantyInfo() {
        return warrantyInfo;
    }

    public void setWarrantyInfo(String warrantyInfo) {
        this.warrantyInfo = warrantyInfo;
    }

    public String getGeneralInfo() {
        return generalInfo;
    }

    public void setGeneralInfo(String generalInfo) {
        this.generalInfo = generalInfo;
    }

    public String getVga() {
        return vga;
    }

    public void setVga(String vga) {
        this.vga = vga;
    }

    public String getHardDrive() {
        return hardDrive;
    }

    public void setHardDrive(String hardDrive) {
        this.hardDrive = hardDrive;
    }

    public Brand getBrand() {
        return brand;
    }

    public void setBrand(Brand brand) {
        this.brand = brand;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    @Override
    public String toString() {
        return "Product{" + "id=" + id + ", cpu=" + cpu + ", price=" + price + ", unitsSold=" + unitsSold + ", stockUnits=" + stockUnits + ", batteryCapacity=" + batteryCapacity + ", operatingSystem=" + operatingSystem + ", screen=" + screen + ", ram=" + ram + ", productName=" + productName + ", design=" + design + ", warrantyInfo=" + warrantyInfo + ", generalInfo=" + generalInfo + ", vga=" + vga + ", hardDrive=" + hardDrive + ", brand=" + brand + ", category=" + category + ", image=" + image + '}';
    }

}
