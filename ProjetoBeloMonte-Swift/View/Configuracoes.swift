//
//  Configuracoes.swift
//  ProjetoBeloMonte-Swift
//
//  Created by Theo Furtado on 07/11/23.
//

import SwiftUI

struct Configuracoes: View {
    var body: some View {
        NavigationView{
            VStack{
                Text("Configuraçoes")
                NavBar()
            }
        }
    }
}

struct Configuracoes_Previews: PreviewProvider {
    static var previews: some View {
        Configuracoes()
    }
}
