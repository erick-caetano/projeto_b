package com.projeto_B.cadastro.repositories;

import java.util.List;
import java.util.Optional;
import com.projeto_B.cadastro.models.Pais;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PaisRepository extends CrudRepository<Pais, Long>{
    List<Pais> findAll();
                      
    Optional<Pais> findById(Long id);

}







