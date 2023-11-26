//
//  Destaque.swift
//  ProjetoBeloMonte-Swift
//
//  Created by Theo Furtado on 07/11/23.
//

import Foundation

class Destaque: Hashable, Equatable {
    var titulo: String
    var img: String
    var topicos: [Topico]
    
    init(){
        self.titulo = ""
        self.img = ""
        self.topicos = []
    }

    
    init(titulo: String, img: String, topicos: [Topico]){
        self.titulo = titulo
        self.img = img
        self.topicos = topicos
    }
    
    // Implementação do protocolo Hashable
    func hash(into hasher: inout Hasher) {
        hasher.combine(titulo)
        hasher.combine(img)
        
    }
    
    // Implementação do protocolo Equatable
    static func == (lhs: Destaque, rhs: Destaque) -> Bool {
        return lhs.titulo == rhs.titulo &&
               lhs.img == rhs.img
    }
}


class Topico: Hashable, Equatable {
    var titulo: String
    var texto: String
    
    init(titulo: String, texto: String){
        self.titulo = titulo
        self.texto = texto
    }
    
    // Implementação do protocolo Hashable
    func hash(into hasher: inout Hasher) {
        hasher.combine(titulo)
        hasher.combine(texto)
        
    }
    
    // Implementação do protocolo Equatable
    static func == (lhs: Topico, rhs: Topico) -> Bool {
        return lhs.titulo == rhs.titulo &&
               lhs.texto == rhs.texto
    }
}
