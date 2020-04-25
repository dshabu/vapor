package com.dshabu.vapor.basics;

public class SearchCriteria {
    private String sc_gameName;
    private String sc_developerId;
    private String sc_genreId;
    private String sc_priceOperator;
    private Double sc_gamePrice;

    public String getSc_gameName() {
        return sc_gameName;
    }

    public void setSc_gameName(String sc_gameName) {
        this.sc_gameName = sc_gameName;
    }

    public String getSc_developerId() {
        return sc_developerId;
    }

    public void setSc_developerId(String sc_developerId) {
        this.sc_developerId = sc_developerId;
    }

    public String getSc_genreId() {
        return sc_genreId;
    }

    public void setSc_genreId(String sc_genreId) {
        this.sc_genreId = sc_genreId;
    }

    public String getSc_priceOperator() {
        return sc_priceOperator;
    }

    public void setSc_priceOperator(String sc_priceOperator) {
        this.sc_priceOperator = sc_priceOperator;
    }

    public Double getSc_gamePrice() {
        return sc_gamePrice;
    }

    public void setSc_gamePrice(Double sc_gamePrice) {
        this.sc_gamePrice = sc_gamePrice;
    }

    @Override
    public String toString() {
        return "SearchCriteria{" +
                "sc_gameName='" + sc_gameName + '\'' +
                ", sc_developerId='" + sc_developerId + '\'' +
                ", sc_genreId='" + sc_genreId + '\'' +
                ", sc_priceOperator='" + sc_priceOperator + '\'' +
                ", sc_gamePrice=" + sc_gamePrice +
                '}';
    }

    public void nullify() {
        if (sc_developerId.isBlank()) {
            sc_developerId = null;
        }

        if (sc_genreId.isBlank()) {
            sc_genreId = null;
        }
    }
}
