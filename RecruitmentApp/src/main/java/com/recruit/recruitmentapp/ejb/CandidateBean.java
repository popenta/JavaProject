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
import com.recruit.recruitmentapp.servlet.Candidates;
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

    private List<CandidateDetails> copyCandidatesToDetails(List<Candidate> candidates) {
        List<CandidateDetails> detailsList = new ArrayList<>();
        for (Candidate candidate : candidates) {
            CandidateDetails candidateDetails = new CandidateDetails(candidate.getId(), candidate.getNume(),
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

    public void createCandidate(String nume, String prenume, String telefon, String email, String cv, String data, String comentariu) {
        Candidate candidate = new Candidate();
        candidate.setNume(nume);
        candidate.setPrenume(prenume);
        candidate.setTelefon(telefon);
        candidate.setEmail(email);
        candidate.setCv(cv);
        candidate.setData(data);
        candidate.setComentariu(comentariu);

        em.persist(candidate);

    }

    public CandidateDetails findById(Integer candidateId) {
        Candidate candidate = em.find(Candidate.class, candidateId);
        return new CandidateDetails(candidate.getId(), candidate.getNume(), candidate.getPrenume(), candidate.getTelefon(), candidate.getEmail(), candidate.getCv(), candidate.getData(), candidate.getComentariu());
    }

    public void updateCandidate(Integer candidateId, String nume, String prenume, String telefon, String email, String cv, String data, String comentariu) {
        LOG.info("updateCandidate");
        Candidate candidate = em.find(Candidate.class, candidateId);
        candidate.setNume(nume);
        candidate.setPrenume(prenume);
        candidate.setTelefon(telefon);
        candidate.setEmail(email);
        candidate.setCv(cv);
        candidate.setData(data);
        candidate.setComentariu(comentariu);

    }
    
    public void deleteCandidatesByIds(Collection<Integer> ids) {
        LOG.info("deleteCandidatesByIds");
        for (Integer id : ids) {
            Candidate candidate = em.find(Candidate.class, id);
            em.remove(candidate);
        }
    }
}
