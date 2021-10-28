// ADICIONAR UMA CLASSE ACTIVE (CSS) 

var bloco = document.getElementById('nav-list');
var list = bloco.getElementsByClassName('navitem');
// O LAÇO FOR IRÁ LER TODOS OS ITENS PRESENTES DENTRO DA CLASSE NAV-ITEM
for(var i = 0; i < list.length; i++) {
    // A PARTIR DISSO, QUANDO DETERMINADO ITEM SOFRER UM EVENTO CLICK, SERÁ DISPARADA UMA FUNÇÃO
    list[i].addEventListener("click", function(){
    // CRIEI UMA VARIÁVEL ITEMATIVO PARA PEGAR A CLASSE ACTIVE QUE MODIFIQUEI NO CSS
    var itemAtivo = document.getElementsByClassName("active");
    // FEITO TUDO ISSO, AO SOFRER O CLIQUE, O ITEM SELECIONADO SOFRERÁ UMA MUDANÇA, E A CLASSE ACTIVE SERÁ ADICIONADA
    itemAtivo[0].className = itemAtivo[0].className.replace(" active", "");
    //O THIS ENTRA PARA REFERENCIAR O ELEMENTO QUE RECEBEU O EVENTO
    this.className += " active"; 
    });
}