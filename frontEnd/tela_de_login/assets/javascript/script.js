function mudar() {
  let telaLogin = document.getElementById("tela-de-login")
  let form = document.getElementById("formulario")
  let checkBox = document.getElementsByClassName("input-checkbox")
  let ajuda = document.getElementsByClassName("rodape-botao")
  let assinatura = document.getElementsByClassName("assinatura")

  telaLogin.classList.toggle("light-mode-background")
  form.classList.toggle("light-mode-form")
  checkBox[0].classList.toggle("light-mode-form")
  ajuda[0].classList.toggle("light-mode-form")
  assinatura[0].classList.toggle("light-mode-form")

}
