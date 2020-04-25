package com.dshabu.vapor.controllers;

import com.dshabu.vapor.basics.SearchCriteria;
import com.dshabu.vapor.models.Game;
import com.dshabu.vapor.repositories.DeveloperRepository;
import com.dshabu.vapor.repositories.GameRepository;
import com.dshabu.vapor.repositories.GenreRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/search")
public class SearchController {
    @Autowired
    private DeveloperRepository developerRepository;

    @Autowired
    private GenreRepository genreRepository;

    @Autowired
    private GameRepository gameRepository;

    @GetMapping("")
    private ModelAndView searchHomePage() {
        ModelAndView mv = new ModelAndView("search");

        mv.addObject("searchCriteria", new SearchCriteria());
        mv.addObject("genreList", genreRepository.findAllByOrderByGenreName());
        mv.addObject("developerList", developerRepository.findAllByOrderByDeveloperName());
        return mv;
    }

    @PostMapping("")
    private ModelAndView search(SearchCriteria searchCriteria) {
        // passing nulls to database will not search for those terms.
        searchCriteria.nullify();

        String gameName = searchCriteria.getSc_gameName();
        String developerId = searchCriteria.getSc_developerId();
        String genreId = searchCriteria.getSc_genreId();
        String priceOperator = searchCriteria.getSc_priceOperator();
        Double price = searchCriteria.getSc_gamePrice();

        List<Game> gameList;
        if (priceOperator.equals("ge")) {
            gameList = gameRepository.filterPriceGe(gameName, developerId, genreId, price);
        }
        else {
            gameList = gameRepository.filterPriceLe(gameName, developerId, genreId, price);
        }


        ModelAndView mv = new ModelAndView("search");
        if (gameList.size() == 0) {
            // tell user that no results appeared. by default, it would just say 'results will appear here'.
            mv.addObject("emptyGameList", true);
        }
        else {
            mv.addObject("gameList", gameList);
        }
        mv.addObject("genreList", genreRepository.findAll());
        mv.addObject("developerList", developerRepository.findAll());
        return mv;
    }
}