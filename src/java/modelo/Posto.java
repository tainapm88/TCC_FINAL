/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
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
@Table(name = "posto")
@XmlRootElement
@NamedQueries({
      @NamedQuery(name = "Posto.findAll", query = "SELECT p FROM Posto p")
    , @NamedQuery(name = "Posto.findByPostocod", query = "SELECT p FROM Posto p WHERE p.postocod = :postocod")
    , @NamedQuery(name = "Posto.findByPostonome", query = "SELECT p FROM Posto p WHERE p.postonome = :postonome")
    , @NamedQuery(name = "Posto.findByPostoespecializacao", query = "SELECT p FROM Posto p WHERE p.postoespecializacao = :postoespecializacao")
    , @NamedQuery(name = "Posto.findByPostotelefone", query = "SELECT p FROM Posto p WHERE p.postotelefone = :postotelefone")
    , @NamedQuery(name = "Posto.findByPostofoto", query = "SELECT p FROM Posto p WHERE p.postofoto = :postofoto")
    , @NamedQuery(name = "Posto.findByPostohorarioatend", query = "SELECT p FROM Posto p WHERE p.postohorarioatend = :postohorarioatend")
    , @NamedQuery(name = "Posto.findByPostocep", query = "SELECT p FROM Posto p WHERE p.postocep = :postocep")
    , @NamedQuery(name = "Posto.findByPostobairro", query = "SELECT p FROM Posto p WHERE p.postobairro = :postobairro")
    , @NamedQuery(name = "Posto.findByPostorua", query = "SELECT p FROM Posto p WHERE p.postorua = :postorua")
    , @NamedQuery(name = "Posto.findByPostocidade", query = "SELECT p FROM Posto p WHERE p.postocidade = :postocidade")
    , @NamedQuery(name = "Posto.findByPostoestado", query = "SELECT p FROM Posto p WHERE p.postoestado = :postoestado")
    , @NamedQuery(name = "Posto.findByPostonumero", query = "SELECT p FROM Posto p WHERE p.postonumero = :postonumero")
    , @NamedQuery(name = "Posto.findFilter", query = "SELECT p FROM Posto p"
    + " WHERE p.postonome like :filtro OR p.postocidade like :filtro")
    , @NamedQuery(name = "Posto.findFilter2", query = "SELECT p FROM Posto p"
    + " WHERE p.postonome like :filtro1 AND p.postocidade like :filtro2")})


public class Posto implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "postocod")
    private Integer postocod;
    @Basic(optional = false)
    @Column(name = "postonome")
    private String postonome;
    @Basic(optional = false)
    @Column(name = "postoespecializacao")
    private String postoespecializacao;
    @Basic(optional = false)
    @Column(name = "postotelefone")
    private String postotelefone;
    @Basic(optional = false)
    @Column(name = "postofoto")
    private String postofoto;
    @Basic(optional = false)
    @Column(name = "postohorarioatend")
    private String postohorarioatend;
    @Column(name = "postocep")
    private String postocep;
    @Column(name = "postobairro")
    private String postobairro;
    @Column(name = "postorua")
    private String postorua;
    @Column(name = "postocidade")
    private String postocidade;
    @Column(name = "postoestado")
    private String postoestado;
    @Column(name = "postonumero")
    private String postonumero;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "postocod")
    private List<Medicamentos> medicamentosList;

    public Posto() {
    }

    public Posto(Integer postocod) {
        this.postocod = postocod;
    }

    public Posto(Integer postocod, String postonome, String postoespecializacao, String postotelefone, String postofoto, String postohorarioatend) {
        this.postocod = postocod;
        this.postonome = postonome;
        this.postoespecializacao = postoespecializacao;
        this.postotelefone = postotelefone;
        this.postofoto = postofoto;
        this.postohorarioatend = postohorarioatend;
    }

    public Integer getPostocod() {
        return postocod;
    }

    public void setPostocod(Integer postocod) {
        this.postocod = postocod;
    }

    public String getPostonome() {
        return postonome;
    }

    public void setPostonome(String postonome) {
        this.postonome = postonome;
    }

    public String getPostoespecializacao() {
        return postoespecializacao;
    }

    public void setPostoespecializacao(String postoespecializacao) {
        this.postoespecializacao = postoespecializacao;
    }

    public String getPostotelefone() {
        return postotelefone;
    }

    public void setPostotelefone(String postotelefone) {
        this.postotelefone = postotelefone;
    }

    public String getPostofoto() {
        return postofoto;
    }

    public void setPostofoto(String postofoto) {
        this.postofoto = postofoto;
    }

    public String getPostohorarioatend() {
        return postohorarioatend;
    }

    public void setPostohorarioatend(String postohorarioatend) {
        this.postohorarioatend = postohorarioatend;
    }

    public String getPostocep() {
        return postocep;
    }

    public void setPostocep(String postocep) {
        this.postocep = postocep;
    }

    public String getPostobairro() {
        return postobairro;
    }

    public void setPostobairro(String postobairro) {
        this.postobairro = postobairro;
    }

    public String getPostorua() {
        return postorua;
    }

    public void setPostorua(String postorua) {
        this.postorua = postorua;
    }

    public String getPostocidade() {
        return postocidade;
    }

    public void setPostocidade(String postocidade) {
        this.postocidade = postocidade;
    }

    public String getPostoestado() {
        return postoestado;
    }

    public void setPostoestado(String postoestado) {
        this.postoestado = postoestado;
    }

    public String getPostonumero() {
        return postonumero;
    }

    public void setPostonumero(String postonumero) {
        this.postonumero = postonumero;
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
        hash += (postocod != null ? postocod.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Posto)) {
            return false;
        }
        Posto other = (Posto) object;
        if ((this.postocod == null && other.postocod != null) || (this.postocod != null && !this.postocod.equals(other.postocod))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "modelo.Posto[ postocod=" + postocod + " ]";
    }
    
}
