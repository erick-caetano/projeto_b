package com.projeto_B.cadastro.services;

import java.util.List;
import java.util.Date;
// import java.util.Optional;

import com.projeto_B.cadastro.models.*;
// import com.fasterxml.jackson.annotation.JsonTypeInfo.Id;
import com.projeto_B.cadastro.repositories.*;
import org.springframework.stereotype.Service;

@Service
public class CadastroService{
    private CadastroRepository CadastroRepo;
    private EnderecoRepository EnderecoRepo;
    private CidadeRepository CidadeRepo;
    private EnderecoXUsuarioRepository ExURepo;
    // private CpfRepository cpfRepo;
    // private  CnpjRepository cnpjRepo;
    // private  PaisRepository paisRepo;
    private  DddRepository dddRepo;
    private  TelefoneRepository telefoneRepo;

    // public CadastroService(CadastroRepository cadastroRepo){
    //     this.CadastroRepo = cadastroRepo;
    // }
    public CadastroService(CidadeRepository cidadeRepo,
                           CadastroRepository cadastroRepo,
                           EnderecoRepository enderecoRepo,
                           EnderecoXUsuarioRepository exURepo,
                           CpfRepository cpfRepo,
                           CnpjRepository cnpjRepo,
                           PaisRepository paisRepo,
                           DddRepository dddRepo,
                           TelefoneRepository telefoneRepo){
        this.CidadeRepo = cidadeRepo;
        this.CadastroRepo = cadastroRepo;
        this.EnderecoRepo = enderecoRepo;
        this.ExURepo = exURepo;
        // this.cnpjRepo = cnpjRepo;
        // this.paisRepo = paisRepo;
        this.dddRepo = dddRepo;
        this.telefoneRepo =telefoneRepo;
    } 
    // Cria cadastro
    public Integer createCadastro(String nome,String  email,
                            Date d_nasc,String senha,String flag_tipo){
                      
         return CadastroRepo.Cria_Cadastro(nome, email,
          d_nasc,senha,flag_tipo);
        //   System.out.println(CadastroRepo.Cria_Cadastro(nome, email,
        //   d_nasc,senha,flag_tipo));

    }
    public Usuario createUsuario(Usuario usuario){
     return CadastroRepo.save(usuario);
    }

    public List<Cidade> getAllCidade(){
        return CidadeRepo.findAll();
    }
    

    public Endereco createEndereco(Endereco endereco){
 
         return EnderecoRepo.save(endereco);

    }


    public Usuario_x_endereco createUsuarioxEndereco(int numero, String flag_p, Endereco endereco,Usuario usuario){
        if (flag_p == null) {
            flag_p = "S";
        }
        Usuario_x_endereco usuario_endereco =  new Usuario_x_endereco(numero,"S",flag_p,usuario,endereco);
        
        return ExURepo.save(usuario_endereco);

   }

    //le todos os cadastros
    public List<Usuario> getAllCadastro(){
         return CadastroRepo.findAll();
    }

    public Cidade getCidade(int id){
        return CidadeRepo.findById((long)id).get();
    }
    public  Telefone createTelefone(int id_ddd, long numero_tel, int id_usuario, String flag_a){
        if (flag_a == null) {
            flag_a = "S";
        }
        Usuario usuario =  CadastroRepo.findById(id_usuario).get();
        DDD ddd =  dddRepo.findById((long)id_ddd).get();
    
        Telefone telefone =  new Telefone(numero_tel,ddd,usuario,flag_a);
        return telefoneRepo.save(telefone);

   }

   public int convertToInt(String numero) {
    return  Integer.parseInt(numero);
   }
    
}