//
//  ActiveReuniao.swift
//  ProjetoBeloMonte-Swift
//
//  Created by Theo Furtado on 14/11/23.
//

import SwiftUI

struct ActiveReuniao: View {
    
    
    var body: some View {
        ZStack{
            VStack{
                HeaderTitleView(header: HeaderTitle(title: "Titulo da Reuniao", goTo: AnyView(MenuView())))
                VStack(alignment: .leading, spacing: 10) {
                    HStack{
                        Image(systemName: "calendar")
                        VStack(alignment: .leading, spacing: 0){
                            Text("Data")
                            Text("26/11/2023")
                        }
                    }.frame(width: .infinity)
                    
                }
                .frame(width: .infinity)
                
            }
        }
    }
}

#Preview {
    ActiveReuniao()
}
