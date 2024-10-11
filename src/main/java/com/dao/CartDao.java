package com.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.ColumnMapRowMapper;
import org.springframework.stereotype.Repository;
import com.bean.CartBean;
import com.bean.ProductBean;

@Repository
public class CartDao {

    @Autowired
    JdbcTemplate stmt;

    public void addToCart(CartBean cBean) {
        stmt.update("INSERT INTO carts (userId, productId, quantity, type) VALUES (?, ?, ?, ?)",
                cBean.getUserId(), cBean.getProductId(), 1, cBean.getType());
    }

    public void deleteCartItem(Integer productId, String type, Integer userId) {
        stmt.update("DELETE FROM carts WHERE productId = ? AND type = ? AND userId = ?",
                productId, type, userId);
    }

    public Integer checkExistingProduct(Integer productId, Integer userId, String type) {
        String query = "SELECT quantity FROM carts WHERE productId = ? AND userId = ? AND type = ?";
        try {
            CartBean bean = stmt.queryForObject(query, new BeanPropertyRowMapper<>(CartBean.class), productId, userId,
                    type);
            return bean.getQuantity();
        } catch (Exception e) {
            return 0;
        }
    }

    public void updateQuantity(Integer productId, Integer userId, String type, Integer quantity) {
        try {
            stmt.update("UPDATE carts SET quantity = ? WHERE productId = ? AND userId = ? AND type = ?",
                    quantity, productId, userId, type);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<ProductBean> getAllCartItemsForUser(Integer userId) {
        String sql = "SELECT c.cartId, c.productId, c.quantity, c.type, " +
                "CASE " +
                "  WHEN c.type = 'mobile' THEN m.name " +
                "  WHEN c.type = 'laptop' THEN l.name " +
                "  WHEN c.type = 'camera' THEN cam.name " +
                "  WHEN c.type = 'smartwatch' THEN sw.name " +
                "END AS productName, " +
                "CASE " +
                "  WHEN c.type = 'mobile' THEN m.price " +
                "  WHEN c.type = 'laptop' THEN l.price " +
                "  WHEN c.type = 'camera' THEN cam.price " +
                "  WHEN c.type = 'smartwatch' THEN sw.price " +
                "END AS price, " +
                "CASE " +
                "  WHEN c.type = 'mobile' THEN m.mobile_image_path " +
                "  WHEN c.type = 'laptop' THEN l.laptopImagePath " +
                "  WHEN c.type = 'camera' THEN cam.camera_image_path " +
                "  WHEN c.type = 'smartwatch' THEN sw.smartWatchImagePath " +
                "END AS productImagePath " +
                "FROM carts c " +
                "LEFT JOIN mobiles m ON c.productId = m.mobile_id AND c.type = 'mobile' " +
                "LEFT JOIN laptops l ON c.productId = l.laptopId AND c.type = 'laptop' " +
                "LEFT JOIN cameras cam ON c.productId = cam.camera_id AND c.type = 'camera' " +
                "LEFT JOIN smartwatch sw ON c.productId = sw.smartWatchId AND c.type = 'smartwatch' " +
                "WHERE c.userId = ?";

        return stmt.query(sql, (rs, rowNum) -> {
            ProductBean item = new ProductBean();
            item.setProductId(rs.getInt("productId"));
            item.setProductName(rs.getString("productName"));
            item.setPrice(rs.getFloat("price"));
            item.setQuantity(rs.getInt("quantity"));
            item.setProductImagePath(rs.getString("productImagePath"));
            item.setType(rs.getString("type"));
            return item;
        }, userId);
    }

    public List<ProductBean> getAllProducts() {
        List<ProductBean> products = new ArrayList<>();
    
        // Define queries for each product type
        String[] queries = {
                "SELECT m.mobile_id, 'mobile' AS type, m.name, m.price, m.mobile_image_path FROM mobiles m",
                "SELECT l.laptopId, 'laptop' AS type, l.name, l.price, l.laptopImagePath FROM laptops l",
                "SELECT cam.camera_id, 'camera' AS type, cam.name, cam.price, cam.camera_image_path FROM cameras cam",
                "SELECT sw.smartWatchId, 'smartwatch' AS type, sw.name, sw.price, sw.smartWatchImagePath FROM smartwatch sw"
        };
    
        // Define column names for each query
        String[][] columnNames = {
                {"mobile_id", "type", "name", "price", "mobile_image_path"},
                {"laptopId", "type", "name", "price", "laptopImagePath"},
                {"camera_id", "type", "name", "price", "camera_image_path"},
                {"smartWatchId", "type", "name", "price", "smartWatchImagePath"}
        };
    
        // Execute queries and add products to list
        for (int i = 0; i < queries.length; i++) {
            List<Map<String, Object>> queryResults = stmt.query(queries[i], new ColumnMapRowMapper());
            for (Map<String, Object> row : queryResults) {
                ProductBean product = new ProductBean();
                product.setProductId((Integer) row.get(columnNames[i][0]));
                product.setType((String) row.get(columnNames[i][1]));
                product.setProductName((String) row.get(columnNames[i][2]));
                product.setPrice((Float) row.get(columnNames[i][3]));
                product.setProductImagePath((String) row.get(columnNames[i][4]));
                products.add(product);
            }
        }
        return products;
    }
}
