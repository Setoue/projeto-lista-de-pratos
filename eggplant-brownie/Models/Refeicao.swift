//
//  Refeicao.swift
//  eggplant-brownie
//
//  Created by Amarante on 17/03/22.
//

import UIKit

class Refeicao: NSObject {
    
    //MARK: - ATRIBUTOS
    let nome: String
    let felicidade: Int //atributos podem ou nao ter valor
    var itens: Array<Item> = []
    
    //MARK: - CONSTRUTOR
    //utilizando contrutores, evita utilizar variaveis opcionais
    init(nome: String, felicidade: Int, itens: [Item] = []){ //construtor // construtor precisa obrigatoriamente da tipagem
        self.nome = nome //self.nome e referente ao atributo da class // nome e oq foi passado como parametro
        self.felicidade = felicidade
        //nao pode passar variaveis opcionais para construtores
        self.itens = itens
    }
    //MARK: - METODOS
    func totalDeCalorias() -> Double{
        var total = 0.0
        
        for item in itens {
            total += item.calorias
        }
        return total
    }
    
    func detalhes() -> String{
        var mensagem = "Felicidade \(felicidade)"
        
        for item in itens{
            mensagem += ", \(item.nome) - calorias: \(item.calorias)"
        }
        return mensagem
    }
    
}
