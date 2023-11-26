//
//  Reuniao.swift
//  ProjetoBeloMonte-Swift
//
//  Created by Theo Furtado on 07/11/23.
//

import Foundation

class Reuniao: Hashable, Equatable {
    
    var nomeEvento: String
    var participantes: String
    var dataInicio: Date
    var dataFinal: Date
    var localizacao: String
    var status: String
    var notificacao: String
    var descricao: String
    
    
    init (nomeEvento: String, participantes: String, dataInicio: Date, dataFinal: Date, localizacao: String, status: String, notificacao: String, descricao: String){
        self.nomeEvento = nomeEvento
        self.participantes = participantes
        self.dataInicio = dataInicio
        self.dataFinal = dataFinal
        self.localizacao = localizacao
        self.status = status
        self.notificacao = notificacao
        self.descricao = descricao
    }
    
    init (){
        self.nomeEvento = ""
        self.participantes = ""
        self.dataInicio = Date()
        self.dataFinal = Date()
        self.localizacao = ""
        self.status = ""
        self.notificacao = ""
        self.descricao = ""
    }
    
    // Implementação do protocolo Hashable
    func hash(into hasher: inout Hasher) {
        hasher.combine(nomeEvento)
        hasher.combine(dataInicio)
        hasher.combine(dataFinal)
    }
    
    // Implementação do protocolo Equatable
    static func == (lhs: Reuniao, rhs: Reuniao) -> Bool {
        return lhs.nomeEvento == rhs.nomeEvento &&
               lhs.dataInicio == rhs.dataInicio &&
               lhs.dataFinal == rhs.dataFinal
    }
}



