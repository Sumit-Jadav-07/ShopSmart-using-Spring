package com.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.jdbc.core.BeanPropertyRowMapper;

import com.bean.CartBean;
import com.bean.ProductBean;

@Repository
public class CartDao {

    @Autowired
    JdbcTemplate stmt;

    public void addToCart(CartBean cBean) {
        stmt.update("insert into carts (userId , productId, quantity) values (?,?,?)", cBean.getUserId(),
                cBean.getProductId(), 1);
    }

    public List<ProductBean> myCart(Integer id) {
        return stmt.query("select * from productsdetails join carts using (productId) where userId  = ?",
                new BeanPropertyRowMapper<>(ProductBean.class), new Object[] { id });
    }

    public void deleteCartItem(Integer productId) {
        stmt.update("delete from carts where productId = ?", productId);
    }

    public Integer checkExistingProduct(CartBean cBean) {
        try {
            CartBean bean = stmt.queryForObject("select * from carts where productId = ? and userId = ?",
                   new BeanPropertyRowMapper<>(CartBean.class), new Object[]{cBean.getProductId(), cBean.getUserId()});
            return bean.getQuantity();
        } catch (Exception e) {
            return 0;
        }
    }

    public void updateQuantity(CartBean bean) {
        try {
            stmt.update("update carts set quantity = ? where productId = ? and userId = ?", bean.getQuantity(),
                    bean.getProductId(), bean.getUserId());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
