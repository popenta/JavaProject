/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.recruit.recruitmentapp.ejb;

import com.recruit.recruitmentapp.common.CandidateDetails;
import com.recruit.recruitmentapp.common.UserDetails;
import com.recruit.recruitmentapp.entity.Candidate;
import com.recruit.recruitmentapp.entity.User;
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
 * @author Alex
 */
@Stateless
public class CandidateBean {

    private static final Logger LOG = Logger.getLogger(CandidateBean.class.getName());

    @PersistenceContext
    private EntityManager em;

    public List<CandidateDetails> getAllCandidates() {
        LOG.info("getAllCandidates");
        try {
            Query query = em.createQuery("SELECT c FROM Candidate c");
            List<Candidate> candidates = (List<Candidate>) query.getResultList();
            return copyCandidatesToDetails(candidates);
        } catch (Exception ex) {
            throw new EJBException(ex);
        }
    }
    
    private List<CandidateDetails> copyCandidatesToDetails(List<Candidate> candidates){
        List<CandidateDetails> detailsList = new ArrayList<>();
        for(Candidate candidate : candidates){
            CandidateDetails candidateDetails = new CandidateDetails(candidate.getNume(), 
                    candidate.getPrenume(),
                    candidate.getTelefon(),
                    candidate.getEmail(),
                    candidate.getCv(), 
                    candidate.getData(),
                    candidate.getComentariu());
            
            detailsList.add(candidateDetails);
        }
        return detailsList;
    } 
}
