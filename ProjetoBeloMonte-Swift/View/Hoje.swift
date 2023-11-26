//
//  Hoje.swift
//  ProjetoBeloMonte-Swift
//
//  Created by Theo Furtado on 07/11/23.
//

import SwiftUI

struct Hoje: View {
    let header = HeaderTitle(title: "Hoje", goTo: AnyView(MenuView()))
    
    @State var destaqueAtivo: Bool = false
    
    func acessarDestaque(destaque: Destaque){
        Sistema.shared.activeDestaque = destaque
        destaqueAtivo = true
        
    }
    
    var body: some View {
        ZStack {
            NavigationView {
                VStack(spacing: 0) {
                    NavigationLink(destination: ActiveDestaque(), isActive: $destaqueAtivo) {
                        EmptyView()
                    }
                    
                    HeaderTitleView(header: header)
                    
                    
                    ScrollView {
                        VStack {
                            Text("Destaques")
                                .fontWeight(.bold)
                                .multilineTextAlignment(.leading)
                            
                            ForEach(Sistema.shared.destaques, id: \.self) { destaque in
                                HStack {
                                    CardView(destaque: destaque).onTapGesture{
                                        acessarDestaque(destaque: destaque)
                                    }
                                }
                            }
                        }
                        .padding()
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    
                    // NavBar preso na parte inferior
                    NavBar()
                }
            }
            .navigationBarBackButtonHidden(true)
            .edgesIgnoringSafeArea(.all) // Ignora as áreas seguras para ocupar toda a tela
        }
        .frame(height: .infinity)
    }
}



struct Hoje_Previews: PreviewProvider {
    static var previews: some View {
        Hoje()
    }
}
