package com.dshabu.vapor.controllers;

import com.dshabu.vapor.models.Developer;
import com.dshabu.vapor.models.Game;
import com.dshabu.vapor.repositories.DeveloperRepository;
import com.dshabu.vapor.repositories.GameRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/developer")
public class DeveloperController {
    @Autowired
    private GameRepository gameRepository;

    @Autowired
    private DeveloperRepository developerRepository;

    @GetMapping({"", "/list"})
    public ModelAndView listDevs() {
        ModelAndView mv = new ModelAndView("developer-list");
        List<Developer> devList = developerRepository.findAllByOrderByDeveloperName();
        mv.addObject("developerList", devList);
        return mv;
    }

    @GetMapping("/list/{developerId}")
    public ModelAndView listDevGames(@PathVariable("developerId") String developerId) {
        Optional<Developer> optionalDeveloper = developerRepository.findById(developerId);

        ModelAndView mv = new ModelAndView("developer-list-id");
        List<Game> gameList = null;

        if (optionalDeveloper.isPresent()) {
            mv.addObject("developer", optionalDeveloper.get());
            gameList = gameRepository.findByDeveloperOrderByGameName(optionalDeveloper.get());
        }

        mv.addObject("gameList", gameList);
        return mv;
    }
}
