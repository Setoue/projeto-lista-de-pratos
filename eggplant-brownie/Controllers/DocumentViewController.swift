//
//  DocumentViewController.swift
//  eggplant-brownie
//
//  Created by Amarante on 15/03/22.
//

import UIKit
//protocolo faz a ponte entre o DocumentViewController e o RefeicoesTableViewController, sem precisar mexer e uma das class
protocol AdicionaRefeicaoDelegate{//como se fosse a interface em java
    func add(_ refeicao: Refeicao) //um metodo abstrato
}

class DocumentViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AdicionaItensDelegate{
    
    
    
    //MARK: - Atributos
    
    var delegate: AdicionaRefeicaoDelegate?
    var document: UIDocument?
//    var itens: [String] = ["Molho de tomate", "Queijo", "Molho de pimenta", "Alface"]
    var itens: [Item] = [Item(nome: "Molho de Tomate", calorias: 30.0),
                         Item(nome: "Queijo", calorias: 12.1),
                         Item(nome: "Molho de pimenta", calorias: 34.2)]
    var itensSelecionados: [Item] = []
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var itensTableView: UITableView?
    
    @IBOutlet var nomeTextField: UITextField?
    
    @IBOutlet weak var gosteiTextField: UITextField?
    
    @IBOutlet weak var documentNameLabel: UILabel!
    
    //MARK: - View Life Cycle
    
    override func viewDidLoad() {
        //metodo BarButtonItem e em objective-C
        let botaoAdicionaItem = UIBarButtonItem(title: "adicionar", style: .plain, target: self, action: #selector(adicionarItem))//forma segura e usar selector com #
        navigationItem.rightBarButtonItem = botaoAdicionaItem
    }
    
    @objc func adicionarItem(){//@objc ser pra dizer que o metodo pode ser utilizado em objective-C
        let adicionarItensViewController = AdicionarItensViewController(delegate: self)
        navigationController?.pushViewController(adicionarItensViewController, animated: true)
    }
    func add(_ item: Item) {
        itens.append(item)
        if let tableView = itensTableView {
            tableView.reloadData()
        } else {
            Alerta(controller: self).exibe(mensagem: "Nao foi possivel possivel atualizar a tabela")
        }
    }
    
   
    
    //MARK: - View Will Appear
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Access the document
        document?.open(completionHandler: { (success) in
            if success {
                // Display the content of the document, e.g.:
                self.documentNameLabel.text = self.document?.fileURL.lastPathComponent
            } else {
                // Make sure to handle the failed import appropriately, e.g., by presenting an error message to the user.
            }
        })
    }
    //MARK: - UITableViewDataSource
    
    //numero de linhas
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return itens.count
    }
    //conteudo da tableview
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        
        let linhaDaTabela = indexPath.row
        let item = itens[linhaDaTabela]
        celula.textLabel?.text = item.nome
        return celula
    }
    

    //MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //metodo para selecionar mexer nas celulas do ViewTable
        
        guard let celula = tableView.cellForRow(at: indexPath) else{
            return
        }
        if celula.accessoryType == .none{ //verifica se a celula esta vazia e adiciona o checkmark
            celula.accessoryType = .checkmark
            let linhaDaTabela = indexPath.row//pego cada item de cada celula da tabela
            
            itensSelecionados.append(itens[linhaDaTabela])//adiciono no array de itensSelecionados
            
        } else {//caso esteja com valor, tire o checkmark
        celula.accessoryType = .none
            
            let item = itens[indexPath.row]
            if let position = itensSelecionados.index(of: item){
                itensSelecionados.remove(at: position)
                
                
            }
        }
        
    }
    func recuperaRefeicaoDoFormulario()->Refeicao?{
        guard let nomeDaRefeicao = nomeTextField?.text else{
            return nil
        }
        guard let nomeDaFelicidade = gosteiTextField?.text, let felicidade = Int(nomeDaFelicidade) else{
            return nil
        }
        
        let refeicao = Refeicao(nome: nomeDaRefeicao, felicidade: felicidade, itens: itensSelecionados)
        
        return refeicao
    }
    
    
    //MARK: - IBAction
    @IBAction func adicionar(_ sender: Any) {
        
        if let refeicao = recuperaRefeicaoDoFormulario(){
            delegate?.add(refeicao)
            navigationController?.popViewController(animated: true) //faz sumir a tela que foi adicionada
        } else {
            Alerta(controller: self).exibe(mensagem: "Erro ao ler dados do formulario")
        }
    }

    @IBAction func dismissDocumentViewController() {
        dismiss(animated: true) {
            self.document?.close(completionHandler: nil)
        }
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

