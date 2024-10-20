/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import context.DBContext;
import java.util.ArrayList;
import java.util.List;
import model.Product;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Quoc
 */
public class ProductDAO extends DBContext {

    private String getPriceRange(String priceRange) {
        String result = "";
        if (priceRange == null) {
            return " AND 1=1";
        }
        switch (priceRange) {
            case "allRange" -> {
                result = " AND 1=1";
            }
            case "under500" -> {
                result = " AND [price] < 500000";
            }
            case "500to1M" -> {
                result = " AND [price] >= 500000 AND [price] <= 1000000";
            }
            case "1Mto5M" -> {
                result = " AND [price] > 1000000 AND [price] <= 5000000";
            }
            case "5Mto10M" -> {
                result = " AND [price] > 5000000 AND [price] <= 5000000";
            }
            case "10to15" -> {
                result = " AND [price] >= 10000000 AND [price] <= 10000000";
            }
            case "15to20" -> {
                result = " AND [price] >= 15000000 AND [price] <= 20000000";
            }
            case "20to30" -> {
                result = " AND [price] >= 20000000 AND [price] <= 30000000";
            }
            case "30andUp" -> {
                result = " AND [price] >= 30000000";
            }
        }
        return result;
    }

    public List<Product> getProducts(int brandId, int categoryId, int offset, int recordsPerPage, String priceRange, String searchKey, String sortOrder) {
        List<Product> listProduct = new ArrayList<>();
        String sql = """
                    SELECT *
                    FROM [LaptopShop].[dbo].[product]
                    WHERE 1=1
                     """;

        // Tìm kiếm theo brandId nếu có
        if (brandId != 0) {
            sql += " AND [manufacturer_id] = " + brandId;
        }

        // Tìm kiếm theo categoryId nếu có
        if (categoryId != 0) {
            sql += " AND [category_id] = " + categoryId;
        }

        // Tìm kiếm theo tên sản phẩm nếu có
        if (searchKey != null && !searchKey.isEmpty()) {
            sql += " AND [product_name] LIKE '%" + searchKey + "%'";
        }

        // Thêm điều kiện lọc giá nếu có
        sql += getPriceRange(priceRange);

        // Sắp xếp giá theo thứ tự tăng hoặc giảm
        if ("asc".equalsIgnoreCase(sortOrder)) {
            sql += " ORDER BY [price] ASC ";
        } else if ("desc".equalsIgnoreCase(sortOrder)) {
            sql += " ORDER BY [price] DESC ";
        } else {
            sql += " ORDER BY [id]"; // Mặc định nếu không chỉ định sắp xếp
        }

        // Phân trang
        String pagination = """
                        OFFSET ? ROWS
                        FETCH NEXT ? ROWS ONLY;
                        """;
        sql += pagination;

        try {
            BrandDAO bdao = new BrandDAO();
            CategoryDAO cdao = new CategoryDAO();
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, offset);
            st.setInt(2, recordsPerPage);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String cpu = rs.getString("cpu");
                int price = rs.getInt("price");
                int unitsSold = rs.getInt("units_sold");
                int stockUnits = rs.getInt("stock_units");
                String batteryCapacity = rs.getString("battery_capacity");
                String operatingSystem = rs.getString("operating_system");
                String screen = rs.getString("screen");
                String ram = rs.getString("ram");
                String productName = rs.getString("product_name");
                String design = rs.getString("design");
                String warrantyInfo = rs.getString("warranty_info");
                String generalInfo = rs.getString("general_info");
                int cid = rs.getInt("category_id");
                String vga = rs.getString("vga");
                String hardDrive = rs.getString("hard_drive");
                int bid = rs.getInt("manufacturer_id");
                String image = rs.getString("image");
                Product p = new Product(id, cpu, price, unitsSold, stockUnits, batteryCapacity, operatingSystem, screen, ram, productName, design, warrantyInfo, generalInfo, vga, hardDrive, bdao.getBrandById(bid), cdao.getCategoryById(cid), image);
                listProduct.add(p);
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return listProduct;
    }

