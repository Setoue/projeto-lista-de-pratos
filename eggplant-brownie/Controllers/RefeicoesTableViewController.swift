//
//  RefeicoesTableViewController.swift
//  eggplant-brownie
//
//  Created by Amarante on 17/03/22.
//

import Foundation
import UIKit

class RefeicoesTableViewController: UITableViewController, AdicionaRefeicaoDelegate{
    
    var refeicoes = [Refeicao(nome: "Macarrao", felicidade: 4),
                     Refeicao(nome: "Pizza", felicidade: 3),
                     Refeicao(nome: "Sushi", felicidade: 5)]

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return refeicoes.count
    }
    //passa 3 vezes por esse metodo
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        
        let refeicao = refeicoes[indexPath.row]
        
        celula.textLabel?.text = refeicao.nome
        
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(mostrarDetalhes(_:)))//realiza a acao
        celula.addGestureRecognizer(longPress)
        
        return celula
    }
    
    func add(_ refeicao: Refeicao) {//o _ serve para ocutar o primeiro parametro

        refeicoes.append(refeicao) //adiciona o dado na lista
        tableView.reloadData() //atualiza os elementos da lista
    }
    
    @objc func mostrarDetalhes(_ gesture: UILongPressGestureRecognizer){
        //executa dps que a acao do obejeto longPress foi realizada
        //metodo para receber um toque longo do usuario
        if gesture.state == .began{ //estado de comeco, no caso o usario so pressionou
        
            let celula = gesture.view as! UITableViewCell //transformo uma view em um celula atraves do as! UITableViewCell
            guard let indexPath = tableView.indexPath(for: celula) else { return }
            
            let refeicao = refeicoes[indexPath.row]
            
            RemoveRefeicaoViewController(controller: self).exibe(refeicao, handler: {
                alert in
                self.refeicoes.remove(at: indexPath.row)
                self.tableView.reloadData()
            })//closure
            
            
        }
    }
    
   
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      
        if segue.identifier == "adicionar" {// esse if e para verificar se o identificador esta correto
            if let viewController = segue.destination as? DocumentViewController{
                viewController.delegate = self//casting,
    //        prepara(para: segue)
            }
        }
        
        
    }
//    func prepara(para segue: UIStoryboardSegue){ // paramentros internos podem ter nome difentes do externo.
//        if segue.identifier = "adicionar" {
//
//        }
//        segue
//    }
}
