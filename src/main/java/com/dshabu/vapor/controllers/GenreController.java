package com.dshabu.vapor.controllers;

import com.dshabu.vapor.models.Game;
import com.dshabu.vapor.models.Genre;
import com.dshabu.vapor.repositories.GameRepository;
import com.dshabu.vapor.repositories.GenreRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/genre")
public class GenreController {
    @Autowired
    private GameRepository gameRepository;

    @Autowired
    private GenreRepository genreRepository;

    @GetMapping({"", "/list"})
    public ModelAndView listGenres() {
        ModelAndView mv = new ModelAndView("genre-list");
        mv.addObject("genreList", genreRepository.findAllByOrderByGenreName());
        return mv;
    }

    @GetMapping("/list/{genreId}")
    public ModelAndView listGamesInGenre(@PathVariable("genreId") String genreId) {
        Optional<Genre> optGenre = genreRepository.findById(genreId);

        ModelAndView mv = new ModelAndView("genre-list-id");
        List<Game> gameList = null;

        if (optGenre.isPresent()) {
            mv.addObject("genre", optGenre.get());
            gameList = gameRepository.findByGenreOrderByGameName(optGenre.get());
        }

        mv.addObject("gameList", gameList);
        return mv;
    }
}
