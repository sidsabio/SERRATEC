programa
{
	inclua biblioteca Texto
	inclua biblioteca Matematica
	inclua biblioteca Util
	inclua biblioteca Tipos
	const inteiro quantidade_Alunos = 5
	
	funcao cadeia menu(){ //exibe na tela as opções e retorna a operação escolhida pelo usuário
		cadeia operacao = "0"
		
		escreva("\n\t[1]Cadastrar Aluno  [2]Média da Turma  [3]Situação Aluno  [4]Todos os Alunos  [5]Editar Aluno  [6]Mural de Aniversário  [7]Finalizar")
		escreva("\n\nEscolha a operação desejada: ")
		leia(operacao)
			
		enquanto(operacao!="1" e operacao!="2" e operacao!="3" e operacao!="4" e operacao!="5" e operacao!="6" e operacao!="7"){ //looping se caso a opção digitada não exista
			limpa()
			escreva("Essa opção não existe, escolha outra!\n")
			escreva("\n\t[1]Cadastrar Aluno  [2]Média da Turma  [3]Situação Aluno  [4]Todos os Alunos  [5]Editar Aluno  [6]Mural de Aniversário  [7]Finalizar")
			escreva("\n\nEscolha a operação desejada: ")
			leia(operacao)								
		}
		retorne operacao
	}
	
	funcao vazio validar_mes(cadeia &mes, cadeia &nome_Minusculo){ //valida se o mes digitado passado por parâmetro existe			
		cadeia mes_validos[12] = {"janeiro", "fevereiro", "março", "abril", "maio", "junho", "julho", "agosto", "setembro", "outubro", "novembro", "dezembro"}

		para(inteiro i= 0; i < 12; i++){				
			se(mes_validos[i] == nome_Minusculo){
				mes = mes_validos[i]
			}		
				
		}
	}
	
	funcao vazio cadastrar(cadeia &alunos[][], inteiro &contador_Cadastro){
		real media
		cadeia nome_Minusculo = ""
		logico teste_mes = falso
		se(contador_Cadastro ==0){ //condição para avilar se todos os usuários já foram cadastrados
			para(inteiro i=0; i < Util.numero_linhas(alunos); i++){ //percorre as linhas da matriz
				limpa()
				se(i > 0){
					escreva("\n\n\n\t\t\t\t\t\t\t\tAluno Cadastrado!\n")
					Util.aguarde(1000)
					limpa()
				}
				escreva("\t\t| ALUNO ", i+1, " |\n\n")
				para(inteiro j = 0; j < 8; j++){ //percorre as colunas da matriz
					se(j == 0){ //condição para inserir o nome
						
						escreva("Digite o nome do aluno: ")
						leia(alunos[i][j])
						
						enquanto(alunos[i][j] == ""){
							escreva("\nO nome não deve ser vazio!\n")
							escreva("Digite o nome do aluno, novamente: ")
							leia(alunos[i][j])
						}
					}
					senao se(j == 1){//condição para inserir o mês
						escreva("Digite o mês de nascimento do aluno, por extenso (Ex: Março): ")
						leia(alunos[i][j])
						enquanto(alunos[i][j] == ""){
							escreva("\nO mês não deve ser vazio!\n")
							escreva("Digite o mês de nascimento do aluno, por extenso (Ex: Março), novamente: ")
							leia(alunos[i][j])
						}
						
						nome_Minusculo = Texto.caixa_baixa(alunos[i][j])
								
						enquanto(teste_mes == falso){ //validação se o mês digitado está correto
							cadeia mes = ""
							validar_mes(mes, nome_Minusculo)
							se(mes == nome_Minusculo){ //se o mês digitado existir, finaliza o looping
								teste_mes = verdadeiro	
							}
							senao{
								escreva("\nO mês digitado não existe!")
								escreva("\nDigite o mês de nascimento do aluno, por extenso (Ex: Março): ")
								leia(alunos[i][j])
								nome_Minusculo = Texto.caixa_baixa(alunos[i][j])
							}								
						}
					}senao se(j == 2){//condição para inserir a turma
						escreva("Digite a turma do aluno: ")
						leia(alunos[i][j])
						enquanto(alunos[i][j] == ""){
							escreva("\nA turma não deve ser vazia!\n")
							escreva("Digite a turma do aluno, novamente: ")
							leia(alunos[i][j])
						}
					}
					senao se(j == 3){//condição para inserir a primeira nota
						escreva("Digite a primeira nota do aluno: ")
						leia(alunos[i][j])
						se(Tipos.cadeia_e_inteiro(alunos[i][j], 10) == verdadeiro ou Tipos.cadeia_e_real(alunos[i][j]) == verdadeiro ){ //condição que verifica se a nota digitada por cadeia é do tipo inteiro ou real
							alunos[i][j] = alunos[i][j]
						}senao{	//caso a condição seja falsa (string digitada), atribui "11.0" na respectiva linha da coluna de nota, possibilitando entrar no looping abaixo						
							alunos[i][j] = "11.0"
						}			
							
						enquanto(Tipos.cadeia_para_real(alunos[i][j]) < 0.00 ou Tipos.cadeia_para_real(alunos[i][j]) > 10.00){ //looping se caso o número não seja entre 0 e 10
							escreva("\nA nota deve ser entre 0.00 e 10.00")
							escreva("\nDigite a primeira nota do aluno: ")
							leia(alunos[i][j])
							se(Tipos.cadeia_e_inteiro(alunos[i][j], 10) == verdadeiro ou Tipos.cadeia_e_real(alunos[i][j]) == verdadeiro ){ //condição que verifica se a nota digitada por cadeia é do tipo inteiro ou real
								alunos[i][j] = alunos[i][j]
							}senao{	//caso a condição seja falsa (string digitada), atribui "11.0" na respectiva linha da coluna de nota, possibilitando retornar ao looping							
								alunos[i][j] = "11.0"
							}
							
						}
					}
					senao se(j == 4){//condição para inserir a segunda nota com os mesmos tratamentos da primeira nota
						escreva("Digite a segunda nota do aluno: ")
						leia(alunos[i][j])
						se(Tipos.cadeia_e_inteiro(alunos[i][j], 10) == verdadeiro ou Tipos.cadeia_e_real(alunos[i][j]) == verdadeiro ){
							alunos[i][j] = alunos[i][j]
						}senao{								
							alunos[i][j] = "11.0"
						}			
								
						enquanto(Tipos.cadeia_para_real(alunos[i][j]) < 0.00 ou Tipos.cadeia_para_real(alunos[i][j]) > 10.00){ //looping se caso o número não seja entre 0 e 10
							escreva("\nA nota deve ser entre 0.00 e 10.00")
							escreva("\nDigite a segunda nota do aluno: ")
							leia(alunos[i][j])
							se(Tipos.cadeia_e_inteiro(alunos[i][j], 10) == verdadeiro ou Tipos.cadeia_e_real(alunos[i][j]) == verdadeiro ){
								alunos[i][j] = alunos[i][j]
							}senao{								
								alunos[i][j] = "11.0"
							}
							
						}
					}
					senao se(j == 5){//condição para inserir a terceira nota com os mesmos tratamentos da primeira nota
						escreva("Digite a terceira nota do aluno: ")
						leia(alunos[i][j])
						se(Tipos.cadeia_e_inteiro(alunos[i][j], 10) == verdadeiro ou Tipos.cadeia_e_real(alunos[i][j]) == verdadeiro ){
							alunos[i][j] = alunos[i][j]
						}senao{								
							alunos[i][j] = "11.0"
						}			
								
						enquanto(Tipos.cadeia_para_real(alunos[i][j]) < 0.00 ou Tipos.cadeia_para_real(alunos[i][j]) > 10.00){ //looping se caso o número não seja entre 0 e 10
							escreva("\nA nota deve ser entre 0.00 e 10.00")
							escreva("\nDigite a terceira nota do aluno: ")
							leia(alunos[i][j])
							se(Tipos.cadeia_e_inteiro(alunos[i][j], 10) == verdadeiro ou Tipos.cadeia_e_real(alunos[i][j]) == verdadeiro ){
								alunos[i][j] = alunos[i][j]
							}senao{								
								alunos[i][j] = "11.0"
							}
								
						}
					}				
					senao se(j == 6){ //insere a media e a situção na matriz
						media = (Tipos.cadeia_para_real(alunos[i][3]) + Tipos.cadeia_para_real(alunos[i][4]) + Tipos.cadeia_para_real(alunos[i][5])) / 3	
						alunos[i][j] = Tipos.real_para_cadeia(Matematica.arredondar(media, 2))
						
						se(media < 6.0){
							alunos[i][7] = "Reprovado"
						}senao{
							alunos[i][7] = "Aprovado"
						}
						
					}	
				}
				limpa()
				contador_Cadastro++
			}
		}senao{ //se todos os usuarios ja tiverem sido cadastrados, exibe a mensagem
			limpa()
			escreva("\n\n\n\t\t\t\t\t\t\t\tAlunos já cadastrados!")
			Util.aguarde(1000)
			limpa()
		}			
			
	}
	
	funcao vazio media_Turma(cadeia alunos[][], cadeia cod_Turma){
		real soma = 0.0, media1
		inteiro turma = 0
		para(inteiro i=0; i < Util.numero_linhas(alunos); i++){
			para(inteiro j=0; j < 8; j++){
				se(j==2){
					se(alunos[i][2] == cod_Turma){ //condição se o código da turma da matriz é igual ao código da turma digitado
						soma += Tipos.cadeia_para_real(alunos[i][6]) //atribui o valor da media do aluno na variavel soma
						turma ++
					}
				}		
			}
		}
		se(turma == 0){
			limpa()
			escreva("\n\n\n\n\t\t\t\t\t\t\tNENHUM ALUNO CADASTRADO NESSA TURMA!")
			Util.aguarde(2500)
			limpa()
		}senao se(soma/turma < 6.0){
			limpa()
			escreva("\n\t\t\t\t\t\t\t\t| MÉDIA DA TURMA |\n")
			escreva("\n\t\t\t\t\tA média da turma ", cod_Turma, " é igual a ", Matematica.arredondar(soma / turma, 2), " e está classificada como Ruim!\n\n")
		}senao se(soma/turma >= 6.0 e soma/turma < 8.0){
			limpa()
			escreva("\n\t\t\t\t\t\t\t\t| MÉDIA DA TURMA |\n")
			escreva("\n\t\t\t\t\tA média da turma ", cod_Turma, " é igual a ", Matematica.arredondar(soma / turma, 2), " e está classificada como Média!\n\n")
		}senao se(soma/turma >= 8.0 e soma/turma < 10.0){
			limpa()
			escreva("\n\t\t\t\t\t\t\t\t| MÉDIA DA TURMA |\n")
			escreva("\n\t\t\t\t\tA média da turma ", cod_Turma, " é igual a ", Matematica.arredondar(soma / turma, 2), " e está classificada como Boa!\n\n")
		}senao se(soma/turma == 10.0){
			limpa()
			escreva("\n\t\t\t\t\t\t\t\t| MÉDIA DA TURMA |\n")
			escreva("\n\t\t\t\t\tA média da turma ", cod_Turma, " é igual a ", Matematica.arredondar(soma / turma, 2), " e está classificada como Excelente!\n\n")
		}			
	}
	
	funcao vazio situacao_Aluno(cadeia alunos[][], cadeia nome_Aluno){
		inteiro contador = 0
		cadeia nome_Minusculo = ""
		para(inteiro i = 0; i < Util.numero_linhas(alunos); i++){
			para(inteiro j = 0; j < 8; j++){
				se(j == 0){
					se(alunos[i][j] != ""){ //condição se a matriz não estiver vazia
						nome_Minusculo = Texto.caixa_baixa(alunos[i][j])
					}
					se(nome_Minusculo == Texto.caixa_baixa(nome_Aluno)){ //condição se o nome da matriz é igual ao digitado
						limpa()
						escreva("\n\t\t\t\t\t\t\t\t| SITUAÇÃO DO ALUNO |\n")
						escreva("\n\t\t\t\t\tO aluno ", alunos[i][j], " tem média final igual a ", alunos[i][6], " e está ", alunos[i][7], "!\n\n")
						contador ++
					}
				}
			}
		}
		se(contador == 0){ //condição se não houver alunos cadastrados com o nome digitado
			limpa()
			escreva("\n\n\n\n\t\t\t\t\t\t\tNENHUM ALUNO CADASTRADO COM ESSE NOME!")
			Util.aguarde(2500)
			limpa()
		}
	}
	funcao vazio exibir_alunos(cadeia alunos[][]){	
		inteiro contadorAlunos = 0
		limpa()  
		inteiro troca = 0
		cadeia copia[8]
		
		faca{ //ordena as médias da maior para a menor
			troca = 0
			para(inteiro i = 0; i < Util.numero_linhas(alunos) - 1; i++){
				se(alunos[i][0] != ""){
					se(Tipos.cadeia_para_real(alunos[i][6]) < Tipos.cadeia_para_real(alunos[i+1][6])){ //ordenação do maior para o menor
						para(inteiro j = 0; j < 8; j++){
							copia[j] = alunos[i][j] //atribui cada informação da linha do aluno no vetor copia
							alunos[i][j] = alunos[i+1][j] //se a media for menor, inverte a posição de alunos[i+1] para alunos[i]
							alunos[i+1][j] = copia[j] //atribui a alunos[i+1] as informações guardadas no vetor copia
							troca = 1 //caso haja pelo menos mais 1 mudança, é atribuído 1 à variável troca, refazendo o looping
						}
					}
				}
			}
		}enquanto(troca == 1)
		
		escreva("\n\t\t\t\t\t\t\t\t| LISTA DE ALUNOS |\n")
		para(inteiro i = 0; i < Util.numero_linhas(alunos); i++){
			para(inteiro j = 0; j <Util.numero_colunas(alunos); j++){	
				se(alunos[i][j] != ""){
					se(j==0){
						escreva("\n\t\t| ALUNO ", i+1, " |\n")
						escreva("\n\t\tNome: ", alunos[i][j])
					}senao se(j==1){
						escreva(" | Mês de Nascimento: ", alunos[i][j])
					}senao se(j==2){
						escreva(" | Turma: ", alunos[i][j], "\n")
					}senao se(j==3){
						escreva("\t\tPrimeira nota: ", alunos[i][j])
					}senao se(j==4){
						escreva(" | Segunda nota: ", alunos[i][j])
					}senao se(j==5){
						escreva(" | Terceira nota: ", alunos[i][j])
					}senao se(j==6){
						escreva(" | Média do Aluno: ", alunos[i][j])
					}senao se(j==7){
						escreva(" | Situação: ", alunos[i][j])
						escreva("\n")
					}
					contadorAlunos++
				}
			}
		}
		escreva("\n\n")
		se(contadorAlunos == 0){ //condição se não houver alunos cadastrados na turma digitada
			escreva("\t\t\t\t\t\t\tNENHUM ALUNO CADASTRADO NAS TURMAS!")
			Util.aguarde(2500)
			limpa()
		}
	}
	
	funcao vazio mural_Aniversario(cadeia alunos[][]){
		cadeia aniversario[quantidade_Alunos][12], mes_Minusculo = ""
		inteiro contador = 0, contadorJan = 0, contadorFev = 0, contadorMar = 0, contadorAbr = 0, contadorMai = 0, contadorJun = 0
		inteiro contadorJul = 0, contadorAgo = 0, contadorSet = 0, contadorOut = 0, contadorNov = 0, contadorDez = 0

		para(inteiro i = 0; i < Util.numero_linhas(alunos); i++){
			para(inteiro j = 0; j < 8; j++){
				se(j == 1){
					se(alunos[i][j] != ""){ //condição se a matriz não estiver vazia
						mes_Minusculo = Texto.caixa_baixa(alunos[i][j])
					}
					se(mes_Minusculo == "janeiro"){
						aniversario[i][0] = alunos[i][0]
						contador++
						contadorJan++
					}senao se(mes_Minusculo == "fevereiro"){
						aniversario[i][1] = alunos[i][0]
						contador++
						contadorFev++
					}senao se(mes_Minusculo == "março"){
						aniversario[i][2] = alunos[i][0]
						contador++
						contadorMar++
					}senao se(mes_Minusculo == "abril"){
						aniversario[i][3] = alunos[i][0]
						contador++
						contadorAbr++
					}senao se(mes_Minusculo == "maio"){
						aniversario[i][4] = alunos[i][0]
						contador++
						contadorMai++
					}senao se(mes_Minusculo == "junho"){
						aniversario[i][5] = alunos[i][0]
						contador++
						contadorJun++
					}senao se(mes_Minusculo == "julho"){
						aniversario[i][6] = alunos[i][0]
						contador++
						contadorJul++
					}senao se(mes_Minusculo == "agosto"){
						aniversario[i][7] = alunos[i][0]
						contador++
						contadorAgo++
					}senao se(mes_Minusculo == "setembro"){
						aniversario[i][8] = alunos[i][0]
						contador++
						contadorSet++
					}senao se(mes_Minusculo == "outubro"){
						aniversario[i][9] = alunos[i][0]
						contador++
						contadorOut++
					}senao se(mes_Minusculo == "novembro"){
						aniversario[i][10] = alunos[i][0]
						contador++
						contadorNov++
					}senao se(mes_Minusculo == "dezembro"){
						aniversario[i][11] = alunos[i][0]
						contador++
						contadorDez++
					}
				}
			}
		}
		se(contador == 0){ //condição se não houver alunos cadastrados com o nome digitado
			limpa()
			escreva("\n\n\n\n\t\t\t\t\t\t\tNENHUM ALUNO CADASTRADO NO SISTEMA!")
			Util.aguarde(2500)
			limpa()
		}senao{
			limpa()
			escreva("\n\t\t\t\t\t\t\t\t| MURAL DE ANIVERSÁRIO |\n")
			para(inteiro j = 0; j < 12; j++){
				se(j == 0 e contadorJan != 0){
					escreva("\n\n\t\t| JANEIRO |\n\n")
				}senao se(j == 1 e contadorFev != 0){
					escreva("\n\n\t\t| FEVEREIRO |\n\n")
				}senao se(j == 2 e contadorMar != 0){
					escreva("\n\n\t\t| MARÇO |\n\n")
				}senao se(j == 3 e contadorAbr != 0){
					escreva("\n\n\t\t| ABRIL |\n\n")
				}senao se(j == 4 e contadorMai != 0){
					escreva("\n\n\t\t| MAIO |\n\n")
				}senao se(j == 5 e contadorJun != 0){
					escreva("\n\n\t\t| JUNHO |\n\n")
				}senao se(j == 6 e contadorJul != 0){
					escreva("\n\n\t\t| JULHO |\n\n")
				}senao se(j == 7 e contadorAgo != 0){
					escreva("\n\n\t\t| AGOSTO |\n\n")
				}senao se(j == 8 e contadorSet != 0){
					escreva("\n\n\t\t| SETEMBRO |\n\n")
				}senao se(j == 9 e contadorOut != 0){
					escreva("\n\n\t\t| OUTUBRO |\n\n")
				}senao se(j == 10 e contadorNov != 0){
					escreva("\n\n\t\t| NOVEMBRO |\n\n")
				}senao se(j == 11 e contadorDez != 0){
					escreva("\n\n\t\t| DEZEMBRO |\n\n") 
				}
				para(inteiro i = 0; i < Util.numero_linhas(alunos); i++){
					se(aniversario[i][j] != ""){
						escreva("\t\t• ", aniversario[i][j], "\n")
					}
				}
			}
		}		
	}
	
	funcao vazio editar_Aluno(cadeia alunos[][]){
		cadeia nome_Minusculo = "", nome_Editar = "", operacao = "", nome
		inteiro contador = 0, contador_Fora = 0, contador_Sistema = 0
		real media
		logico teste_mes = falso
		
		para(inteiro i = 0; i < Util.numero_linhas(alunos); i++){
			para(inteiro j = 0; j < 8; j++){
				se(alunos[i][0] != ""){ //condição se a matriz não estiver vazia
					contador_Sistema++
				}
			}
		}
		
		se (contador_Sistema > 0){
			escreva("Digite o nome do aluno que deseja editar: ")
			leia(nome_Editar)	
		}	
		
		enquanto(contador_Fora == 0 e contador_Sistema > 0){ //looping para validar o nome digitado e o mês
			para(inteiro i = 0; i < Util.numero_linhas(alunos); i++){
				para(inteiro j = 0; j < 8; j++){
					se(j==0){
						se(alunos[i][j] != ""){ //condição se a matriz não estiver vazia
							nome_Minusculo = Texto.caixa_baixa(alunos[i][j])
						}						
						se(nome_Minusculo == Texto.caixa_baixa(nome_Editar)){ //condição se o nome da matriz é igual ao digitado
							limpa()
							escreva("\n\t\t[1]Nome    [2]Mês de Nascimento    [3]Turma    ")
							escreva("[4]Primeira Nota    [5]Segunda Nota    [6]Terceira Nota")
							escreva("\n\nEscolha a operação desejada: ")
							leia(operacao)
							enquanto(operacao!="1" e operacao!="2" e operacao!="3" e operacao!="4" e operacao!="5" e operacao!="6"){ //looping se caso a opção digitada não exista
								limpa()
								escreva("Essa opção não existe, escolha outra!\n")
								escreva("\n\t\t[1]Nome    [2]Mês de Nascimento    [3]Turma    ")
								escreva("[4]Primeira Nota    [5]Segunda Nota    [6]Terceira Nota")
								escreva("\n\nEscolha a operação desejada: ")	
								leia(operacao)						
							}
							contador ++
							contador_Fora++
						}
					}
				}
			}
			se(contador == 0){ //condição se não houver alunos cadastrados com o nome digitado
				limpa()
				escreva("\n\n\t\t\t\t\t\t\tNENHUM ALUNO CADASTRADO COM ESSE NOME!")
				Util.aguarde(2500)
				limpa()
				escreva("Digite o nome do aluno que deseja editar, novamente: ")
				leia(nome_Editar)
				contador_Fora = 0				
			}
		}
		se(contador_Sistema == 0){ //condição se não houver alunos cadastrados
			limpa()
			escreva("\n\n\n\n\t\t\t\t\t\t\tNENHUM ALUNO CADASTRADO NO SISTEMA!")
			Util.aguarde(2500)
			limpa()
								
		}
		para(inteiro i = 0; i < Util.numero_linhas(alunos); i++){			
			para(inteiro j = 0; j < 8; j++){
				se(alunos[i][0] != ""){ //condição se a matriz não estiver vazia
					nome_Minusculo = Texto.caixa_baixa(alunos[i][0])
				}				
				se(j==0 e operacao == "1" e nome_Minusculo == Texto.caixa_baixa(nome_Editar)){ //edita o nome
					escreva("Digite o novo nome do aluno: ")
					leia(alunos[i][j])
					limpa()
					escreva("\n\n\n\n\t\t\t\t\t\t\t\tNome alterado!")
					Util.aguarde(2500)
					limpa()
				}senao se(j==1 e operacao == "2" e nome_Minusculo == Texto.caixa_baixa(nome_Editar)){ //edita o mês
					escreva("Digite o mês de nascimento do aluno para editá-lo, por extenso (Ex: Março): ")
					leia(alunos[i][j])
					cadeia mes_Minusculo = Texto.caixa_baixa(alunos[i][j])								
					enquanto(teste_mes == falso){
						cadeia mes = ""
						validar_mes(mes, mes_Minusculo)
						se(mes == mes_Minusculo){
							teste_mes = verdadeiro	
						}
						senao{
							escreva("\nO mês digitado não existe!")
							escreva("\nDigite o mês de nascimento do aluno, por extenso (Ex: Março): ")
							leia(alunos[i][j])
							mes_Minusculo = Texto.caixa_baixa(alunos[i][j])
						}								
					}
					limpa()
					escreva("\n\n\n\n\t\t\t\t\t\t\t\tMês de nascimento alterado!")
					Util.aguarde(2500)
					limpa()
				}senao se(j==2 e operacao == "3" e nome_Minusculo == Texto.caixa_baixa(nome_Editar)){ //edita a turma
					escreva("Digite a turma para editá-la: ")
					leia(alunos[i][j])
					limpa()
					escreva("\n\n\n\n\t\t\t\t\t\t\t\tTurma alterada!")
					Util.aguarde(2500)
					limpa()
				}senao se(j==3 e operacao == "4" e nome_Minusculo == Texto.caixa_baixa(nome_Editar)){ //edita a primeira nota, média do aluno e situação
					escreva("Digite a primeira nota do aluno para editá-la: ")
					leia(alunos[i][j])
					se(Tipos.cadeia_e_inteiro(alunos[i][j], 10) == verdadeiro ou Tipos.cadeia_e_real(alunos[i][j]) == verdadeiro ){ //condição que verifica se a nota digitada por cadeia é do tipo inteiro ou real
						alunos[i][j] = alunos[i][j]
					}senao{	//caso a condição seja falsa (string digitada), atribui "11.0" na respectiva linha da coluna de nota, possibilitando entrar no looping abaixo						
						alunos[i][j] = "11.0"
					}			
							
					enquanto(Tipos.cadeia_para_real(alunos[i][j]) < 0.00 ou Tipos.cadeia_para_real(alunos[i][j]) > 10.00){ //looping se caso o número não seja entre 0 e 10
						escreva("\nA nota deve ser entre 0.00 e 10.00")
						escreva("\nDigite a primeira nota do aluno para editá-la: ")
						leia(alunos[i][j])
						se(Tipos.cadeia_e_inteiro(alunos[i][j], 10) == verdadeiro ou Tipos.cadeia_e_real(alunos[i][j]) == verdadeiro ){ //condição que verifica se a nota digitada por cadeia é do tipo inteiro ou real
							alunos[i][j] = alunos[i][j]
						}senao{	//caso a condição seja falsa (string digitada), atribui "11.0" na respectiva linha da coluna de nota, possibilitando retornar ao looping							
							alunos[i][j] = "11.0"
						}
							
					}
					media = (Tipos.cadeia_para_real(alunos[i][3]) + Tipos.cadeia_para_real(alunos[i][4]) + Tipos.cadeia_para_real(alunos[i][5])) / 3	
					alunos[i][6] = Tipos.real_para_cadeia(Matematica.arredondar(media, 2))
						
					se(media < 6.0){
						alunos[i][7] = "Reprovado"
					}senao{
						alunos[i][7] = "Aprovado"
					}
					limpa()
					escreva("\n\n\n\n\t\t\t\t\t\t\t\tPrimeira nota alterada!")
					Util.aguarde(2500)
					limpa()
				}senao se(j==4 e operacao == "5" e nome_Minusculo == Texto.caixa_baixa(nome_Editar)){ //edita a segunda nota, média do aluno e situação
					escreva("Digite a segunda nota do aluno para editá-la: ")
					leia(alunos[i][j])
					se(Tipos.cadeia_e_inteiro(alunos[i][j], 10) == verdadeiro ou Tipos.cadeia_e_real(alunos[i][j]) == verdadeiro ){ //condição que verifica se a nota digitada por cadeia é do tipo inteiro ou real
						alunos[i][j] = alunos[i][j]
					}senao{	//caso a condição seja falsa (string digitada), atribui "11.0" na respectiva linha da coluna de nota, possibilitando entrar no looping abaixo						
						alunos[i][j] = "11.0"
					}			
							
					enquanto(Tipos.cadeia_para_real(alunos[i][j]) < 0.00 ou Tipos.cadeia_para_real(alunos[i][j]) > 10.00){ //looping se caso o número não seja entre 0 e 10
						escreva("\nA nota deve ser entre 0.00 e 10.00")
						escreva("\nDigite a segunda nota do aluno para editá-la: ")
						leia(alunos[i][j])
						se(Tipos.cadeia_e_inteiro(alunos[i][j], 10) == verdadeiro ou Tipos.cadeia_e_real(alunos[i][j]) == verdadeiro ){ //condição que verifica se a nota digitada por cadeia é do tipo inteiro ou real
							alunos[i][j] = alunos[i][j]
						}senao{	//caso a condição seja falsa (string digitada), atribui "11.0" na respectiva linha da coluna de nota, possibilitando retornar ao looping							
							alunos[i][j] = "11.0"
						}
							
					}
					media = (Tipos.cadeia_para_real(alunos[i][3]) + Tipos.cadeia_para_real(alunos[i][4]) + Tipos.cadeia_para_real(alunos[i][5])) / 3	
					alunos[i][6] = Tipos.real_para_cadeia(Matematica.arredondar(media, 2))
						
					se(media < 6.0){
						alunos[i][7] = "Reprovado"
					}senao{
						alunos[i][7] = "Aprovado"
					}
					limpa()
					escreva("\n\n\n\n\t\t\t\t\t\t\t\tSegunda nota alterada!")
					Util.aguarde(2500)
					limpa()
				}senao se(j==5 e operacao == "6" e nome_Minusculo == Texto.caixa_baixa(nome_Editar)){ //edita a terceira nota, média do aluno e situação
					escreva("Digite a terceira nota do aluno para editá-la: ")
					leia(alunos[i][j])
					se(Tipos.cadeia_e_inteiro(alunos[i][j], 10) == verdadeiro ou Tipos.cadeia_e_real(alunos[i][j]) == verdadeiro ){ //condição que verifica se a nota digitada por cadeia é do tipo inteiro ou real
						alunos[i][j] = alunos[i][j]
					}senao{	//caso a condição seja falsa (string digitada), atribui "11.0" na respectiva linha da coluna de nota, possibilitando entrar no looping abaixo						
						alunos[i][j] = "11.0"
					}			
							
					enquanto(Tipos.cadeia_para_real(alunos[i][j]) < 0.00 ou Tipos.cadeia_para_real(alunos[i][j]) > 10.00){ //looping se caso o número não seja entre 0 e 10
						escreva("\nA nota deve ser entre 0.00 e 10.00")
						escreva("\nDigite a terceira nota do aluno para editá-la: ")
						leia(alunos[i][j])
						se(Tipos.cadeia_e_inteiro(alunos[i][j], 10) == verdadeiro ou Tipos.cadeia_e_real(alunos[i][j]) == verdadeiro ){ //condição que verifica se a nota digitada por cadeia é do tipo inteiro ou real
							alunos[i][j] = alunos[i][j]
						}senao{	//caso a condição seja falsa (string digitada), atribui "11.0" na respectiva linha da coluna de nota, possibilitando retornar ao looping							
							alunos[i][j] = "11.0"
						}
							
					}
					media = (Tipos.cadeia_para_real(alunos[i][3]) + Tipos.cadeia_para_real(alunos[i][4]) + Tipos.cadeia_para_real(alunos[i][5])) / 3	
					alunos[i][6] = Tipos.real_para_cadeia(Matematica.arredondar(media, 2))
						
					se(media < 6.0){
						alunos[i][7] = "Reprovado"
					}senao{
						alunos[i][7] = "Aprovado"
					}
					limpa()
					escreva("\n\n\n\n\t\t\t\t\t\t\t\tTerceira nota alterada!")
					Util.aguarde(2500)
					limpa()
				}
			}
		}
	}		
	funcao inicio(){
		inteiro contador_Cadastro = 0
		cadeia alunos[quantidade_Alunos][8], cod_Turma, nome_Aluno, operacao
		logico fimPrograma = falso

		escreva("\n\n\n\n\t\t\t\t\t\tBem-Vindo ao Sistema de Gerenciamento de Turma!")
		Util.aguarde(2500)
		limpa()
		enquanto(fimPrograma == falso){ //retornar ao menu até que finalize o programa
			operacao = menu()	
			se(operacao == "1"){
				cadastrar(alunos, contador_Cadastro)
			}senao se(operacao == "2"){
				escreva("Informe a turma: ")
				leia(cod_Turma)
				media_Turma(alunos, cod_Turma)
			}senao se(operacao == "3"){
				escreva("Digite o nome do aluno que deseja consultar: ")
				leia(nome_Aluno)
				situacao_Aluno(alunos, nome_Aluno)
			}senao se(operacao == "4"){
				exibir_alunos(alunos)
			}senao se(operacao == "5"){
				limpa()
				editar_Aluno(alunos)
			}senao se(operacao == "6"){
				mural_Aniversario(alunos)
			}senao se(operacao == "7"){
				limpa()
				escreva("\n\n\n\n\t\t\t\t\t\t\t\tPrograma Finalizado!")
				Util.aguarde(2500)
				limpa()
				fimPrograma = verdadeiro 
			}
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 2308; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {alunos, 37, 32, 6}-{troca, 247, 10, 5}-{copia, 248, 9, 5};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */