package com.DAO;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.entity.Products;

public interface ProductsDAO {
    public boolean addProducts(Products p);
    
    public List<Products> getMyProducts(HttpServletRequest req);
    
    public Products getProductById(int id);
    
    public boolean updateEditProducts(Products p);
    
    public	boolean deleteProducts(int id);
    
    public List <Products> getAllProducts();
    
    public List <Products> getProductByCatagories(String Catagory);
    
    public List <Products> getProductBySearch(String ch);
     
}
