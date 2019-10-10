//
//  TodoListViewController.swift
//  detalhes004
//
//  Created by SUPER on 10/10/19.
//  Copyright © 2019 SUPER. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    let itemArray = ["Find Mike", "Buy Eggs", "Destroy D"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }

    //MARK - Tableview Datasource Methods - servem para carregar a tabela
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
    }
    
    //MARK - Tableview Delegate Methods - quando clicar na celula
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(itemArray[indexPath.row])//quando clicar ele imprime o numero da celula selecionada novo
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }else{
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        //criando um popup quando clica no botao
        let alert = UIAlertController(title: "Titulo alerta", message: "Mensagem do alerta pode ser de qualquer tamanho", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "adicionar", style: .default) { (action) in
            //o que vai acontecer quando o usuario clicar na ação do alerta
            print("ADICIONADO")
            print(textField.text!)
        }
        alert.addAction(action)
        

        let cancelar = UIAlertAction(title: "cancelar", style: .default) { (action) in
            //o que vai acontecer quando o usuario clicar na ação do alerta
            print("cancelado")
            alert.dismiss(animated: true, completion: nil)
        }
        alert.addAction(cancelar)
        
        
        //colocar texto dentro do alert
        alert.addTextField { (texto) in
            texto.placeholder = "criar novo item" //tipo o hit text do android
            print(texto.text!)
            textField = texto
        }
        
        //mostrar o alerta
        present(alert, animated: true, completion: nil)
        
        
        
    }
    

}

