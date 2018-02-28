package com.unitech.petstore.persistence;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.unitech.petstore.domain.Item;

@Repository
public interface ItemMapper {

  void updateInventoryQuantity(Map<String, Object> param);

  int getInventoryQuantity(String itemId);

  List<Item> getItemListByProduct(String productId);

  Item getItem(String itemId);

}
