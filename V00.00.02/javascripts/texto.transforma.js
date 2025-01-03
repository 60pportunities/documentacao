function transformarTexto() {
  var titulo = document.getElementById("titulo");
  var paragrafo = document.getElementById("paragrafo");
  var textoTitulo = titulo.innerText;
  // Substitui "ME" por "WE" ou "WE" por "ME"
  if (textoTitulo === "ME") {
     // Substitui ME por WE
     titulo.innerText = "WE";
     paragrafo.innerHTML = paragrafo.innerHTML.replace(/ME/g, "WE");
     paragrafo.innerHTML = paragrafo.innerHTML.replace(/ME/g, "<span class='emphasis'>ME</span>");
  } else {
    // Substitui WE por ME
    titulo.innerText = "ME";
    paragrafo.innerHTML = paragrafo.innerHTML.replace(/WE/g, "ME");
    paragrafo.innerHTML = paragrafo.innerHTML.replace(/WE/g, "<span class='emphasis'>WE</span>");
 }
}
