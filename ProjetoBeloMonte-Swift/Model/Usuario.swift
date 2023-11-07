//
//  Usuario.swift
//  ProjetoBeloMonte-Swift
//
//  Created by Theo Furtado on 07/11/23.
//

import Foundation
import SwiftUI

class Usuario {
    var nome: String
    var cargo: String
    var email: String
    var senha: String
    
    var foto: UIImage
    
    init(nome: String, cargo: String, email: String, senha: String, foto: UIImage){
        self.nome = nome
        self.cargo = cargo
        self.email = email
        self.senha = senha
        
        self.foto = foto
        
    }
    
    // Construtor de conveniência que permite criar instâncias com nome, cargo e email
    convenience init(nome: String, cargo: String, email: String) {
        // Pode definir um valor padrão para senha e foto aqui
        self.init(
            nome: nome,
            cargo: cargo,
            email: email,
            senha: "",
            foto: UIImage())
    }
    
    func setFotoFromURL(_ url: URL, completion: @escaping (UIImage?) -> Void) {
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let data = data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.foto = image
                    completion(image)
                }
            } else {
                DispatchQueue.main.async {
                    completion(nil)
                }
            }
        }.resume()
    }
    
}
