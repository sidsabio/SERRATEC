package principal;

import java.sql.Connection;
import java.sql.SQLException;

import data.BancoDeDados;
import data.CriaTabela;
import view.Menu;

public class SistemaGerenciamentoEstudantes {
	public static void main(String[] args) throws SQLException {

		Connection conexao = BancoDeDados.obterConexao();

		CriaTabela criaTabela = new CriaTabela();

		criaTabela.construirTabelas(conexao,
				"CREATE TABLE IF NOT EXISTS estudante (id SERIAL PRIMARY KEY, nome VARCHAR(100), curso VARCHAR(100))");

		Menu.iniciarMenu();

		conexao.close();
	}
}
