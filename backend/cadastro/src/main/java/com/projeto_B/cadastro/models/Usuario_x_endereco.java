    
package com.projeto_B.cadastro.models;

import lombok.Getter;
import lombok.Setter;
import javax.persistence.*;
import javax.validation.constraints.NotNull;

@Getter
@Setter
@Entity

public class Usuario_x_endereco {

        @Id
        @GeneratedValue(strategy = GenerationType.IDENTITY)
        private Long id;
        
        @Column(name = "n_numero")
        private int numero;
        
        @Column(name = "s_principal")
        private String flag_principal;

        @Column(name = "s_ativo")
        private String ativo;
        
        @ManyToOne
        @NotNull
        @JoinColumn(name="n_id_usuario")
        private Usuario usuario;
    
        @ManyToOne
        @NotNull
        @JoinColumn(name="n_id_endereco")
        private Endereco endereco;
    
        //construtor
        public Usuario_x_endereco(){}
        public Usuario_x_endereco(int numero,String flag_principal, String ativo,Usuario usuario,Endereco endereco){
            this.numero = numero;
            this.flag_principal = flag_principal;
            this.ativo = ativo;
            this.endereco = endereco;
            this.usuario = usuario;
        } 

        public Usuario getUsuario(){
            return this.usuario;
        }
    }
    