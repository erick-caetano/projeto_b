package com.projeto_B.cadastro.repositories;

import java.util.List;
import com.projeto_B.cadastro.models.Cnpj;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CnpjRepository extends CrudRepository<Cnpj, Long>{
    List<Cnpj> findAll();

            
    Cnpj findByCnpj(String cnpj);

}







