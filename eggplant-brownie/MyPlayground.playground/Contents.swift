//import UIKit
//
//class Refeicao{
//
//    //MARK: - ATRIBUTOS
//    var nome: String
//    var felicidade: String //atributos podem ou nao ter valor
//    var itens: Array<Item> = []
//
//    //MARK: - CONSTRUTOR
//    //utilizando contrutores, evita utilizar variaveis opcionais
//    init(nome: String, felicidade: String){ //construtor // construtor precisa obrigatoriamente da tipagem
//        self.nome = nome //self.nome e referente ao atributo da class // nome e oq foi passado como parametro
//        self.felicidade = felicidade
//        //nao pode passar variaveis opcionais para construtores
//    }
//    //MARK: - METODOS
//    func totalDeCalorias() -> Double{
//        var total = 0.0
//
//        for item in itens {
//            total += item.calorias
//        }
//        return total
//    }
//}
//class Item {
//    var nome: String
//    var calorias: Double
//
//    init(nome: String, calorias: Double){
//        self.nome = nome
//        self.calorias = calorias
//    }
//}
//
//
//let arroz = Item(nome: "Arroz", calorias: 51.0)
//let feijao = Item(nome: "Feijao", calorias: 90.0)
//let contraFile = Item(nome: "Contra File", calorias: 287.0)
//
//let refeicao = Refeicao(nome: "Almoco", felicidade: "5")
//refeicao.itens.append(arroz)
//refeicao.itens.append(feijao)
//refeicao.itens.append(contraFile)
//
//print(refeicao.nome)
//if let primeiroItem = refeicao.itens.first {
//    print(primeiroItem.nome)
//}
//print(refeicao.totalDeCalorias())
//

//--------------------------------------------------------

class Butijao{
 
    var nome: String?
    var felicidade: String?
}

var refeicao: Butijao = Butijao()//instanciando uma class explictamente
//
refeicao.nome = "Arroz"
refeicao.felicidade = "5"
//

refeicao.nom
////BOAS PRATICAS PARA EXTRAIR VALORES OPCIONAIS
//
//if let nome = refeicao.nome { //forma mais segura de extracao de dados opcionais
//    print(nome)
//}
//
//
if let nome = refeicao.nome{ 
    print(nome)
}
func exibeNomeDaReficao(){
    
    //guard let
    guard let nome = refeicao.nome else { //guard let pode utilizar fora do escopo
        return
    }
    guard let felicidade = refeicao.felicidade else{ //tem q estar dentro de um metodo
        return
    }
    nome
    print(nome)
    print(felicidade)
}
//exibeNomeDaReficao()
//
//let numero = Int("5")
//
//if let n = numero{
//    print(n)
//} else{
//    print("Erro ao converter string pra int")
//}

//-------------------------------------------------------------------

//PRATICAS RUINS PARA EXTRAIR VALOR OPCIONAIS
//NUNCA UTILIZAR print(refeicao.nome!) forced unwrap, quando coloca o !, forcando a extracao do valor da variavel. NUNCA UTILIZAR

//--------------------------------------------------------------------
//ARRAYS EM METODOS E RETORNO DE METODOS COM TIPAGEM

//let totalDeCalorias = [50.5, 100]
//
//
//func todasCalorias(totalDeCalorias: [Double]) -> Double{
//    //para indicar que o metodo vai retornar tem que colocar '-> TIPAGEM'
//    var total: Double = 0.0 //o tipo do dado tem que ser Double tbm
//
//    for caloria in totalDeCalorias{
//        total += caloria
//    }
//    return total
//}
//let total = todasCalorias(totalDeCalorias: [50.5, 100, 300])
//
//print(total)

//----------------------------------------------------------------------
//ARRAY COM FOR

//let caloria1 = 50.5
//let caloria2 = 100
//let caloria3 = 300
//let caloria4 = 500

//let totalDeCalorias = [50.5, 100, 300, 500, 70, 80]

//print(totalDeCalorias)
////primeira forma de fazer um for
//for i in 0...3 { //for
//    print(i)
//    print(totalDeCalorias[i])
//}
////segunda forma de fazer um for
//for i  in 0...totalDeCalorias.count-1{
//    print(i)
//    print(totalDeCalorias[i])
//}
//terceira forma de escrever um for

//for caloria in totalDeCalorias{ //melhor forma de fazer um for
//    print(caloria)//tomar cuidado com o nome dado dentro do for
//}

//------------------------------------------------------------------------
//TIPOS DE VARIAVEIS

//let nome = "churros"
//let felicidade = 5
//let calorias  = 79.5
//
//let vegetal: Bool = true
//
////func alimentoConsumido(){
////    print("o alimento consumido foi: \(nome)")
////}
////
////alimentoConsumido()
////alimentoConsumido()
//
//func alimentoConsumido(_ nome: String, calorias: Double){ // _ nome: String --> esta ocultando o paramentro no metodo
//    print("o laimento consumido foi: \(nome), com calorias: \(calorias)")
//
//}
//
//alimentoConsumido(nome, calorias: calorias)
//alimentoConsumido(nome, calorias: calorias)

