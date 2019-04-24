/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import modelo.Medicamentos;

/**
 *
 * @author Aluno
 */
public class MedicamentosDAO extends GenericDAO<Medicamentos, Integer>{
    
    public MedicamentosDAO(){
        super(Medicamentos.class);
    }
    
}