package com.projeto_B.cadastro.models;

//import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import java.util.Date;
import javax.persistence.*;
//import javax.validation.constraints.Size;

import com.fasterxml.jackson.annotation.JsonFormat;

//import org.springframework.format.annotation.DateTimeFormat;
@Getter
@Setter
@Entity

// @Table(name = "USUARIO_id_2")
public class Usuario{

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "s_nome")
    private String nome;

    @Column(name = "s_email")
    private String email;

    @Column(name = "s_senha")
    private String senha;

    @Column(name = "s_flag_tipo")
    private String flag_tipo;

    @Column(name = "d_data_nasc")
    @JsonFormat(pattern = "dd/mm/yyyy")
    private Date d_nasc;

    @Column(name = "s_ativo")
    private String flag_ativo;

    @OneToOne(mappedBy = "usuario", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private Cpf cpf;
    
    //construtor
    public Usuario(){}
    public Usuario(String nome,String email,String senha,String flag_tipo,Date d_nasc,String flag_ativo){
        this.nome = nome;
        this.email = email;
        this.senha = senha;
        this.flag_tipo = flag_tipo;
        this.d_nasc = d_nasc;
        this.flag_ativo = flag_ativo;
    } 

    public int getId(){
        return this.id;
    }

    public void setId(int id){
        this.id = id;
    }

    public String getNome(){
        return this.nome;
    }

    public String getSenha(){
        return this.senha;
    }

    public String getFlag_tipo(){
        return this.flag_tipo;
    }

    public String getFlag_ativo(){
        return this.flag_ativo;
    }

    public String getEmail(){
        return this.email;
    }

    public Date getD_nasc(){
        return this.d_nasc;
    }

}
