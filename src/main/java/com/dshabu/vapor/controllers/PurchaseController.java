package com.dshabu.vapor.controllers;

import com.dshabu.vapor.models.Game;
import com.dshabu.vapor.models.Purchase;
import com.dshabu.vapor.models.User;
import com.dshabu.vapor.repositories.GameRepository;
import com.dshabu.vapor.repositories.PurchaseRepository;
import com.dshabu.vapor.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.security.Principal;
import java.util.Optional;

@Controller
@RequestMapping("/purchase")
public class PurchaseController {
    @Autowired
    private PurchaseRepository purchaseRepository;

    @Autowired
    private UserService userService;

    @Autowired
    private GameRepository gameRepository;

    @PreAuthorize("isAuthenticated()")
    @GetMapping("/confirm/{gameId}")
    public ModelAndView confirmForm(@PathVariable("gameId") String gameId) {
        Optional<Game> gameOpt = gameRepository.findById(gameId);

        ModelAndView mv = null;
        if (gameOpt.isPresent()) {
            mv = new ModelAndView("purchase-confirm");
            mv.addObject("game", gameOpt.get());
        }

        return mv;
    }

    @PreAuthorize("isAuthenticated()")
    @PostMapping("/confirm")
    public ModelAndView confirm(@RequestParam("gameId") String gameId, Principal principal) {
        Optional<User> userOpt = userService.findByUsername(principal.getName());
        Optional<Game> gameOpt = gameRepository.findById(gameId);

        ModelAndView mv = null;
        if (userOpt.isPresent() && gameOpt.isPresent()) {
            Purchase newPurchase = new Purchase();
            newPurchase.setUser(userOpt.get());
            newPurchase.setGame(gameOpt.get());
            purchaseRepository.save(newPurchase);

            mv = new ModelAndView("redirect:/user/purchases");
        }

        return mv;
    }
}
