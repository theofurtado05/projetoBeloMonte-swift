//
//  Hoje.swift
//  ProjetoBeloMonte-Swift
//
//  Created by Theo Furtado on 07/11/23.
//

import SwiftUI

struct Hoje: View {
    var body: some View {
        VStack{
            Text("Hoje!")
            NavBar()
        }
    }
}

struct Hoje_Previews: PreviewProvider {
    static var previews: some View {
        Hoje()
    }
}
