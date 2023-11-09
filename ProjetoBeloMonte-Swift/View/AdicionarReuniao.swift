//
//  AdicionarReuniao.swift
//  ProjetoBeloMonte-Swift
//
//  Created by Theo Furtado on 07/11/23.
//

import SwiftUI

struct AdicionarReuniao: View {
    
    let header = HeaderTitle(title: "Novo Evento", goTo: AnyView(MenuView()))
    
    var body: some View {
        NavigationView{
            ZStack{
                VStack{
                    VStack{
                        HeaderTitleView(header: header)
                        Divider()
                            .frame(height: 0.5)
                            .overlay(Color("PrimaryColor"))
                    }
                    
                    Form{
                        
                    }
                }
                

                    
                    
                  
                    
                    
                    //Formulario de criaçao
                    //- nome do evento
                    //- adicionar participantes
                    //- participantes adicionados
                    //- data e hora
                    //- repetir?
                    //- sugestao
                    //- Localizacao
                    //- exibir como (status - ocupado, etc)
                    //- adicionar notificacao
                    //- descricao
                    
                    //botao de salvar
                }
            }.navigationBarBackButtonHidden(true)
        }
        
    }


struct AdicionarReuniao_Previews: PreviewProvider {
    static var previews: some View {
        AdicionarReuniao()
            
    }
}
