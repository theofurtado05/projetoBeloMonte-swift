//
//  Hoje.swift
//  ProjetoBeloMonte-Swift
//
//  Created by Theo Furtado on 07/11/23.
//

import SwiftUI

struct Hoje: View {
    let header = HeaderTitle(title: "Hoje", goTo: AnyView(MenuView()))
    
    var body: some View {
        
            ZStack{
                NavigationView{
                    
                VStack{
                    HeaderTitleView(header: header)
                    VStack{
                        Text("Destaques")
                            .fontWeight(.bold)
                            .multilineTextAlignment(.leading)
                        
                        ForEach(Sistema.shared.reunioes, id: \.self) {  reuniao in
                            HStack{
                                Text("Teste")
                            }
                        }
                    }.frame(width: .infinity, height: .infinity)
                    
                    NavBar()
                }
            }
        }.navigationBarBackButtonHidden(true)
            .frame(height: .infinity)
            
    }
}

struct Hoje_Previews: PreviewProvider {
    static var previews: some View {
        Hoje()
    }
}