    public int countTotalRecords(int brandId, int categoryId, String priceRange, String searchKey) {
        String sql = """
                        SELECT COUNT(*)
                        FROM [LaptopShop].[dbo].[product]
                        WHERE 1=1
                     """;
        int count = 0;
        String range = getPriceRange(priceRange);
        if (brandId != 0) {
            sql += " AND [manufacturer_id] = " + brandId;
        }
        if (categoryId != 0) {
            sql += " AND [category_id] = " + categoryId;
        }
        if (searchKey != null && !searchKey.isEmpty()) {
            sql += " AND [product_name] LIKE '%" + searchKey + "%'";
        }
        sql += range;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return count;
    }

    public void addProduct(String cpu, int price, int stockUnits, String batteryCapacity, String operatingSystem, String screen, String ram, String productName, String design, String warrantyInfo, String generalInfo, int categoryId, int brandId, String image, String vga, String hardDrive) {
        String sql = """
                 INSERT INTO [dbo].[product]
                            ([cpu]
                            ,[price]
                            ,[units_sold]
                            ,[stock_units]
                            ,[battery_capacity]
                            ,[operating_system]
                            ,[screen]
                            ,[ram]
                            ,[product_name]
                            ,[design]
                            ,[warranty_info]
                            ,[general_info]
                            ,[category_id]
                            ,[manufacturer_id]
                            ,[image]
                            ,[vga]
                            ,[hard_drive])
                      VALUES
                            (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)
                """;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, cpu);  // Setting CPU
            st.setInt(2, price);  // Setting price
            st.setInt(3, 0);  // Setting units sold
            st.setInt(4, stockUnits);  // Setting stock units
            st.setString(5, batteryCapacity);  // Setting battery capacity
            st.setString(6, operatingSystem);  // Setting operating system
            st.setString(7, screen);  // Setting screen
            st.setString(8, ram);  // Setting RAM
            st.setString(9, productName);  // Setting product name
            st.setString(10, design);  // Setting design
            st.setString(11, warrantyInfo);  // Setting warranty info
            st.setString(12, generalInfo);  // Setting general info
            st.setInt(13, categoryId);  // Setting category ID
            st.setInt(14, brandId);  // Setting brand ID
            st.setString(15, image);  // Setting image
            st.setString(16, vga);  // Setting VGA
            st.setString(17, hardDrive);  // Setting hard drive

