//
//  MenuView.swift
//  ProjetoBeloMonte-Swift
//
//  Created by Theo Furtado on 16/10/23.
//

import SwiftUI


struct MenuView: View {
    
    @State var reuniaoAtiva: Bool = false
    
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
    
    func acessarReuniao(reuniao: Reuniao){
        Sistema.shared.activeReuniao = reuniao
        reuniaoAtiva = true
        print(Sistema.shared.activeReuniao.nomeEvento)
    }
    
    @State private var selectedDates: Set<DateComponents> = []
    
   
    
    var body: some View {
        ZStack {
            NavigationView{
                VStack{
                    NavigationLink(destination: ActiveReuniao(), isActive: $reuniaoAtiva) {
                        EmptyView()
                    }
                    
                    VStack{
                        MultiDatePicker("Label", selection: $selectedDates)
                            .padding()
                            
                        
                                    

                    }
                    
                    Divider()
                    
                    VStack{
                        ScrollView{
                            ForEach(Sistema.shared.reunioes, id: \.self) { reuniao in
                                // Se não houver datas selecionadas ou se a data da reunião estiver na lista de datas selecionadas
                                if selectedDates.isEmpty || selectedDates.contains(where: { formatDate($0.date!) == formatDate(reuniao.dataInicio) }) {
                                    GroupBox(label: Text(reuniao.nomeEvento)) {
                                        HStack {
                                            HStack {
                                                Image(systemName: "clock")
                                                Text(extrairHoraDeData(reuniao.dataInicio))
                                            }.opacity(0.6)
                                            HStack {
                                                Image(systemName: "calendar")
                                                Text(formatDate(reuniao.dataInicio))
                                            }.opacity(0.6)
                                            
                                            Spacer()
                                            Image(systemName: "chevron.right")
                                                .foregroundColor(Color("PrimaryColor"))
                                        }.onTapGesture {
                                            acessarReuniao(reuniao: reuniao)
                                            print(reuniao.dataInicio)
                                        }
                                    }
                                }
                            
                            }
                        }
                        
                    }.ignoresSafeArea()
                    
                    NavBar()
                    
                }
            }
        }.navigationBarBackButtonHidden(true)
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
            
    }
}
