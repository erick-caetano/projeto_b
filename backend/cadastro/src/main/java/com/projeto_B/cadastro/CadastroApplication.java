package com.projeto_B.cadastro;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class CadastroApplication {

	public static void main(String[] args) {
        SpringApplication.run(CadastroApplication.class, args);

		// SpringApplication.run(ChamandoStoredProcedures.class, args);
		System.out.println("HELLO, APP WORKING");
	}

}
