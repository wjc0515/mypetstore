package com.unitech.petstore.persistence;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.unitech.petstore.domain.LineItem;

@Repository
public interface LineItemMapper {

  List<LineItem> getLineItemsByOrderId(int orderId);

  void insertLineItem(LineItem lineItem);

}
