    
package com.projeto_B.cadastro.models;

import lombok.Getter;
import lombok.Setter;
import javax.persistence.*;
import javax.validation.constraints.NotNull;

@Getter
@Setter
@Entity

public class Telefone {

        @Id
        @GeneratedValue(strategy = GenerationType.IDENTITY)
        private Long id;
        
        @Column(name = "n_telefone")
        private Long telefone;

        @Column(name = "s_flag_ativo")
        private String flag_ativo;
    
        @ManyToOne
        @NotNull
        @JoinColumn(name="n_id_usuario")
        private Usuario usuario;
    
        @ManyToOne
        @NotNull
        @JoinColumn(name="n_id_ddd")
        private DDD ddd;
    
        //construtor
        public Telefone(){}
        public Telefone(Long telefone,DDD ddd, Usuario usuario,String flag_ativo){
            this.telefone = telefone;
            this.ddd = ddd;
            this.usuario = usuario;
            this.flag_ativo = flag_ativo;
        } 

        public void setDdd(DDD ddd) {
            this.ddd = ddd;
        }

        public void setFlag_ativo(String flag_ativo) {
            this.flag_ativo = flag_ativo;
        }

        public void setId(Long id) {
            this.id = id;
        }

        public void setTelefone(Long telefone) {
            this.telefone = telefone;
        }
        public void setUsuario(Usuario usuario) {
            this.usuario = usuario;
        }
        public Long getId() {
            return id;
        }
        public Long getTelefone() {
            return telefone;
        }
        public DDD getDdd() {
            return ddd;
        }
        public Usuario getUsuario() {
            return usuario;
        }
        public String getFlag_ativo() {
            return flag_ativo;
        }
    }
    