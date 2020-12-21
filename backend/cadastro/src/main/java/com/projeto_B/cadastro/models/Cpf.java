package com.projeto_B.cadastro.models;

import lombok.Getter;
//import lombok.NonNull;
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
//@Table(name = "cpf")
public class Cpf{

    @Id
    @Column(name="s_cpf")
    private String cpf;

    @OneToOne(fetch = FetchType.LAZY)
    @NotNull
    @JoinColumn(name = "n_id_usuario",referencedColumnName = "id")
    private Usuario usuario;

    //construtor
    public Cpf(){}
    public Cpf(String cpf,Usuario usuario){
        this.cpf = cpf;
        this.usuario = usuario;
    } 
    public String getCpf() {
        return cpf;
    }
}
