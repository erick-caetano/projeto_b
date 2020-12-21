    
package com.projeto_B.cadastro.models;

import lombok.Getter;
import lombok.Setter;
import javax.persistence.*;
import javax.validation.constraints.NotNull;

@Getter
@Setter
@Entity

public class Cidade {

        @Id
        @GeneratedValue(strategy = GenerationType.IDENTITY)
        private Long id;
        
        @Column(name = "s_cidade")
        private String cidade;
        
        @ManyToOne
        @NotNull
        @JoinColumn(name="n_id_estado")
        private Estado estado;
    

        //construtor
        public Cidade(){}
        public Cidade(Estado estado, String cidade ){
            this.estado = estado;
            this.cidade = cidade;
        } 

        public String getCidade() {
            return cidade;
        }

        public Estado getEstado() {
            return estado;
        }
        public Long getId() {
            return id;
        }
    }
    