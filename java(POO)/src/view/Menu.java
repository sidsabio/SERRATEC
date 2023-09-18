package view;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Scanner;

import cmd.LimpaTerminal;
import data.BancoDeDados;

public class Menu {

	zpublic static void iniciarMenu() throws SQLException {
		String opcao = "";
		Scanner entrada = new Scanner(System.in);
		boolean cond = true;
		do {
			System.out.println("\n			  Sistema de Gerenciamento de Estudante");
			System.out.printf("	\n		Adicionar Aluno (1)");
			System.out.printf("	Editar Aluno (2)");
			System.out.printf("	Remover Aluno (3)");
			System.out.printf("\n\n				Listar Alunos (4)");
			System.out.printf("	sair (5)\n");
			System.out.printf("\n		Escolha a opção: ");
			opcao = entrada.nextLine();
			System.out.printf("\n");

			switch (opcao) {
			case "1": {
				LimpaTerminal.limpa();
				System.out.printf("\n		Digite o nome do estudante: ");
				String nome = entrada.nextLine();
				System.out.printf("\n		Digite o curso: ");
				String curso = entrada.nextLine();
				BancoDeDados.adicionaAluno(nome, curso);

				LimpaTerminal.limpa();

				System.out.println("\n\n\n\n				  		Estudante adicionado com sucesso!");
				try {
					Thread.sleep(1000 * 2);
				} catch (InterruptedException e) {
					e.printStackTrace();
				}
				LimpaTerminal.limpa();

				break;
			}
			case "2": {
				LimpaTerminal.limpa();
				boolean cont = true;
				int idAluno = 0;
				while (cont) {
					try {
						BancoDeDados.listaAlunos();
						System.out.printf("\n		Digite o número do estudante que deseja editar: ");
						String strIdAluno = entrada.nextLine();
						idAluno = Integer.parseInt(strIdAluno);
						cont = false;
					} catch (NumberFormatException e) {
						LimpaTerminal.limpa();
						System.out.println("\n\n\n\n				Digite um numero de aluno válido.");
						try {
							Thread.sleep(1000 * 2);
						} catch (InterruptedException e1) {
							e1.printStackTrace();
						}
						LimpaTerminal.limpa();

					}

				}

				String informacao = "";
				String novaInfo = "";
				boolean teste = true;
				while (teste) {
					LimpaTerminal.limpa();

					System.out.println("		Nome (1)    Curso (2)");
					System.out.printf("\n		Escolha a informação que deseja alterar: ");
					informacao = entrada.nextLine();

					if (informacao.equals("1")) {
						System.out.printf("\n		Digite o novo nome: ");
						novaInfo = entrada.nextLine();
						LimpaTerminal.limpa();
						System.out.println("\n\n\n\n				Estudante alterado com sucesso!");

						try {
							Thread.sleep(1000 * 2);
						} catch (InterruptedException e) {
							e.printStackTrace();
						}
						LimpaTerminal.limpa();
						teste = false;

					} else if (informacao.equals("2")) {
						System.out.printf("\n		Digite o novo curso: ");
						novaInfo = entrada.nextLine();
						LimpaTerminal.limpa();
						System.out.println("\n\n\n\n				Estudante alterado com sucesso!");
						try {
							Thread.sleep(1000 * 2);
						} catch (InterruptedException e) {
							e.printStackTrace();
						}
						LimpaTerminal.limpa();
						teste = false;
					} else {
						LimpaTerminal.limpa();
						System.out.println("\n\n\n\n				Digite uma opção válida.");
						try {
							Thread.sleep(1000 * 2);
						} catch (InterruptedException e) {
							e.printStackTrace();
						}
						LimpaTerminal.limpa();

					}
				}

				BancoDeDados.editaAluno(idAluno, informacao, novaInfo);

				break;
			}
			case "3": {
				LimpaTerminal.limpa();

				boolean teste = true;
				while (teste) {
					try {
						LimpaTerminal.limpa();
						BancoDeDados.listaAlunos();
						System.out.printf("\n		Digite o numero do estudante que deseja deletar: ");
						String strAlunoId = entrada.nextLine();
						int alunoId = Integer.parseInt(strAlunoId);
						BancoDeDados.deletaAluno(alunoId);
						LimpaTerminal.limpa();
						System.out.println("\n\n\n\n  				Estudante Deletado!");
						teste = false;
						try {
							Thread.sleep(1000 * 2);
						} catch (InterruptedException e) {
							e.printStackTrace();
						}
						LimpaTerminal.limpa();
					} catch (NumberFormatException e) {
						LimpaTerminal.limpa();
						System.out.println("\n\n\n\n  				Digite um numero válido");
						try {
							Thread.sleep(1000 * 1);

						} catch (InterruptedException e1) {

							e1.printStackTrace();

						}

					}
				}
				break;
			}
			case "4": {
				LimpaTerminal.limpa();
				BancoDeDados.listaAlunos();
				System.out.printf("\n		Aperte 'ENTER'  para continuar:");
				entrada.nextLine();
				LimpaTerminal.limpa();
				break;
			}
			case "5": {
				cond = false;
				break;
			}
			default:
				LimpaTerminal.limpa();
				System.out.println("\n\n\n\n  				 		Opção inválida");
				try {
					Thread.sleep(1000 * 2);
				} catch (InterruptedException e) {
					e.printStackTrace();
				}
				LimpaTerminal.limpa();

				break;
			}
		} while (opcao != "1" && opcao != "2" && opcao != "3" && opcao != "4" && opcao != "5" && cond != false);
		entrada.close();
		LimpaTerminal.limpa();
		System.out.println("\n\n\n\n  				 Obrigado por utilizar o programa!");
		try {
			Thread.sleep(1000 * 2);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}

		// Exibição para quando finalizar o programa pelo cmd
//		if (System.getProperty("os.name").contains("Windows"))
//			try {
//				new ProcessBuilder("cmd", "/c", "curl parrot.live").inheritIO().start().waitFor();
//				
//
//			} catch (InterruptedException | IOException e) {
//				e.printStackTrace();
//			}
//		else
//			System.out.print("\033[H\033[2J");

	}
}
