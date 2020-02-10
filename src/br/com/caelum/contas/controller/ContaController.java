package br.com.caelum.contas.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import br.com.caelum.contas.dao.ContaDAO;
import br.com.caelum.contas.modelo.Conta;


@Controller
public class ContaController {
	
	private ContaDAO dao;
	
	@Autowired
	public ContaController(ContaDAO dao) {
		this.dao = dao;
	}
	
	@RequestMapping("/form")
	public String formulario() {
		System.out.println("execultando o formulario");
		
		return "formulario";
	}
	
	@RequestMapping("/adicionaConta")
	public String adiciona(@Valid Conta conta, BindingResult result) {
		System.out.println("conta adicionada é: " + conta.getDescricao());
		System.out.println("conta adicionada é: " + conta.getDataPagamento());
		
		if (result.hasErrors()) {
			return "formulario";
		}
		
		if (conta.getId() != null) {
			dao.altera(conta);
		} else {
			dao.adiciona(conta);		
		}
		
		return "conta-adicionada";
	}
	
	@RequestMapping("/listarContas")
	public ModelAndView lista() {
		System.out.println("lista de contas");
		
		List<Conta> contas = dao.lista();
		
		ModelAndView mv = new ModelAndView("conta/lista");
		mv.addObject("todasContas", contas);
		
		return mv;
	}
	
	@RequestMapping("/deletarConta")
	public String deletar(Conta contaID) {
		System.out.println("deletarConta");
		
		Conta conta = contaID;
		
		dao.remove(conta);
		return "redirect:/listarContas";
	}
	
	@RequestMapping("/mostarConta")
	public ModelAndView alterar(Long id) {
		ModelAndView mv = new ModelAndView("formulario");
		mv.addObject("conta", dao.buscaPorId(id));
		return mv;
	}
	
	@RequestMapping("/pagarConta")
	public void pagarConta(Conta conta, HttpServletResponse response) {
		dao.paga(conta.getId());
		response.setStatus(200);
	}
	
}











