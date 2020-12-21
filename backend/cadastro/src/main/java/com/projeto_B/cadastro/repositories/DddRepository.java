package com.projeto_B.cadastro.repositories;


import java.util.List;
import java.util.Optional;
import com.projeto_B.cadastro.models.DDD;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface DddRepository extends CrudRepository<DDD, Long>{
    List<DDD> findAll();
   
    // @Transactional
    // @Procedure(procedureName = "findByCep")
    // int findByCep(@Param("cep") Long cep);

    DDD findByDdd(Long ddd);
    // @Transactional
    // @Procedure(procedureName = "insert_json")
    // int Insert_json(@Param("json") String json);
                      
    Optional<DDD> findById(Long id);




}