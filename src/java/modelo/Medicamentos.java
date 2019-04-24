/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Tainá
 */
@Entity
@Table(name = "medicamentos")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Medicamentos.findAll", query = "SELECT m FROM Medicamentos m")
    , @NamedQuery(name = "Medicamentos.findByMedcod", query = "SELECT m FROM Medicamentos m WHERE m.medcod = :medcod")
    , @NamedQuery(name = "Medicamentos.findByMednome", query = "SELECT m FROM Medicamentos m WHERE m.mednome = :mednome")
    , @NamedQuery(name = "Medicamentos.findByMedqtdade", query = "SELECT m FROM Medicamentos m WHERE m.medqtdade = :medqtdade")
    , @NamedQuery(name = "Medicamentos.findByMedfoto", query = "SELECT m FROM Medicamentos m WHERE m.medfoto = :medfoto")
    , @NamedQuery(name = "Medicamentos.findByMedbula", query = "SELECT m FROM Medicamentos m WHERE m.medbula = :medbula")})
public class Medicamentos implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "medcod")
    private Integer medcod;
    @Basic(optional = false)
    @Column(name = "mednome")
    private String mednome;
    @Basic(optional = false)
    @Column(name = "medqtdade")
    private double medqtdade;
    @Basic(optional = false)
    @Column(name = "medfoto")
    private String medfoto;
    @Basic(optional = false)
    @Column(name = "medbula")
    private String medbula;
    @JoinColumn(name = "id", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Estado id;
    @JoinColumn(name = "municipibge", referencedColumnName = "municipibge")
    @ManyToOne(optional = false)
    private Municipibge municipibge;
    @JoinColumn(name = "postocod", referencedColumnName = "postocod")
    @ManyToOne(optional = false)
    private Posto postocod;

    public Medicamentos() {
    }

    public Medicamentos(Integer medcod) {
        this.medcod = medcod;
    }

    public Medicamentos(Integer medcod, String mednome, double medqtdade, String medfoto, String medbula) {
        this.medcod = medcod;
        this.mednome = mednome;
        this.medqtdade = medqtdade;
        this.medfoto = medfoto;
        this.medbula = medbula;
    }

    public Integer getMedcod() {
        return medcod;
    }

    public void setMedcod(Integer medcod) {
        this.medcod = medcod;
    }

    public String getMednome() {
        return mednome;
    }

    public void setMednome(String mednome) {
        this.mednome = mednome;
    }

    public double getMedqtdade() {
        return medqtdade;
    }

    public void setMedqtdade(double medqtdade) {
        this.medqtdade = medqtdade;
    }

    public String getMedfoto() {
        return medfoto;
    }

    public void setMedfoto(String medfoto) {
        this.medfoto = medfoto;
    }

    public String getMedbula() {
        return medbula;
    }

    public void setMedbula(String medbula) {
        this.medbula = medbula;
    }

    public Estado getId() {
        return id;
    }

    public void setId(Estado id) {
        this.id = id;
    }

    public Municipibge getMunicipibge() {
        return municipibge;
    }

    public void setMunicipibge(Municipibge municipibge) {
        this.municipibge = municipibge;
    }

    public Posto getPostocod() {
        return postocod;
    }

    public void setPostocod(Posto postocod) {
        this.postocod = postocod;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (medcod != null ? medcod.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Medicamentos)) {
            return false;
        }
        Medicamentos other = (Medicamentos) object;
        if ((this.medcod == null && other.medcod != null) || (this.medcod != null && !this.medcod.equals(other.medcod))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "modelo.Medicamentos[ medcod=" + medcod + " ]";
    }
    
}
