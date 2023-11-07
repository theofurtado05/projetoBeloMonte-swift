//
//  Screen.swift
//  ProjetoBeloMonte-Swift
//
//  Created by Theo Furtado on 07/11/23.
//

import Foundation
import SwiftUI

class Screen: Hashable, Equatable {
    var titulo: String
    var icon: String
    var pageTo: () -> AnyView
    
    init(titulo: String, icon: String, pageTo: @escaping () -> AnyView){
        self.titulo = titulo
        self.icon = icon
        self.pageTo = pageTo
    }
    
    // Implementação do protocolo Hashable
    func hash(into hasher: inout Hasher) {
        hasher.combine(titulo)
        hasher.combine(icon)
        
        
    }
    
    // Implementação do protocolo Equatable
    static func == (lhs: Screen, rhs: Screen) -> Bool {
        return lhs.titulo == rhs.titulo &&
               lhs.icon == rhs.icon
    }
}
