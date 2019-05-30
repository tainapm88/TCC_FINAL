/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import java.util.List;
import modelo.Posto;

/**
 *
 * @author Aluno
 */
public class PostoDAO extends GenericDAO<Posto, Integer>{
    
    public PostoDAO(){
        super(Posto.class);
    }
    
     public List<Posto> listar(String filtro1, String filtro2) throws Exception{
        return em.createNamedQuery("Posto.findFilter2").setParameter("filtro1","%" + filtro1 + "%").setParameter("filtro2","%" + filtro2 + "%").getResultList();
    }
    
}