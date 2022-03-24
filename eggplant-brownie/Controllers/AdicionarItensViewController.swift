//
//  AdicionarItensViewController.swift
//  eggplant-brownie
//
//  Created by Amarante on 18/03/22.
//

import UIKit

protocol AdicionaItensDelegate{
    func add(_ item: Item)
}

class AdicionarItensViewController: UIViewController {

    //MARK: - IBOutlets
    
    @IBOutlet weak var nomeAdicionarItens: UITextField!
    
    @IBOutlet weak var caloriasAdicionarItens: UITextField!
    
    //MARK: - Atributos
    
    var delegate: AdicionaItensDelegate?
    
    init(delegate: AdicionaItensDelegate){
        super.init(nibName: "AdicionarItensViewController", bundle: nil)
        self.delegate = delegate
    }
    
    required init?(coder aDecoder: NSCoder ) {
        super.init(coder: aDecoder)
    }
    
    //MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()


    }

    //MARK: - IBAction
    @IBAction func adicionarItem(_ sender: Any) {
        
    
        guard let nomeItens = nomeAdicionarItens.text, let caloriasItens = caloriasAdicionarItens.text else{
            return
        }
        guard let numeroDeCalorias = Double(caloriasItens) else{
            return
        }
        let item = Item(nome: nomeItens, calorias: numeroDeCalorias)
        delegate?.add(item) //e um if let escondido
        navigationController?.popViewController(animated: true)//metodo para voltar uma viewController (tela)
    }
}
    //MARK: - EXPLICACOES

    //navegar para proxima tela: navigationController.push()
    //voltar para tela anterior: navigationController.pop()
    //para extrair valores pode utilizar o guard let ou if let
    
    //didSelectRow que captura o evento de clique da celular quando o uuasrio efetua a acao
        //com o .accessoryTyoe = .none --> celula sem o check(vzinho)
        //com o .accessoryType = .checkmark --> celula com o check(vzinho)
    
    //cellForRowAt indexPath, que retorna uma celula para saber o conteudo de cada linha da tabela
    //numberOfRowsInSection que e um metodo que pergunta o numero de linha da tabela, para saber, vc retorna um contador
    
    //criacao de layout atraves do .Xib
