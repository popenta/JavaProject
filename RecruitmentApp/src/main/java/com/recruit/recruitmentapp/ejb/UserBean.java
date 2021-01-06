/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.recruit.recruitmentapp.ejb;

import com.recruit.recruitmentapp.common.UserDetails;
import com.recruit.recruitmentapp.entity.User;
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
public class UserBean {

    private static final Logger LOG = Logger.getLogger(UserBean.class.getName());

    @PersistenceContext
    private EntityManager em;

    
    public List<UserDetails> getAllUsers() {
        LOG.info("getAllUsers");
        try {
            Query query = em.createQuery("SELECT u FROM User u");
            List<User> users = (List<User>) query.getResultList();
            return copyUsersToDetails(users);
        } catch (Exception ex) {
            throw new EJBException(ex);
        }
    }
    
    private List<UserDetails> copyUsersToDetails(List<User> users){
        List<UserDetails> detailsList = new ArrayList<>();
        for(User user : users){
            UserDetails userDetails = new UserDetails(
                    user.getId(),
                    user.getNume(), 
                    user.getPrenume(),
                    user.getTelefon(),
                    user.getEmail(),
                    user.getPosition(), 
                    user.getUsername());
            
            detailsList.add(userDetails);
        }
        return detailsList;
    } 
    
    public void createUser(String nume, String prenume, String telefon, String email, String position, String genUsername,  String passwordSha256){
        User user = new User();
        user.setNume(nume);
        user.setPrenume(prenume);
        user.setTelefon(telefon);
        user.setEmail(email);
        user.setPosition(position);
        user.setUsername(genUsername);
        user.setPassword(passwordSha256);
 
        em.persist(user);
    }
    
    public UserDetails findById(Integer userId) {
        User user = em.find(User.class, userId);
        return new UserDetails (user.getId(), user.getNume(), user.getPrenume(), user.getTelefon(), user.getEmail(), user.getPosition(), user.getUsername());
    }
    
    public void updateUser(Integer userId, String nume, String prenume, String telefon, String email, String position) {
        LOG.info("updateUser");
        User user = em.find(User.class, userId);
        user.setNume(nume);
        user.setPrenume(prenume);
        user.setTelefon(telefon);
        user.setEmail(email);
        user.setPosition(position);
        
    }
    
    public void deleteUsersByIds(Collection<Integer> ids) {
        LOG.info("deleteCarsByIds");
        for (Integer id : ids) {
            User user = em.find(User.class, id);
            em.remove(user);
        }
    }
}
