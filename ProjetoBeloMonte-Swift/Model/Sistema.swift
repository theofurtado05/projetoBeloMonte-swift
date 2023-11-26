//
//  Sistema.swift
//  ProjetoBeloMonte-Swift
//
//  Created by Theo Furtado on 07/11/23.
//

import Foundation


class Sistema {
    static var shared = Sistema()
    var usuarios = [Usuario]()

        
    var reunioes: [Reuniao] = [
        Reuniao(nomeEvento: "Reuniao - 1", participantes: "theofurtado05@gmail.com", dataInicio: Date(), dataFinal: Date(), localizacao: "Rio de Janeiro", status: "Ocupado", notificacao: "Ativo", descricao: "Reuniao da ap2")
    ]
    
    var destaques: [Destaque] = []
    
    
    var activeReuniao: Reuniao = Reuniao()
    
    
}