            // Execute the query
            st.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void addProduct(String productName, int brandId, int categoryId, int price, String generalInfo, String warrantyInfo, int stockUnits, String image) {
        String sql = """
                 INSERT INTO [dbo].[product]
                            ([cpu]
                            ,[price]
                            ,[units_sold]
                            ,[stock_units]
                            ,[battery_capacity]
                            ,[operating_system]
                            ,[screen]
                            ,[ram]
                            ,[product_name]
                            ,[design]
                            ,[warranty_info]
                            ,[general_info]
                            ,[category_id]
                            ,[manufacturer_id]
                            ,[image]
                            ,[vga]
                            ,[hard_drive])
                      VALUES
                            (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)
                """;
        try {
            PreparedStatement st = connection.prepareStatement(sql);

            // Setting the fields provided by parameters
            st.setNull(1, java.sql.Types.VARCHAR);  // cpu (NULL)
            st.setInt(2, price);  // price
            st.setInt(3, 0);  // units_sold set to 0
            st.setInt(4, stockUnits);  // stock_units
            st.setNull(5, java.sql.Types.VARCHAR);  // battery_capacity (NULL)
            st.setNull(6, java.sql.Types.VARCHAR);  // operating_system (NULL)
            st.setNull(7, java.sql.Types.VARCHAR);  // screen (NULL)
            st.setNull(8, java.sql.Types.VARCHAR);  // ram (NULL)
            st.setString(9, productName);  // product_name
            st.setNull(10, java.sql.Types.VARCHAR);  // design (NULL)
            st.setString(11, warrantyInfo);  // warranty_info
            st.setString(12, generalInfo);  // general_info
            st.setInt(13, categoryId);  // category_id
            st.setInt(14, brandId);  // manufacturer_id (brandId)
            st.setString(15, image);  // image
            st.setNull(16, java.sql.Types.VARCHAR);  // vga (NULL)
            st.setNull(17, java.sql.Types.VARCHAR);  // hard_drive (NULL)

            // Execute the insert
            st.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deleteProduct(int productId) {
        String sql = """
                    DELETE FROM [dbo].[product]
                    WHERE [id] = ?
		""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, productId);
            st.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateLaptop(int id, String cpu, int price, int stockUnits, String batteryCapacity, String operatingSystem, String screen, String ram, String productName, String design, String warrantyInfo, String image, String generalInfo, int brandId, String vga, String hardDrive) {
        String sql = """
               UPDATE [dbo].[product]
                  SET [cpu] = ?,
                      [price] = ?,
                      [stock_units] = ?,
                      [battery_capacity] = ?,
                      [operating_system] = ?,
                      [screen] = ?,
                      [ram] = ?,
                      [product_name] = ?,
                      [design] = ?,
                      [warranty_info] = ?,
                      [general_info] = ?,
                      [category_id] = ?,
                      [manufacturer_id] = ?,
                      [image] = COALESCE(?, [image]),  -- Using COALESCE for image
                      [vga] = ?,
                      [hard_drive] = ?
                  WHERE [id] = ?
                    """;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, cpu);  // Setting CPU
            st.setInt(2, price);  // Setting price
            st.setInt(3, stockUnits);  // Setting stock units
            st.setString(4, batteryCapacity);  // Setting battery capacity
            st.setString(5, operatingSystem);  // Setting operating system
            st.setString(6, screen);  // Setting screen
            st.setString(7, ram);  // Setting RAM
            st.setString(8, productName);  // Setting product name
            st.setString(9, design);  // Setting design
            st.setString(10, warrantyInfo);  // Setting warranty info
            st.setString(11, generalInfo);  // Setting general info
            st.setInt(12, 1);  // Setting category ID
            st.setInt(13, brandId);  // Setting brand ID
            st.setString(14, image);  // Setting image
            st.setString(15, vga);  // Setting VGA
            st.setString(16, hardDrive);  // Setting hard drive
            st.setInt(17, id); //setting id to change
            st.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateOther(int id, String productName, int brandId, int categoryId, int price, String generalInfo, String warrantyInfo, int stockUnits, String image) {
        String sql = """
                UPDATE [dbo].[product]
                   SET 
                       [price] = ?,
                       [stock_units] = ?,
                       [product_name] = ?,
                       [warranty_info] = ?,
                       [general_info] = ?,
                       [category_id] = ?,
                       [manufacturer_id] = ?,
                       [image] = COALESCE(?, [image])
                   WHERE [id] = ?
                    """;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, price);
            st.setInt(2, stockUnits);
            st.setString(3, productName);
            st.setString(4, warrantyInfo);
            st.setString(5, generalInfo);
            st.setInt(6, categoryId);
            st.setInt(7, brandId);
            st.setString(8, image);
            st.setInt(9, id);
            st.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public int getCurrentStockUnits(int productId) {
        String sql = """
               SELECT [stock_units]
                 FROM [dbo].[product]
               WHERE [id] = ?
		""";
        int result = 0;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, productId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                result = rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }

    public List<Product> getProductsById(int... idList) {
        List<Product> listProduct = new ArrayList<>();
        StringBuilder query = new StringBuilder("SELECT * FROM [LaptopShop].[dbo].[product] WHERE ");

        for (int i = 0; i < idList.length; i++) {
            query.append("[id] = ").append(idList[i]);
            if (i < idList.length - 1) {
                query.append(" OR ");
            }
        }
        String sql = query.toString();

        BrandDAO bdao = new BrandDAO();
        CategoryDAO cdao = new CategoryDAO();

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String cpu = rs.getString("cpu");
                int price = rs.getInt("price");
                int unitsSold = rs.getInt("units_sold");
                int stockUnits = rs.getInt("stock_units");
                String batteryCapacity = rs.getString("battery_capacity");
                String operatingSystem = rs.getString("operating_system");
                String screen = rs.getString("screen");
                String ram = rs.getString("ram");
                String productName = rs.getString("product_name");
                String design = rs.getString("design");
                String warrantyInfo = rs.getString("warranty_info");
                String generalInfo = rs.getString("general_info");
                int cid = rs.getInt("category_id");
                String vga = rs.getString("vga");
                String hardDrive = rs.getString("hard_drive");
                int bid = rs.getInt("manufacturer_id");
                String image = rs.getString("image");
                Product p = new Product(id, cpu, price, unitsSold, stockUnits, batteryCapacity, operatingSystem, screen, ram, productName, design, warrantyInfo, generalInfo, vga, hardDrive, bdao.getBrandById(bid), cdao.getCategoryById(cid), image);
                listProduct.add(p);
            }

        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listProduct;
    }

}
