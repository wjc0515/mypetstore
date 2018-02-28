package com.unitech.petstore.persistence;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.unitech.petstore.domain.Category;

@Repository
public interface CategoryMapper {

  List<Category> getCategoryList();

  Category getCategory(String categoryId);

}
