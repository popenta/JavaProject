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
public class PositionDetails implements Serializable{
    
    private Integer id;
    private String nume;
    private Integer nrPersoane;
    private String posOpener;
    private String departament;
    private String cerinte;
    private String responsabilitati;
    
    public PositionDetails(String nume, Integer nrPersoane, String posOpener, String departament, String cerinte, String responsabilitati) {
        this.nume = nume;
        this.nrPersoane = nrPersoane;
        this.posOpener = posOpener;
        this.departament = departament;
        this.cerinte = cerinte;
        this.responsabilitati = responsabilitati;
    }

    public String getNume() {
        return nume;
    }

    public Integer getNrPersoane() {
        return nrPersoane;
    }

    public String getPosOpener() {
        return posOpener;
    }

    public String getDepartament() {
        return departament;
    }

    public String getCerinte() {
        return cerinte;
    }

    public String getResponsabilitati() {
        return responsabilitati;
    }

    
}
