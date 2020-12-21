package com.projeto_B.cadastro.models;

//import java.util.Date;
import javax.persistence.*;
//import javax.validation.constraints.Size;

//import com.fasterxml.jackson.annotation.JsonFormat;

//import org.springframework.format.annotation.DateTimeFormat;

@Entity

// @Table(name = "USUARIO_id_2")
public class Pais{

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @Column(name = "s_pais")
    private String pais;
    
    @Column(name = "n_cod_pais")
    private long cod_pais;


    // @OneToMany
    //construtor
    public Pais(){}
    public Pais(String pais,long cod_pais){
        this.pais = pais;
        this.cod_pais = cod_pais;
    } 

    // public Long getId(){
    //     return this.id;
    // }

    public void setId(Long id){
        this.id = id;
    }

    public String getPais(){
        return this.pais;
    }

    public long getCod_pais(){
        return this.cod_pais;
    }

}
