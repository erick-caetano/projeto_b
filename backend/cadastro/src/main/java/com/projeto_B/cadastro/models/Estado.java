    
package com.projeto_B.cadastro.models;

import lombok.Getter;
import lombok.Setter;
import javax.persistence.*;

@Getter
@Setter
@Entity

public class Estado {

        @Id
        @GeneratedValue(strategy = GenerationType.IDENTITY)
        private Long id;
        
        @Column(name = "s_estado")
        private String estado;
        
    
        @Column(name="s_uf_estado")
        private String uf_estado;
    

        //construtor
        public Estado(){}
        public Estado(String estado, String uf_estado ){
            this.estado = estado;
            this.uf_estado = uf_estado;
        } 
    }
    