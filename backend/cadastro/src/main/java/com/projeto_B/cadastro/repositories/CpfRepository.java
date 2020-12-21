package com.projeto_B.cadastro.repositories;

import java.util.List;
import com.projeto_B.cadastro.models.Cpf;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CpfRepository extends CrudRepository<Cpf, Long>{
    List<Cpf> findAll();

            
    Cpf findByCpf(String cpf);

}







