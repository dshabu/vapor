package com.dshabu.vapor.models;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Objects;

@Entity
@Table(name = "purchases")
public class Purchase {
    @Id
    @GeneratedValue(generator = "UUID")
    @GenericGenerator(
            name = "UUID",
            strategy = "org.hibernate.id.UUIDGenerator"
    )
    @Column(name = "purchaseId")
    private String purchaseId;

    @ManyToOne
    @JoinColumn(name = "userId")
    private User user;

    @ManyToOne
    @JoinColumn(name = "gameId")
    private Game game;

    @Column(name = "purchaseDate")
    @CreationTimestamp
    private Timestamp purchaseDate;

    public Purchase() {
    }

    public String getPurchaseId() {
        return purchaseId;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Game getGame() {
        return game;
    }

    public void setGame(Game game) {
        this.game = game;
    }

    public Timestamp getPurchaseDate() {
        return purchaseDate;
    }

    public void setPurchaseDate(Timestamp date) {
        this.purchaseDate = date;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Purchase purchase = (Purchase) o;
        return purchaseId.equals(purchase.purchaseId) &&
                user.equals(purchase.user) &&
                game.equals(purchase.game) &&
                purchaseDate.equals(purchase.purchaseDate);
    }

    @Override
    public int hashCode() {
        return Objects.hash(purchaseId, user, game, purchaseDate);
    }
}
