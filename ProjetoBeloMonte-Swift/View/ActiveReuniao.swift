//
//  ActiveReuniao.swift
//  ProjetoBeloMonte-Swift
//
//  Created by Theo Furtado on 14/11/23.
//

import SwiftUI

struct ActiveReuniao: View {
    
    
    var body: some View {
        Text(Sistema.shared.activeReuniao.nomeEvento)
        Text(Sistema.shared.activeReuniao.descricao)
        Text(Sistema.shared.activeReuniao.localizacao)
        Text(Sistema.shared.activeReuniao.notificacao)
        
        
    }
}

#Preview {
    MenuView()
}
