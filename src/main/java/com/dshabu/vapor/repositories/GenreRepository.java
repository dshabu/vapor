package com.dshabu.vapor.repositories;

import com.dshabu.vapor.models.Genre;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface GenreRepository extends JpaRepository<Genre, String> {
    List<Genre> findAllByOrderByGenreName();

    @Override
    Optional<Genre> findById(String s);
}
