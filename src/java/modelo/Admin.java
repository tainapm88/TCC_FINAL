/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.io.Serializable;
import java.util.Date;
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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Tainá
 */
@Entity
@Table(name = "admin")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Admin.findAll", query = "SELECT a FROM Admin a")
    , @NamedQuery(name = "Admin.findByAdmincod", query = "SELECT a FROM Admin a WHERE a.admincod = :admincod")
    , @NamedQuery(name = "Admin.findByAdminnome", query = "SELECT a FROM Admin a WHERE a.adminnome = :adminnome")
    , @NamedQuery(name = "Admin.findByAdminsobrenome", query = "SELECT a FROM Admin a WHERE a.adminsobrenome = :adminsobrenome")
    , @NamedQuery(name = "Admin.findByAdmincpf", query = "SELECT a FROM Admin a WHERE a.admincpf = :admincpf")
    , @NamedQuery(name = "Admin.findByAdmindatanasc", query = "SELECT a FROM Admin a WHERE a.admindatanasc = :admindatanasc")
    , @NamedQuery(name = "Admin.findByAdminend", query = "SELECT a FROM Admin a WHERE a.adminend = :adminend")
    , @NamedQuery(name = "Admin.findByAdmintelefone", query = "SELECT a FROM Admin a WHERE a.admintelefone = :admintelefone")
    , @NamedQuery(name = "Admin.findByAdminsexo", query = "SELECT a FROM Admin a WHERE a.adminsexo = :adminsexo")
    , @NamedQuery(name = "Admin.findByAdminemail", query = "SELECT a FROM Admin a WHERE a.adminemail = :adminemail")
    , @NamedQuery(name = "Admin.findByAdminsenha", query = "SELECT a FROM Admin a WHERE a.adminsenha = :adminsenha")})
public class Admin implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "admincod")
    private Integer admincod;
    @Basic(optional = false)
    @Column(name = "adminnome")
    private String adminnome;
    @Basic(optional = false)
    @Column(name = "adminsobrenome")
    private String adminsobrenome;
    @Basic(optional = false)
    @Column(name = "admincpf")
    private String admincpf;
    @Basic(optional = false)
    @Column(name = "admindatanasc")
    @Temporal(TemporalType.DATE)
    private Date admindatanasc;
    @Basic(optional = false)
    @Column(name = "adminend")
    private String adminend;
    @Basic(optional = false)
    @Column(name = "admintelefone")
    private String admintelefone;
    @Basic(optional = false)
    @Column(name = "adminsexo")
    private String adminsexo;
    @Basic(optional = false)
    @Column(name = "adminemail")
    private String adminemail;
    @Basic(optional = false)
    @Column(name = "adminsenha")
    private String adminsenha;
    @JoinColumn(name = "id", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Estado id;
    @JoinColumn(name = "municipibge", referencedColumnName = "municipibge")
    @ManyToOne(optional = false)
    private Municipibge municipibge;

    public Admin() {
    }

    public Admin(Integer admincod) {
        this.admincod = admincod;
    }

    public Admin(Integer admincod, String adminnome, String adminsobrenome, String admincpf, Date admindatanasc, String adminend, String admintelefone, String adminsexo, String adminemail, String adminsenha) {
        this.admincod = admincod;
        this.adminnome = adminnome;
        this.adminsobrenome = adminsobrenome;
        this.admincpf = admincpf;
        this.admindatanasc = admindatanasc;
        this.adminend = adminend;
        this.admintelefone = admintelefone;
        this.adminsexo = adminsexo;
        this.adminemail = adminemail;
        this.adminsenha = adminsenha;
    }

    public Integer getAdmincod() {
        return admincod;
    }

    public void setAdmincod(Integer admincod) {
        this.admincod = admincod;
    }

    public String getAdminnome() {
        return adminnome;
    }

    public void setAdminnome(String adminnome) {
        this.adminnome = adminnome;
    }

    public String getAdminsobrenome() {
        return adminsobrenome;
    }

    public void setAdminsobrenome(String adminsobrenome) {
        this.adminsobrenome = adminsobrenome;
    }

    public String getAdmincpf() {
        return admincpf;
    }

    public void setAdmincpf(String admincpf) {
        this.admincpf = admincpf;
    }

    public Date getAdmindatanasc() {
        return admindatanasc;
    }

    public void setAdmindatanasc(Date admindatanasc) {
        this.admindatanasc = admindatanasc;
    }

    public String getAdminend() {
        return adminend;
    }

    public void setAdminend(String adminend) {
        this.adminend = adminend;
    }

    public String getAdmintelefone() {
        return admintelefone;
    }

    public void setAdmintelefone(String admintelefone) {
        this.admintelefone = admintelefone;
    }

    public String getAdminsexo() {
        return adminsexo;
    }

    public void setAdminsexo(String adminsexo) {
        this.adminsexo = adminsexo;
    }

    public String getAdminemail() {
        return adminemail;
    }

    public void setAdminemail(String adminemail) {
        this.adminemail = adminemail;
    }

    public String getAdminsenha() {
        return adminsenha;
    }

    public void setAdminsenha(String adminsenha) {
        this.adminsenha = adminsenha;
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

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (admincod != null ? admincod.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Admin)) {
            return false;
        }
        Admin other = (Admin) object;
        if ((this.admincod == null && other.admincod != null) || (this.admincod != null && !this.admincod.equals(other.admincod))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "modelo.Admin[ admincod=" + admincod + " ]";
    }
    
}
