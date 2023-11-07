//
//  MenuView.swift
//  ProjetoBeloMonte-Swift
//
//  Created by Theo Furtado on 16/10/23.
//

import SwiftUI

struct MenuView: View {
    
    @State var minhasReunioes: [Reuniao] = [
        Reuniao(titulo: "Reuniao 1", data: Date(), horaInicio: "13:35", horaFinal: "14:00"),
        Reuniao(titulo: "Reuniao 2", data: Date(), horaInicio: "13:35", horaFinal: "14:00"),
        Reuniao(titulo: "Reuniao 3", data: Date(), horaInicio: "13:35", horaFinal: "14:00"),
        Reuniao(titulo: "Reuniao 4", data: Date(), horaInicio: "13:35", horaFinal: "14:00"),
        Reuniao(titulo: "Reuniao 5", data: Date(), horaInicio: "13:35", horaFinal: "14:00"),
        Reuniao(titulo: "Reuniao 6", data: Date(), horaInicio: "13:35", horaFinal: "14:00")
    ]
    
    
    func formatDate(_ date: Date) -> String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd/MM/yyyy"
            return dateFormatter.string(from: date)
        }
    
   
    
    var body: some View {
        ZStack {
            NavigationView{
            VStack{
                VStack{
                    MultiDatePicker(/*@START_MENU_TOKEN@*/"Label"/*@END_MENU_TOKEN@*/, selection: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Binding<Set<DateComponents>>@*/.constant([])/*@END_MENU_TOKEN@*/).padding()
                }
                
                Divider()
                
                
                
                VStack{
                    ScrollView{
                            ForEach(minhasReunioes, id: \.self) { reuniao in
                                GroupBox(label: Text(reuniao.titulo)) {
                                    HStack {
                                        HStack {
                                            Image(systemName: "clock")
                                            Text(reuniao.horaInicio)
                                        }
                                        HStack {
                                            Image(systemName: "calendar")
                                            Text(formatDate(reuniao.data))
                                        }
                                        Spacer()
                                    }
                                }
                            }
                        }
                    
                }.ignoresSafeArea()
                
                NavBar()
                
                }
            }
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
