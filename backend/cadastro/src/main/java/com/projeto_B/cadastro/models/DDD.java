package com.projeto_B.cadastro.models;

import lombok.Getter;
import lombok.Setter;
//import java.util.Date;
import javax.persistence.*;
//import javax.validation.constraints.Size;
import javax.validation.constraints.NotNull;

//import com.fasterxml.jackson.annotation.JsonFormat;

//import org.springframework.format.annotation.DateTimeFormat;
@Getter
@Setter
@Entity
// @Table(name = "USUARIO_id_2")
public class DDD{

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @Column(name = "n_ddd")
    private Long ddd;
    
    @ManyToOne
    @NotNull
    @JoinColumn(name="n_id_pais")
    // @Column(name = "n_id_pais")
    private Pais pais;

    //construtor
    public DDD(){}
    public DDD(Long ddd,Pais pais){
        this.pais = pais;
        this.ddd = ddd;
    } 
    public Long getId() {
        return id;
    }
    public Long getDdd() {
        return ddd;
    }
    public Pais getPais() {
        return pais;
    }
}
