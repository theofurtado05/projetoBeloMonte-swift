//
//  NavBar.swift
//  ProjetoBeloMonte-Swift
//
//  Created by Theo Furtado on 07/11/23.
//

import SwiftUI

struct NavBar: View {
    
    @State var minhasScreen: [Screen] = [
        Screen(titulo: "Hoje", icon: "calendar", pageTo: {
            AnyView(Hoje())
        }),
        Screen(titulo: "Visualizar", icon: "calendar.circle", pageTo: {
            AnyView(MenuView())
        }),
        Screen(titulo: "Adicionar", icon: "plus.circle", pageTo: {
            AnyView(AdicionarReuniao())
        }),
        Screen(titulo: "Ajustes", icon: "gearshape", pageTo: {
            AnyView(Configuracoes())
        }),
    ]
    

    var body: some View {
         HStack(alignment: .bottom, spacing: 25.0){
          
            ForEach(minhasScreen, id: \.self) { screen in
                 
                 NavigationLink(destination: screen.pageTo){
                    VStack{
                         Image(systemName: screen.icon)
                              .foregroundColor(Color.black)
                              
                         Text(screen.titulo)
                              .font(.caption)
                              .foregroundColor(Color.black)
                              .multilineTextAlignment(.center)
                    }
                    
                }
                .ignoresSafeArea()
                
                
            }
         }
         .frame(height: 15.0)
         .ignoresSafeArea()
         .padding(.horizontal, 5.0)
         .padding(.top, 4.0)
        .background(Color.white)
    }
}

struct NavBar_Previews: PreviewProvider {
    static var previews: some View {
        Hoje()
    }
}
