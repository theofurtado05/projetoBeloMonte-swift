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
                
                
                ScrollView{
                    
                    
                    VStack(alignment: .leading, spacing: 10) {
                        
                        
                        LazyVGrid(columns: [
                            GridItem(.flexible(minimum: 0, maximum: .infinity)),
                            GridItem(.flexible(minimum: 0, maximum: .infinity))
                        ], spacing: 10) {
                            ItemReuniaoView(
                                itemReuniao: ItemReuniao(
                                    icon: "calendar",
                                    titulo: "Data",
                                    valor: "26/11/2023"
                                )
                            )
                            
                            ItemReuniaoView(
                                itemReuniao: ItemReuniao(
                                    icon: "clock",
                                    titulo: "Horario",
                                    valor: "13:53"
                                )
                            )
                            
                            ItemReuniaoView(
                                itemReuniao: ItemReuniao(
                                    icon: "arrow.counterclockwise",
                                    titulo: "Repetir",
                                    valor: "Nunca"
                                )
                            )
                            
                            ItemReuniaoView(
                                itemReuniao: ItemReuniao(
                                    icon: "mappin.circle",
                                    titulo: "Localização",
                                    valor: "Rio de Janeiro - BR"
                                )
                            )
                            
                            ItemReuniaoView(
                                itemReuniao: ItemReuniao(
                                    icon: "bell.badge",
                                    titulo: "Notificação",
                                    valor: "5 minutos antes"
                                )
                            )
                        }
                        .padding()
                        Divider()
                        VStack(alignment: .leading, spacing: 10){
                            Text("Descrição")
                                .font(.subheadline)
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                            TextEditor(text: .constant("Descrição"))
                                .padding(10)
                                .background(Color.black.opacity(0.2))
                                .cornerRadius(10)
                            
                        }
                        Divider()
                        VStack(alignment: .leading, spacing: 10){
                            Text("Convidados")
                                .font(.subheadline)
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                            VStack(alignment: .leading, spacing: 10){
                                ConvidadosView()
                            }
                            
                        }
                        
                    }
                    .padding()
                }
            }
        }
    }
}

struct ConvidadosView: View {
    
    var body: some View {
        HStack{
            Image(systemName: "person.crop.circle")
            Text("Théo Furtado")
        }
    }
}

struct ItemReuniaoView: View {
    var itemReuniao: ItemReuniao

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack{
                Image(systemName: itemReuniao.icon)
                    .font(.title)
                    .foregroundColor(.black)
                    .padding(5)
                    .background(Color("PrimaryColor").opacity(0.8).cornerRadius(10))
                    .frame(width: 20, alignment: .leading)
                    
                    
                Spacer()
            }.padding(.bottom, 10)
            

            Text(itemReuniao.titulo)
                .font(.headline)

            Text(itemReuniao.valor)
                .font(.subheadline)
        }
        .padding()
        .frame(height: 120.0)
        .background(Color.secondary.opacity(0.1))
        .cornerRadius(10)
    }
}


#Preview {
    ActiveReuniao()
}
