package com.projeto_B.cadastro.repositories;

import java.util.List;
import java.util.Optional;

import com.projeto_B.cadastro.models.Cidade;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CidadeRepository extends CrudRepository<Cidade, Long>{
    List<Cidade> findAll();
                          
    Optional<Cidade> findById(Long id);
    

}




