package com.dshabu.vapor.models;

import org.hibernate.annotations.Formula;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "developers")
public class Developer {
    /*uuid source: https://thoughts-on-java.org/generate-uuids-primary-keys-hibernate/*/
    @Id
    @GeneratedValue(generator = "UUID")
    @GenericGenerator(
        name = "UUID",
        strategy = "org.hibernate.id.UUIDGenerator"
    )
    @Column(name = "developerId")
    private String developerId;

    @Column(name = "developerName")
    private String developerName;

    @Formula("(select count(games.gameId) from games where games.developerId = developerId)")
    private int gameCount;

    public Developer() {
    }

    public String getDeveloperId() {
        return developerId;
    }

    public String getDeveloperName() {
        return developerName;
    }

    public void setDeveloperName(String developerName) {
        this.developerName = developerName;
    }

    public int getGameCount() {
        return gameCount;
    }

    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Developer developer = (Developer) o;
        return developerId.equals(developer.developerId) &&
                developerName.equals(developer.developerName);
    }

    @Override
    public int hashCode() {
        return Objects.hash(developerId, developerName);
    }

    @Override
    public String toString() {
        return "Developer{" +
                "developerId='" + developerId + '\'' +
                ", developerName='" + developerName + '\'' +
                ", gameCount=" + gameCount +
                '}';
    }
}
