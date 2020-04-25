package com.dshabu.vapor.repositories;

import com.dshabu.vapor.models.Developer;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DeveloperRepository extends JpaRepository<Developer, String> {
    List<Developer> findAllByOrderByDeveloperName();
}
