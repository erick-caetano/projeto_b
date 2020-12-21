package com.projeto_B.cadastro.models;

//import java.util.Date;
import javax.persistence.*;
import javax.validation.constraints.NotNull;

// import lombok.Getter;
// import lombok.Setter;

// @Getter(lazy = true)
// @Setter
@Entity
public class Endereco{

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private  Long id;


    @Column(name = "s_endereco")
    private String endereco;


    @Column(name = "n_cep", unique = true)
    private Long cep;

    @ManyToOne
    @NotNull
    @JoinColumn(name = "n_id_cidade")
    private Cidade cidade;

    @Column(name = "s_bairro")
    private String bairro;

    //construtor
    public Endereco(){}
    public Endereco(String endereco,Long cep,Cidade cidade,String bairro){
        this.endereco = endereco;
        this.cep = cep;
        this.cidade = cidade;
        this.bairro = bairro;
    } 


    // public long getId(){
    //     return this.id;
    // }

    public void setId(long id){
        this.id = id;
    }

    public String getEndereco(){
        return this.endereco;
    }

    public long getCep(){
        return this.cep;
    }

    public String getBairro(){
        return this.bairro;
    }


    public Cidade getCidade(){
        return this.cidade;
    }

    public Long getId() {
        return id;
    }
}
