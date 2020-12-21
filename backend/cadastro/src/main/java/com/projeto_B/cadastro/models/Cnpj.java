package com.projeto_B.cadastro.models;

import lombok.Getter;
import lombok.Setter;
import javax.persistence.*;
import javax.validation.constraints.NotNull;

@Getter
@Setter
@Entity

public class Cnpj{

    @Id
    private String cnpj;

    @OneToOne
    @NotNull
    @JoinColumn(name="n_id_usuario")
    private Usuario usuario;

    //construtor
    public Cnpj(){}
    public Cnpj(String cnpj,Usuario usuario){
        this.cnpj = cnpj;
        this.usuario = usuario;
    } 
    public String getCnpj() {
        return cnpj;
    }
}
