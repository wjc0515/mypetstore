package com.unitech.petstore.persistence;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.unitech.petstore.domain.Product;

@Repository
public interface ProductMapper {

  List<Product> getProductListByCategory(String categoryId);

  Product getProduct(String productId);

  List<Product> searchProductList(String keywords);

}
