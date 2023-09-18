package model;

public class Estudante {

	private int id;
	private String nome;
	private String curso;

	public Estudante() {
	}

	public Estudante(int id, String nome, String curso) {
		this.id = id;
		this.nome = nome;
		this.curso = curso;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getCurso() {
		return curso;
	}

	public void setCurso(String curso) {
		this.curso = curso;
	}

	public String getSqlInsert() {
		return "insert into estudante(nome, curso) values ('" + this.getNome() + "' , '" + this.getCurso() + "')";
	}

	public String getSqlSelect() {
		return "select * from estudante ORDER BY id";
	}

	public String getSqlUpdateNome(String novoNome) {
		return "UPDATE estudante SET nome = '" + novoNome + "' WHERE id = ('" + this.getId() + "')";
	}

	public String getSqlUpdateCurso(String novoCurso) {
		return "UPDATE estudante SET curso = '" + novoCurso + "' WHERE id = ('" + this.getId() + "')";
	}

	public String getSqlDelete() {
		return "DELETE FROM estudante WHERE id = ('" + this.getId() + "')";
	}

	@Override
	public String toString() {
		return "Estudante [id=" + id + ", nome=" + nome + ", curso" + curso + "]";
	}

}