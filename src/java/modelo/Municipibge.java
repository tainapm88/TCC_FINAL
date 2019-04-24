/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.io.Serializable;
import java.math.BigInteger;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Tainá
 */
@Entity
@Table(name = "municipibge")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Municipibge.findAll", query = "SELECT m FROM Municipibge m")
    , @NamedQuery(name = "Municipibge.findByMunicipibge", query = "SELECT m FROM Municipibge m WHERE m.municipibge = :municipibge")
    , @NamedQuery(name = "Municipibge.findByMunicipuf", query = "SELECT m FROM Municipibge m WHERE m.municipuf = :municipuf")
    , @NamedQuery(name = "Municipibge.findByMunicipnome", query = "SELECT m FROM Municipibge m WHERE m.municipnome = :municipnome")
    , @NamedQuery(name = "Municipibge.findByMunicippop", query = "SELECT m FROM Municipibge m WHERE m.municippop = :municippop")})
public class Municipibge implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "municipibge")
    private String municipibge;
    @Basic(optional = false)
    @Column(name = "municipuf")
    private String municipuf;
    @Basic(optional = false)
    @Column(name = "municipnome")
    private String municipnome;
    @Column(name = "municippop")
    private BigInteger municippop;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "municipibge")
    private List<Posto> postoList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "municipibge")
    private List<Admin> adminList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "municipibge")
    private List<Medicamentos> medicamentosList;

    public Municipibge() {
    }

    public Municipibge(String municipibge) {
        this.municipibge = municipibge;
    }

    public Municipibge(String municipibge, String municipuf, String municipnome) {
        this.municipibge = municipibge;
        this.municipuf = municipuf;
        this.municipnome = municipnome;
    }

    public String getMunicipibge() {
        return municipibge;
    }

    public void setMunicipibge(String municipibge) {
        this.municipibge = municipibge;
    }

    public String getMunicipuf() {
        return municipuf;
    }

    public void setMunicipuf(String municipuf) {
        this.municipuf = municipuf;
    }

    public String getMunicipnome() {
        return municipnome;
    }

    public void setMunicipnome(String municipnome) {
        this.municipnome = municipnome;
    }

    public BigInteger getMunicippop() {
        return municippop;
    }

    public void setMunicippop(BigInteger municippop) {
        this.municippop = municippop;
    }

    @XmlTransient
    public List<Posto> getPostoList() {
        return postoList;
    }

    public void setPostoList(List<Posto> postoList) {
        this.postoList = postoList;
    }

    @XmlTransient
    public List<Admin> getAdminList() {
        return adminList;
    }

    public void setAdminList(List<Admin> adminList) {
        this.adminList = adminList;
    }

    @XmlTransient
    public List<Medicamentos> getMedicamentosList() {
        return medicamentosList;
    }

    public void setMedicamentosList(List<Medicamentos> medicamentosList) {
        this.medicamentosList = medicamentosList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (municipibge != null ? municipibge.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Municipibge)) {
            return false;
        }
        Municipibge other = (Municipibge) object;
        if ((this.municipibge == null && other.municipibge != null) || (this.municipibge != null && !this.municipibge.equals(other.municipibge))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "modelo.Municipibge[ municipibge=" + municipibge + " ]";
    }
    
}
