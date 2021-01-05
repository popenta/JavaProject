/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.recruit.recruitmentapp.common;

/**
 *
 * @author Alex
 */
public class CandidateDetails {
    private Integer id;
    private String nume;
    private String prenume;
    private String telefon;
    private String email;
    private String cv;
    private String data;
    private String comentariu;

    public CandidateDetails(String nume, String prenume, String telefon, String email, String cv, String data, String comentariu) {
        this.nume = nume;
        this.prenume = prenume;
        this.telefon = telefon;
        this.email = email;
        this.cv = cv;
        this.data = data;
        this.comentariu = comentariu;
    }

    public Integer getId() {
        return id;
    }

    public String getNume() {
        return nume;
    }

    public String getPrenume() {
        return prenume;
    }

    public String getTelefon() {
        return telefon;
    }

    public String getEmail() {
        return email;
    }

    public String getCv() {
        return cv;
    }

    public String getData() {
        return data;
    }

    public String getComentariu() {
        return comentariu;
    }
    
    
    
}
