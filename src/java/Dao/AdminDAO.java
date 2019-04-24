/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import javax.persistence.Query;
import modelo.Admin;

/**
 *
 * @author Aluno
 */
public class AdminDAO extends GenericDAO<Admin, Integer>{
    
    public AdminDAO(){
        super(Admin.class);
    }
    public Admin logar(String email, String senha)
    {
        Admin retorno;
        Query q = em.createNamedQuery("Admin.login").setParameter("email", email).setParameter("senha", senha);
        try{
            retorno = (Admin)q.getSingleResult();
        } catch (Exception e){
            retorno = null;
        }
        return retorno;
}
}