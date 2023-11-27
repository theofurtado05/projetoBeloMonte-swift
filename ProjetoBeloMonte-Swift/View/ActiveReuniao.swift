//
//  ActiveReuniao.swift
//  ProjetoBeloMonte-Swift
//
//  Created by Theo Furtado on 14/11/23.
//

import SwiftUI

struct ActiveReuniao: View {
    //Sistema.shared.activeReuniao
    func formatDate(_ date: Date) -> String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd/MM/yyyy"
            return dateFormatter.string(from: date)
    }
    
    func extrairHoraDeData(_ data: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter.string(from: data)
    }
    
    @State var repetir: String = Sistema.shared.activeReuniao.repetir ? "Ativo" : "Nunca"
    
    var body: some View {
        ZStack{
            VStack{
                HeaderTitleView(header: HeaderTitle(title: Sistema.shared.activeReuniao.nomeEvento, goTo: AnyView(MenuView())))
                
                
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
                                    valor: formatDate(Sistema.shared.activeReuniao.dataInicio)
                                )
                            )
                            
                            ItemReuniaoView(
                                itemReuniao: ItemReuniao(
                                    icon: "clock",
                                    titulo: "Horario",
                                    valor: extrairHoraDeData(Sistema.shared.activeReuniao.dataInicio)
                                )
                            )
                            
                            ItemReuniaoView(
                                itemReuniao: ItemReuniao(
                                    icon: "arrow.counterclockwise",
                                    titulo: "Repetir",
                                    valor: repetir
                                )
                            )
                            
                            ItemReuniaoView(
                                itemReuniao: ItemReuniao(
                                    icon: "mappin.circle",
                                    titulo: "Localização",
                                    valor: Sistema.shared.activeReuniao.localizacao
                                )
                            )
                            
                            ItemReuniaoView(
                                itemReuniao: ItemReuniao(
                                    icon: "bell.badge",
                                    titulo: "Notificação",
                                    valor: "\(Sistema.shared.activeReuniao.notificacao) minutos antes"
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
                            TextEditor(text: .constant(Sistema.shared.activeReuniao.descricao))
                                .padding(10)
                                .background(Color.black.opacity(0.1))
                                .cornerRadius(10)
                            
                        }
                        Divider()
                        VStack(alignment: .leading, spacing: 10){
                            Text("Convidados")
                                .font(.subheadline)
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                            VStack(alignment: .leading, spacing: 10){
                                ForEach(Sistema.shared.activeReuniao.participantes, id: \.self) { participante in
                                    ConvidadosView(nome: participante)
                                }
                            }
                            
                        }
                        
                    }
                    .padding()
                }
            }
        }.navigationBarBackButtonHidden(true)
            
    }
}

struct ConvidadosView: View {
    var nome: String
    var body: some View {
        HStack{
            Image(systemName: "person.crop.circle")
            Text(nome)
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
    MenuView()
}
