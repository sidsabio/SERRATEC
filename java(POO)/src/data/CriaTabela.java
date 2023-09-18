package data;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

public class CriaTabela {
	public void construirTabelas(Connection conexao, String sql) {

		try {
			Statement statement = conexao.createStatement();

			statement.executeUpdate(sql);

//			System.out.println("Tabela criada com sucesso!");
		} catch (SQLException e) {
			System.out.println("Não foi possível obter o statement da conexão");
		}

	}
}
