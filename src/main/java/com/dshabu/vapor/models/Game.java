package com.dshabu.vapor.models;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "games")
public class Game {
    @Id
    @GeneratedValue(generator = "UUID")
    @GenericGenerator(
            name = "UUID",
            strategy = "org.hibernate.id.UUIDGenerator"
    )
    @Column(name = "gameId")
    private String gameId;

    @ManyToOne
    @JoinColumn(name = "genreId")
    private Genre genre;

    @Transient
    private String newGenre;

    @ManyToOne
    @JoinColumn(name = "developerId")
    private Developer developer;

    @Transient
    private String newDeveloper;

    @Column(name = "gameName")
    private String gameName;

    @Column(name = "gamePrice")
    private double gamePrice;

    @Column(name = "gameImgLink")
    private String gameImgLink;

    public Game() {
    }

    public String getGameId() {
        return gameId;
    }

    public Genre getGenre() {
        return genre;
    }

    public void setGenre(Genre genre) {
        this.genre = genre;
    }

    public Developer getDeveloper() {
        return developer;
    }

    public void setDeveloper(Developer developer) {
        this.developer = developer;
    }

    public String getGameName() {
        return gameName;
    }

    public void setGameName(String gameName) {
        this.gameName = gameName;
    }

    public double getGamePrice() {
        return gamePrice;
    }

    public void setGamePrice(double gamePrice) {
        this.gamePrice = gamePrice;
    }

    public String getGameImgLink() {
        return gameImgLink;
    }

    public void setGameImgLink(String gameImg) {
        this.gameImgLink = gameImg;
    }

    public void setGameId(String gameId) {
        this.gameId = gameId;
    }

    public String getNewGenre() {
        return newGenre;
    }

    public void setNewGenre(String newGenre) {
        this.newGenre = newGenre;
    }

    public String getNewDeveloper() {
        return newDeveloper;
    }

    public void setNewDeveloper(String newDeveloper) {
        this.newDeveloper = newDeveloper;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Game game = (Game) o;
        return Double.compare(game.gamePrice, gamePrice) == 0 &&
                gameId.equals(game.gameId) &&
                genre.equals(game.genre) &&
                developer.equals(game.developer) &&
                gameName.equals(game.gameName) &&
                gameImgLink.equals(game.gameImgLink);
    }

    @Override
    public int hashCode() {
        return Objects.hash(gameId, genre, developer, gameName, gamePrice, gameImgLink);
    }

    @Override
    public String toString() {
        return "Game{" +
                "gameId='" + gameId + '\'' +
                ", genre=" + genre +
                ", newGenre='" + newGenre + '\'' +
                ", developer=" + developer +
                ", newDeveloper='" + newDeveloper + '\'' +
                ", gameName='" + gameName + '\'' +
                ", gamePrice=" + gamePrice +
                ", gameImgLink='" + gameImgLink + '\'' +
                '}';
    }
}
