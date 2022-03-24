//
//  Alerta.swift
//  eggplant-brownie
//
//  Created by Amarante on 22/03/22.
//


import UIKit


class Alerta{
    
    let controller: UIViewController
    
    init(controller: UIViewController){
        self.controller = controller
    }
    
    func exibe(titulo: String = "Atencao", mensagem: String){
            
            let alerta = UIAlertController(title: titulo, message: mensagem, preferredStyle: .alert)
            let ok = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            alerta.addAction(ok)
            
        controller.present(alerta, animated: true, completion: nil)
        
    }
}
