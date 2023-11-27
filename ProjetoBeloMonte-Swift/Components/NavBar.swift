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
        Screen(titulo: "Adicionar", icon: "plus.circle", pageTo: {
            AnyView(AdicionarReuniao())
        }),
        Screen(titulo: "Visualizar", icon: "calendar.circle", pageTo: {
            AnyView(MenuView())
        }),
        
//        Screen(titulo: "Ajustes", icon: "gearshape", pageTo: {
//            AnyView(Configuracoes())
//        }),
    ]
    

    var body: some View {
         VStack(alignment: .center, spacing: 10){
              HStack(alignment: .center, spacing: 30.0){
               
                 ForEach(minhasScreen, id: \.self) { screen in
                      
                      NavigationLink(destination: screen.pageTo){
                         VStack{
                              Image(systemName: screen.icon)
                                  .foregroundColor(Color.black)
                                  .font(.system(size: 30))
                                  .imageScale(.small)
                                  .opacity(0.6)
                                  .frame(width: 80, alignment: .center)
                                   
                              Text(screen.titulo)
                                   .font(.caption)
                                   .foregroundColor(Color.black)
                                   .multilineTextAlignment(.center)
                                   .opacity(0.6)
                         }
                         
                     }
                     .ignoresSafeArea()
                     
                     
                 }
              }
              .frame(height: 5)
              .ignoresSafeArea()
              .padding(.top, 15.0)
              .padding(.bottom, 0)
             .background(Color.white)
         }
         .padding(.top, 5)
    }
}

struct NavBar_Previews: PreviewProvider {
    static var previews: some View {
        Hoje()
    }
}
