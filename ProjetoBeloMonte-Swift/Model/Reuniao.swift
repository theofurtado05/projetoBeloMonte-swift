//
//  Reuniao.swift
//  ProjetoBeloMonte-Swift
//
//  Created by Theo Furtado on 07/11/23.
//

import Foundation

class Reuniao: Hashable, Equatable {
    
    var nomeEvento: String //titulo
    var participantes: [String]
    var dataInicio: Date
    var dataFinal: Date
    var localizacao: String
    var status: String //exibir como
    var notificacao: Int
    var descricao: String
    var convidados: [Convidado] //nao to usando
    var repetir: Bool
    
    init (nomeEvento: String, participantes: [String], dataInicio: Date, dataFinal: Date, localizacao: String, status: String, notificacao: Int, descricao: String, repetir: Bool){
        self.nomeEvento = nomeEvento
        self.participantes = participantes
        self.dataInicio = dataInicio
        self.dataFinal = dataFinal
        self.localizacao = localizacao
        self.status = status
        self.notificacao = notificacao
        self.descricao = descricao
        self.convidados = []
        self.repetir = repetir
    }
    
    init (){
        self.nomeEvento = ""
        self.participantes = []
        self.dataInicio = Date()
        self.dataFinal = Date()
        self.localizacao = ""
        self.status = ""
        self.notificacao = 5
        self.descricao = ""
        self.convidados = []
        self.repetir = true
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


class ItemReuniao {
    var icon: String
    var titulo: String
    var valor: String
    
    init(icon: String, titulo: String, valor: String){
        self.icon = icon
        self.titulo = titulo
        self.valor = valor
    }
}


class Convidado {
    var email: String
    var nome: String
    
    init(email: String, nome: String){
        self.email = email
        self.nome = nome
    }
    
    init(nome: String){
        self.nome = nome
        self.email = ""
    }
    
    // Implementação do protocolo Hashable
    func hash(into hasher: inout Hasher) {
        hasher.combine(email)
        hasher.combine(nome)
    }
    
    // Implementação do protocolo Equatable
    static func == (lhs: Convidado, rhs: Convidado) -> Bool {
        return lhs.nome == rhs.nome &&
               lhs.email == rhs.email
               
    }
}
