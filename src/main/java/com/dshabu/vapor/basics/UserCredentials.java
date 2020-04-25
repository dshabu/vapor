package com.dshabu.vapor.basics;

import com.dshabu.vapor.models.User;

public class UserCredentials {
    private String userUsername;
    private String userPassword;

    public void setUserUsername(String userUsername) {
        this.userUsername = userUsername;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }

    public String getUserUsername() {
        return userUsername;
    }

    public String getUserPassword() {
        return userPassword;
    }

    public boolean isUser(User user) {
        return userUsername.equals(user.getUserUsername()) && userPassword.equals(user.getUserPassword());
    }
}
