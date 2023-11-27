//
//  ActiveDestaque.swift
//  ProjetoBeloMonte-Swift
//
//  Created by Theo Furtado on 26/11/23.
//

import SwiftUI

struct ActiveDestaque: View {
    
    var body: some View {
        ZStack{
            VStack{
                HeaderTitleView(header: HeaderTitle(title: Sistema.shared.activeDestaque.titulo, goTo: AnyView(Hoje())))
                
                ScrollView{
                    
                    Image(Sistema.shared.activeDestaque.img)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                        .cornerRadius(50)
                    
                    VStack(alignment: .leading, spacing: 10) {
                        ForEach(Sistema.shared.activeDestaque.topicos, id: \.self) { topico in
                            VStack(alignment: .leading, spacing: 5) {
                                Text(topico.titulo)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color("PrimaryColor"))
                                
                                Text(topico.texto)
                                    .lineLimit(nil)
                            }
                        }
                    }.padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
 
                }
                
                NavBar()
            }
            
        }.navigationBarBackButtonHidden(true)
        
    }
}

#Preview {
    ActiveDestaque()
}
