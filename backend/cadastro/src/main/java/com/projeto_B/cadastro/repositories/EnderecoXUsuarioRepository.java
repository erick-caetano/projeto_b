package com.projeto_B.cadastro.repositories;


import java.util.List;
import java.util.Optional;

import com.projeto_B.cadastro.models.Usuario_x_endereco;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface EnderecoXUsuarioRepository extends CrudRepository<Usuario_x_endereco, Long>{
    List<Usuario_x_endereco> findAll();
    
                      
    Optional<Usuario_x_endereco> findById(Long id);


}







