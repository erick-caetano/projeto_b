package com.projeto_B.cadastro.repositories;

import java.util.List;
import java.util.Date;
import java.util.Optional;

import com.projeto_B.cadastro.models.Usuario;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import org.springframework.data.jpa.repository.query.Procedure;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

@Repository
public interface CadastroRepository extends CrudRepository<Usuario, Long>{
     List<Usuario> findAll();

    @Transactional
    @Procedure(procedureName = "Cria_Cadastro")
    int Cria_Cadastro(@Param("nome") String nome,
                      @Param("email") String email,
                      @Param("data") Date d_data,
                      @Param("senha") String senha,
                      @Param("flag_f_j") String flag_tipo);
    


    @Transactional
    @Procedure(procedureName = "insert_json")
    int Insert_json(@Param("json") String json);
                      
    Optional<Usuario> findById(int id);

}







