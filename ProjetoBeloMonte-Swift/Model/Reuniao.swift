//
//  Reuniao.swift
//  ProjetoBeloMonte-Swift
//
//  Created by Theo Furtado on 07/11/23.
//

import Foundation

class Reuniao: Hashable, Equatable {
    
    var titulo: String
    var data: Date
    var horaInicio: String
    var horaFinal: String
    
    init (titulo: String, data: Date, horaInicio: String, horaFinal: String){
        self.titulo = titulo
        self.data = data
        self.horaInicio = horaFinal
        self.horaFinal = horaFinal
    }
    
    // Implementação do protocolo Hashable
    func hash(into hasher: inout Hasher) {
        hasher.combine(titulo)
        hasher.combine(data)
        hasher.combine(horaInicio)
        hasher.combine(horaFinal)
    }
    
    // Implementação do protocolo Equatable
    static func == (lhs: Reuniao, rhs: Reuniao) -> Bool {
        return lhs.titulo == rhs.titulo &&
               lhs.data == rhs.data &&
               lhs.horaInicio == rhs.horaInicio &&
               lhs.horaFinal == rhs.horaFinal
    }
}
