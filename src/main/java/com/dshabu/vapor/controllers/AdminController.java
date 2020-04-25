package com.dshabu.vapor.controllers;

import com.dshabu.vapor.models.Developer;
import com.dshabu.vapor.models.Game;
import com.dshabu.vapor.models.Genre;
import com.dshabu.vapor.repositories.DeveloperRepository;
import com.dshabu.vapor.repositories.GameRepository;
import com.dshabu.vapor.repositories.GenreRepository;
import com.dshabu.vapor.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.Optional;

@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    private DeveloperRepository developerRepository;

    @Autowired
    private GenreRepository genreRepository;

    @Autowired
    private GameRepository gameRepository;

    @Autowired
    private UserService userService;

    @GetMapping("/edit-game/{gameId}")
    public ModelAndView editGameForm(@PathVariable("gameId") String gameId) {
        Optional<Game> gameOpt = gameRepository.findById(gameId);

        ModelAndView mv = null;
        if (gameOpt.isPresent()) {
            mv = new ModelAndView("admin-game-form");
            mv.addObject("developerList", developerRepository.findAllByOrderByDeveloperName());
            mv.addObject("genreList", genreRepository.findAllByOrderByGenreName());
            mv.addObject("game", gameOpt.get());
        }

        return mv;
    }

    @GetMapping("/new-game")
    public ModelAndView newGameForm() {
        ModelAndView mv = new ModelAndView("admin-game-form");
        mv.addObject("developerList", developerRepository.findAllByOrderByDeveloperName());
        mv.addObject("genreList", genreRepository.findAllByOrderByGenreName());
        mv.addObject("game", new Game());
        return mv;
    }

    @GetMapping("/delete/{gameId}")
    public String deleteGame(@PathVariable("gameId") String gameId) {
        gameRepository.deleteById(gameId);
        return "";
    }

    @PostMapping("/game-mod")
    public ModelAndView gameCRUD(@ModelAttribute("game") Game game) {
        if (game.getDeveloper() == null) {
            String developerName = game.getNewDeveloper();
            Developer newDeveloper = new Developer();
            newDeveloper.setDeveloperName(developerName);

            developerRepository.save(newDeveloper);
            game.setDeveloper(newDeveloper);
        }

        if (game.getGenre() == null) {
            String genreName = game.getNewGenre();
            Genre newGenre = new Genre();
            newGenre.setGenreName(genreName);

            genreRepository.save(newGenre);
            game.setGenre(newGenre);
        }

        gameRepository.save(game);

        return new ModelAndView("redirect:/game/list");
    }
}
