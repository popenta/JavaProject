/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.recruit.recruitmentapp.common;

import java.io.Serializable;

/**
 *
 * @author sodel
 */
public class UserDetails implements Serializable{

    private Integer id;
    private String nume;
    private String prenume;
    private String telefon;
    private String email;
    private String position;
    private String username;
    private String password;

    public UserDetails(String nume, String prenume, String telefon, String email, String position, String username) {
        this.nume = nume;
        this.prenume = prenume;
        this.telefon = telefon;
        this.email = email;
        this.position = position;
        this.username = username;
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

    public String getPosition() {
        return position;
    }

    public String getUsername() {
        return username;
    }

    
}
