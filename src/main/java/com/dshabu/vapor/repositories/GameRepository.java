package com.dshabu.vapor.repositories;

import com.dshabu.vapor.models.Developer;
import com.dshabu.vapor.models.Game;
import com.dshabu.vapor.models.Genre;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface GameRepository extends JpaRepository<Game, String> {
    @Query("SELECT g from Game g where " +
            "(?4 is null or g.gamePrice >= ?4) " +
            "and (?1 is null or upper(g.gameName) like concat('%', upper(?1) ,'%')) " +
            "and (?2 is null or g.developer.developerId = ?2) " +
            "and (?3 is null or g.genre.genreId = ?3)")
    List<Game> filterPriceGe(String gameName, String developerId, String genreId, Double gamePrice);

    @Query("SELECT g from Game g where " +
            "(?4 is null or g.gamePrice <= ?4) " +
            "and (?1 is null or upper(g.gameName) like concat('%', upper(?1) ,'%')) " +
            "and (?2 is null or g.developer.developerId = ?2) " +
            "and (?3 is null or g.genre.genreId = ?3)")
    List<Game> filterPriceLe(String gameName, String developer, String genre, Double gamePrice);

    List<Game> findByDeveloperOrderByGameName(Developer developer);

    List<Game> findByGenreOrderByGameName(Genre genre);

    List<Game> findAllByOrderByGameName();
}
