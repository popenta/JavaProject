/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.recruit.recruitmentapp.ejb;

import com.recruit.recruitmentapp.common.PositionDetails;
import com.recruit.recruitmentapp.entity.Position;
import java.util.ArrayList;
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
            PositionDetails positionDetails = new PositionDetails(position.getNume(), 
                    position.getNrPersoane(), 
                    position.getPosOpener(), 
                    position.getDepartament(), 
                    position.getCerinte(), 
                    position.getResponsabilitati());
            
            detailsList.add(positionDetails);
        }
        return detailsList;
    }
}
