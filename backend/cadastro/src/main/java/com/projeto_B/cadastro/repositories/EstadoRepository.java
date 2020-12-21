package com.projeto_B.cadastro.repositories;

import java.util.List;
import java.util.Optional;

import com.projeto_B.cadastro.models.Estado;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface EstadoRepository extends CrudRepository<Estado, Long>{
    List<Estado> findAll();
                          
    Optional<Estado> findById(Long id);

}




