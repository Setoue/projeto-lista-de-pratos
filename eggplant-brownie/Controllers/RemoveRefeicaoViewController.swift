//
//  RemoveRefeicaoViewController.swift
//  eggplant-brownie
//
//  Created by Amarante on 22/03/22.
//

import UIKit

class RemoveRefeicaoViewController{
    
    let controller: UIViewController
    init(controller: UIViewController){
        self.controller = controller
    }
    
    func exibe(_ refeicao: Refeicao, handler: @escaping(UIAlertAction) -> Void){
        
        let alerta = UIAlertController(title: refeicao.nome, message: refeicao.detalhes(), preferredStyle: .alert)
        //caixa de alerta mostrando o nome e a felicidade da refeicao
        
        let botaoCancelar = UIAlertAction(title: "cancelar", style: . cancel, handler: nil )
        //botao da caixa de alerta que serve para cancelar, voltando para tableView
        //passando parametros como o nome do botao, o estilo e
        alerta.addAction(botaoCancelar)
        
        let botaoRemover = UIAlertAction(title: "remover", style: .destructive, handler: handler)//closure, sempre utlizar .self, pq ele nao enxerga o objeto
        alerta.addAction(botaoRemover)
        
        controller.present(alerta, animated: true, completion: nil)
    }
}
