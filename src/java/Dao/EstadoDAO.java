/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import modelo.Estado;

/**
 *
 * @author Aluno
 */
public class EstadoDAO extends GenericDAO<Estado, Long>{
    
    public EstadoDAO(){
        super(Estado.class);
    }
    
}