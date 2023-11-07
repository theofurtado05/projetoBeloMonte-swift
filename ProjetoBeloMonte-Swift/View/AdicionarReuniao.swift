//
//  AdicionarReuniao.swift
//  ProjetoBeloMonte-Swift
//
//  Created by Theo Furtado on 07/11/23.
//

import SwiftUI

struct AdicionarReuniao: View {
    var body: some View {
        NavigationView{
            VStack{
                Text("Adicionar Reunião")
                NavBar()
            }
        }
    }
}

struct AdicionarReuniao_Previews: PreviewProvider {
    static var previews: some View {
        AdicionarReuniao()
    }
}
