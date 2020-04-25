package com.dshabu.vapor.repositories;

import com.dshabu.vapor.models.Purchase;
import com.dshabu.vapor.models.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PurchaseRepository extends JpaRepository<Purchase, String> {
    List<Purchase> findAllByUserOrderByPurchaseDateDesc(User user);
}
