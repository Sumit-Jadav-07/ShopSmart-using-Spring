package com.dao;

import java.util.List;
import java.util.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.stereotype.Repository;
import com.bean.CartBean;
import com.bean.ProductBean;

@Repository
public class CartDao {

    @Autowired
    JdbcTemplate stmt;

    private static final Logger log = Logger.getLogger(CartDao.class.getName());

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
            CartBean bean = stmt.queryForObject(query, new BeanPropertyRowMapper<>(CartBean.class), productId, userId, type);
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
            log.severe("Error updating quantity: " + e.getMessage());
            throw e;
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
}
