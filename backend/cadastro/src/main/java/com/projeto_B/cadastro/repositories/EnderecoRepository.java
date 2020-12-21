package com.projeto_B.cadastro.repositories;


import java.util.List;
import java.util.Optional;

import com.projeto_B.cadastro.models.Endereco;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface EnderecoRepository extends CrudRepository<Endereco, Long>{
    List<Endereco> findAll();

    Endereco findByCep(Long cep);

    Optional<Endereco> findById(Long id);




}







