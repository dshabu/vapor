package com.dshabu.vapor.controllers;

import com.dshabu.vapor.models.Game;
import com.dshabu.vapor.repositories.GameRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping({"/game", "/game/"})
public class GameController {
    @Autowired
    private GameRepository gameRepository;

    @GetMapping({"/", "/list"})
    public ModelAndView listGames() {
        ModelAndView mv = new ModelAndView("game-list");
        List<Game> gameList = gameRepository.findAllByOrderByGameName();
        mv.addObject("gameList", gameList);
        return mv;
    }
}
