package data;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import model.Estudante;

public class BancoDeDados {
	private BancoDeDados() {
	}

	public static Connection obterConexao() {

		String url = "jdbc:postgresql://localhost:5432/escola";
		String usuario = "postgres";
		String senha = "123456";

		Connection conexao = null;

		try {
			conexao = DriverManager.getConnection(url, usuario, senha);
		} catch (SQLException e) {
			System.out.println("Não foi possível obter a conexão com banco de dados!");
			System.out.println("Tente verificar sua senha ");
		}

		return conexao;
	}

	public static void adicionaAluno(String nome, String curso) throws SQLException {

		Connection conexao = BancoDeDados.obterConexao();

		if (conexao != null) {

			Statement stmt = conexao.createStatement();

			Estudante estudante = new Estudante();

			estudante.setNome(nome);
			estudante.setCurso(curso);

			stmt.executeUpdate(estudante.getSqlInsert());

			stmt.close();
			conexao.close();
		}
	}

	public static void editaAluno(int idAluno, String informacao, String novaInfo) throws SQLException {
		Connection conexao = BancoDeDados.obterConexao();

		Statement stmt = conexao.createStatement();

		Estudante estudante = new Estudante();

		estudante.setId(idAluno);

		if (informacao.equals("1")) {

			stmt.executeUpdate(estudante.getSqlUpdateNome(novaInfo));
		} else if (informacao.equals("2")) {

			stmt.executeUpdate(estudante.getSqlUpdateCurso(novaInfo));
		}
		stmt.close();
		conexao.close();

	}

	public static void deletaAluno(int alunoId) throws SQLException {
		Connection conexao = BancoDeDados.obterConexao();

		Statement stmt = conexao.createStatement();

		Estudante estudante = new Estudante();

		
		estudante.setId(alunoId);

		stmt.executeUpdate(estudante.getSqlDelete());
		stmt.close();
		conexao.close();
	}

	public static void listaAlunos() throws SQLException {
		Connection conexao = BancoDeDados.obterConexao();

		Estudante estudante = new Estudante();

		Statement stmt = conexao.createStatement();

		ResultSet rs = stmt.executeQuery(estudante.getSqlSelect());

		System.out.println("			  Estudantes:\n");

		while (rs.next()) {
			Estudante estudante2 = new Estudante(rs.getInt("id"), rs.getString("nome"), rs.getString("curso"));
			System.out.print("		nº " + estudante2.getId());
			System.out.print("	Nome: " +estudante2.getNome());
			System.out.println("	Curso: " +estudante2.getCurso());
		}

		rs.close();
		stmt.close();
		conexao.close();
	}
}