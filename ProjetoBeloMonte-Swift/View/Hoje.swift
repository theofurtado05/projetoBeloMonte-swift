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
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Destaques")
                                .fontWeight(.bold)
                                .multilineTextAlignment(.leading)
                                .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 10))
                            
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
                    
                    NavBar()
                }
            }
            .navigationBarBackButtonHidden(true)
            .edgesIgnoringSafeArea(.all)
        }
        .frame(height: .infinity)
    }
}



struct Hoje_Previews: PreviewProvider {
    static var previews: some View {
        Hoje()
    }
}
