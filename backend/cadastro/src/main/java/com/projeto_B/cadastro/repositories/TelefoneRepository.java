package com.projeto_B.cadastro.repositories;


import java.util.List;
import java.util.Optional;
import com.projeto_B.cadastro.models.Telefone;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface TelefoneRepository extends CrudRepository<Telefone, Long>{
    List<Telefone> findAll();
   
    Telefone findByTelefone(Long telefone);
                      
    Optional<Telefone> findById(Long id);

}