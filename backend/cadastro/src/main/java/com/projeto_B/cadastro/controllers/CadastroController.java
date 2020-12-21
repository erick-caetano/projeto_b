package com.projeto_B.cadastro.controllers;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import com.projeto_B.cadastro.repositories.*;
import com.projeto_B.cadastro.models.*;
import com.projeto_B.cadastro.services.CadastroService;

@RestController
@RequestMapping("/api")
public class CadastroController{
    private CadastroService CadastroServ;
    private CadastroRepository cadastroRepo;
    private EnderecoRepository enderecoRepo;
    private CidadeRepository cidadeRepo;
    private CpfRepository cpfRepo;
    private  CnpjRepository cnpjRepo;

    public CadastroController(CadastroService cadastroServ,
              CadastroRepository cadastroRepo,
              CidadeRepository cidadeRepo,
              EnderecoRepository enderecoRepo,
              CnpjRepository cnpjRepo,
              CpfRepository cpfRepo,
              PaisRepository paisRepo,
              DddRepository dddRepo,
              TelefoneRepository telefoneRepo){
        this.CadastroServ = cadastroServ;
        this.cadastroRepo = cadastroRepo;
        this.cidadeRepo = cidadeRepo;
        this.enderecoRepo = enderecoRepo;
        this.cpfRepo = cpfRepo;
        this.cnpjRepo = cnpjRepo;
    }
    @ResponseBody
    @GetMapping("/cadastro/cidades")
    List<Cidade> all() {
      return CadastroServ.getAllCidade();
    }

    @GetMapping("/cadastros")
    public List<Usuario> showAllCadastros(){
         return CadastroServ.getAllCadastro();
    }

    @PostMapping("/create")
    @ResponseBody
     public Usuario createUsuario(@RequestBody Usuario usuario) {
    CadastroServ.createUsuario(usuario);
      return usuario;
    }

    @PostMapping("/cadastro/usuario")
    public void createCadastro(@RequestBody Map<String, Object> usuario){
    Date data = new Date();               
    SimpleDateFormat formato = new SimpleDateFormat("dd/MM/yyyy"); 
    try {
      data = formato.parse(usuario.get("d_nasc").toString());
    } catch (Exception e) {
      //TODO: handle exception
    }
    String cpf_busca;
    String cpf_cnpj  = usuario.get("cpf_cnpj").toString();
    if( usuario.get("flag_tipo").toString().equals("F") ){
      System.out.println(usuario.get("flag_tipo").toString());
      try {
        cpf_busca = cpfRepo.findByCpf(cpf_cnpj).getCpf();

      } catch (Exception e) {
         cpf_busca = null;
      }
      if(! cpf_cnpj.equals(cpf_busca) ){
        Integer id_usuario =   CadastroServ.createCadastro(
          usuario.get("nome").toString(),  
          usuario.get("email").toString(),  
          data,
          usuario.get("senha").toString(),  
          usuario.get("flag_tipo").toString()
          );
          Cpf cpf =  new Cpf(cpf_cnpj,cadastroRepo.findById(id_usuario).get());
          cpfRepo.save(cpf);
        }else {System.out.println("cpf ja cadastrado");
      }
    } else if( usuario.get("flag_tipo").toString().equals("J") ){
        String cnpj_busca;
        try {
            cnpj_busca = cnpjRepo.findByCnpj(cpf_cnpj).getCnpj();
            } catch (Exception e) {
                // System.out.println( e);
          cnpj_busca = null;
        }
        
        if(!cpf_cnpj.equals(cnpj_busca)){
          System.out.println(cnpj_busca);
          System.out.println(cpf_cnpj);
          Integer id_usuario =   CadastroServ.createCadastro(
            usuario.get("nome").toString(),  
            usuario.get("email").toString(),  
            data,
            usuario.get("senha").toString(),  
            usuario.get("flag_tipo").toString()
            );
            Cnpj cnpj = new Cnpj(cpf_cnpj,cadastroRepo.findById(id_usuario).get());
            cnpjRepo.save(cnpj);
          }
          else {System.out.println("cnpj ja cadastrado");
         }
      
    }
     
   } 
  //  @ResponseBody
   @PostMapping("/cadastro/endereco")
    public Long createEndereco(@RequestParam int id_cidade,
                                 @RequestParam String bairro,
                                 @RequestParam long cep,
                                 @RequestParam String end

    
    ){
      Cidade cidade =  cidadeRepo.findById((long)id_cidade).get();
      Endereco endereco = new Endereco(end, cep, cidade,bairro);
      long id_end;
      try {
        id_end = enderecoRepo.findByCep((long)cep).getId();
        
      } catch (Exception e) {
        endereco  = enderecoRepo.save(endereco);
        id_end = endereco.getId();
        //TODO: handle exception
      }
  
    return id_end;
   } 

   @PostMapping("/cadastro/enderecosusuario")
   public void createEndereco(@RequestParam int id_usuario,
                                  @RequestParam int id_endereco,
                                  @RequestParam int numero,
                                  @RequestParam String flag_p
   ){

    Usuario usuario =  cadastroRepo.findById(id_usuario).get();
    Endereco endereco =  enderecoRepo.findById((long)id_endereco).get();

    CadastroServ.createUsuarioxEndereco(numero, flag_p, endereco, usuario);
  }
  
  @PostMapping("/cadastro/telefone")
  public Telefone createTelefone( @RequestBody Map<String, Object> telefone){

  int id_ddd = CadastroServ.convertToInt(telefone.get("id_ddd").toString()); 
  int id_usuario = CadastroServ.convertToInt(telefone.get("id_usuario").toString());
  int numero_tel = CadastroServ.convertToInt(telefone.get("numero_tel").toString());
  String flag_ativo = telefone.get("flag_ativo").toString();  
  
  return CadastroServ.createTelefone(id_ddd, numero_tel, id_usuario, flag_ativo);
  
  }
}