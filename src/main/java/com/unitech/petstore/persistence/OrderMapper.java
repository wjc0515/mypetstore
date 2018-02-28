package com.unitech.petstore.persistence;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.unitech.petstore.domain.Order;

@Repository
public interface OrderMapper {

  List<Order> getOrdersByUserid(String userid);

  Order getOrder(int orderId);
  
  void insertOrder(Order order);
  
  void insertOrderStatus(Order order);

}
