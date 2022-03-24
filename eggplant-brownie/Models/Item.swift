//
//  Item.swift
//  eggplant-brownie
//
//  Created by Amarante on 17/03/22.
//

import UIKit

class Item: NSObject {
    
    //MARK: - Atributos
    var nome: String
    var calorias: Double
    
    //MARK: - Construtor/Init
    init(nome: String, calorias: Double){
        self.nome = nome
        self.calorias = calorias
    }

}
