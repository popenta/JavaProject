/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.recruit.recruitmentapp.ejb;

import com.recruit.recruitmentapp.common.CandidateDetails;
import com.recruit.recruitmentapp.common.PositionDetails;
import com.recruit.recruitmentapp.entity.Candidate;
import com.recruit.recruitmentapp.entity.Position;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.logging.Logger;
import javax.ejb.EJBException;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 *
 * @author sodel
 */
@Stateless
public class PositionBean {

    private static final Logger LOG = Logger.getLogger(PositionBean.class.getName());

    @PersistenceContext
    private EntityManager em;

    public List<PositionDetails> getAllPositions() {
        LOG.info("getAllPositions");
        try {
            Query query = em.createQuery("SELECT p FROM Position p");
            List<Position> positions = (List<Position>) query.getResultList();
            return copyPositionsToDetails(positions);
        } catch (Exception ex) {
            throw new EJBException(ex);
        }
    }
    
    private List<PositionDetails> copyPositionsToDetails(List<Position> positions){
        List<PositionDetails> detailsList = new ArrayList<>();
        for(Position position : positions){
            PositionDetails positionDetails = new PositionDetails(position.getId(),
                    position.getNume(), 
                    position.getNrPersoane(), 
                    position.getPosOpener(), 
                    position.getDepartament(), 
                    position.getCerinte(), 
                    position.getResponsabilitati(),
                    position.getStare());
            
            detailsList.add(positionDetails);
        }
        return detailsList;
    }
    
    public void createPosition(String nume, Integer nrPersoane, String posOpener, String departament, String cerinte, String responsabilitati, String stare) {
        Position position = new Position();
        position.setNume(nume);
        position.setNrPersoane(nrPersoane);
        position.setPosOpener(posOpener);
        position.setDepartament(departament);
        position.setCerinte(cerinte);
        position.setResponsabilitati(responsabilitati);
        position.setStare(stare);
      
        em.persist(position);

    }
     public void updatePosition(Integer positionId, String nume, Integer nrPersoane, String posOpener, String departament, String cerinte, String responsabilitati) {
        LOG.info("updatePosition");
        Position position = em.find(Position.class, positionId);
        position.setNume(nume);
        position.setNrPersoane(nrPersoane);
        position.setPosOpener(posOpener);
        position.setDepartament(departament);
        position.setCerinte(cerinte);
        position.setResponsabilitati(responsabilitati);

    }
    
    public void deletePositionsByIds(Collection<Integer> ids) {
        LOG.info("deletePositionsByIds");
        for (Integer id : ids) {
            Position position = em.find(Position.class, id);
            em.remove(position);
        }
    }
    public PositionDetails findById(Integer positionId) {
        Position position = em.find(Position.class, positionId);
        return new PositionDetails(position.getId(),
                position.getNume(), position.getNrPersoane(),
                position.getPosOpener(), position.getDepartament(),
                position.getCerinte(),
                position.getResponsabilitati(),
                position.getStare());
    }
    
    public void updateStareActive(Integer id){
        
        LOG.info("updateStareActive");
        Position position = em.find(Position.class, id);
        
        position.setStare("active");  
    }
    
    public void updateStareInactive(Integer id){
        
        LOG.info("updateStareInactive");
        Position position = em.find(Position.class, id);
        
        position.setStare("inactive");  
    }
    
    public void updateStareDeactivate(Integer id){
        
        LOG.info("updateStareDeactivate");
        Position position = em.find(Position.class, id);
        
        position.setStare("declined");
    }
    
}
