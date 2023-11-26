//
//  AdicionarReuniao.swift
//  ProjetoBeloMonte-Swift
//
//  Created by Theo Furtado on 07/11/23.
//

import SwiftUI

struct AdicionarReuniao: View {
    
    let header = HeaderTitle(title: "Novo Evento", goTo: AnyView(MenuView()))
    
    @State var nomeEvento: String = ""
    @State var participantes: String = ""
    @State var dataInicio = Date()
    @State var dataFinal = Date()
    @State var localizacao: String = ""
    @State var status: String = ""
    @State var notificacao: String = ""
    @State var descricao: String = ""
    @State var reuniaoCriada: Bool = false
    @State var navigateToMenu: Bool = false
    

    
    func CriarReuniao(){
        
        let reuniao: Reuniao = Reuniao(nomeEvento: nomeEvento, participantes: participantes, dataInicio: dataInicio, dataFinal: dataFinal, localizacao: localizacao, status: status, notificacao: notificacao, descricao: descricao)
        
        print(dataInicio)
        
        Sistema.shared.reunioes.append(reuniao)
        reuniaoCriada = true
    }
    
    var body: some View {
        NavigationView{
            ZStack{
                NavigationLink(destination: MenuView(), isActive: $navigateToMenu) {
                                   EmptyView()
                               }
                VStack{
                    HeaderTitleView(header: header)
                    VStack{
                        Form{
                            HStack{
                                Image(systemName: "pencil")
                                TextField("Nome do evento", text: $nomeEvento)
                            }
                            
                            HStack{
                                Image(systemName: "person.crop.circle")
                                TextField("Adicionar participantes", text: $participantes)
                            }
                            
                            HStack{
                                
                                VStack(alignment: .leading){
                                    HStack{
                                        Image(systemName: "clock")
                                        Text("Data")
                                            .multilineTextAlignment(.leading)
                                    }.frame(width: .infinity)
                                    
                                    DatePicker(selection: $dataInicio, label: { Text("Inicio") })
                                    DatePicker(selection: $dataFinal, label: { Text("Final") })
                                }
                            }
                            
                            
                            HStack{
                                Image(systemName: "mappin.circle")
                                TextField("Localização", text: $localizacao)
                            }
                            
                            HStack{
                                Image(systemName: "eye.fill")
                                Picker(selection: $status, label: Text("Status")) {
                                    Text("Ocupado").tag(1)
                                    Text("Disponível").tag(2)
                                }
                            }
                            
                            HStack {
                                Image(systemName: "bell.badge.fill")
                                TextField("Adicionar notificação", text: $notificacao)
                            }
                            
                            HStack{
                                Image(systemName: "text.alignleft")
                                TextField("Descrição", text: $descricao)
                            }
                            
                            
                        }
                        
                        Button(action: {
                            CriarReuniao()
                                
                        }) {
                            
                            Text("Salvar")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding()
                        }
                        
                        .background(Color("PrimaryColor"))
                        .cornerRadius(50)
                        .frame(width: .infinity)
                        .alert(isPresented: $reuniaoCriada) {
                                        Alert(
                                            title: Text("Reunião Criada"),
                                            message: Text("Sua reunião foi criada com sucesso."),
                                            dismissButton: .default(Text("OK")) {
                                                navigateToMenu = true
                                            }
                                        )
                                    }
                        
                        
                    }
                    
                    
                }
            }
        }.navigationBarBackButtonHidden(true)
    }
        
}


struct AdicionarReuniao_Previews: PreviewProvider {
    static var previews: some View {
        AdicionarReuniao()
            
    }
}
