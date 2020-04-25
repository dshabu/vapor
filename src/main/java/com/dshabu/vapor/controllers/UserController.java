package com.dshabu.vapor.controllers;

import com.dshabu.vapor.models.Purchase;
import com.dshabu.vapor.models.User;
import com.dshabu.vapor.repositories.PurchaseRepository;
import com.dshabu.vapor.services.SecurityService;
import com.dshabu.vapor.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.security.Principal;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private PurchaseRepository purchaseRepository;

    @Autowired
    private UserService userService;

    @Autowired
    private SecurityService securityService;

    @GetMapping("/login")
    public ModelAndView loginPage(@RequestParam(value = "invalidLogin", required = false) String invalidLogin) {
        ModelAndView mv = new ModelAndView("user-login");
        mv.addObject("invalidLogin", invalidLogin);
        return mv;
    }

    @GetMapping("/register")
    public ModelAndView registerPage() {
        ModelAndView mv = new ModelAndView("user-register");
        mv.addObject("userForm", new User());
        return mv;
    }

    @PostMapping("/register")
    public String register(@ModelAttribute("userForm") User userForm, RedirectAttributes redirectAttributes) {
        if ( userService.findByUsername(userForm.getUserUsername()).isPresent() ) {
            redirectAttributes.addFlashAttribute("status", "userExists");
            return "redirect:/user/register";
        }

        userService.save(userForm);
        redirectAttributes.addFlashAttribute("registerSuccess", true);
        return "redirect:/user/login";
    }

    @PreAuthorize("isAuthenticated()")
    @GetMapping("/purchases")
    public ModelAndView listPurchases(Principal principal) {
        ModelAndView mv = new ModelAndView("user-purchases");
        Optional<User> userOpt = userService.findByUsername(principal.getName());

        List<Purchase> purchaseList = null;
        if (userOpt.isPresent()) {
            purchaseList = purchaseRepository.findAllByUserOrderByPurchaseDateDesc(userOpt.get());
        }

        mv.addObject("user", userOpt);
        mv.addObject("purchaseList", purchaseList);

        return mv;
    }

    @PreAuthorize("isAuthenticated()")
    @GetMapping("/details")
    public ModelAndView userDetails(Principal principal) {
        ModelAndView mv = new ModelAndView("user-details");
        Optional<User> userOpt = userService.findByUsername(principal.getName());
        userOpt.ifPresent(user -> mv.addObject("user", user));
        return mv;
    }
}
