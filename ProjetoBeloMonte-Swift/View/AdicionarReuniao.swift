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
    @State var status: Int = 0
    @State var notificacao: Int = 0
    @State var descricao: String = ""
    @State var reuniaoCriada: Bool = false
    @State var navigateToMenu: Bool = false
    @State var repetir: Bool = true
    
    @State private var convidados = ""
    @State private var listaConvidados: [String] = []

    
    func CriarReuniao(){
        @State var statusAuxiliar: String
        if(status == 0){
            statusAuxiliar = "Ocupado"
        } else {
            statusAuxiliar = "Disponível"
        }
        
        let reuniao: Reuniao = Reuniao(nomeEvento: nomeEvento, participantes: listaConvidados, dataInicio: dataInicio, dataFinal: dataFinal, localizacao: localizacao, status: statusAuxiliar, notificacao: notificacao, descricao: descricao, repetir: repetir)
        
        print(dataInicio)
        
        Sistema.shared.reunioes.append(reuniao)
        reuniaoCriada = true
    }
    
    func adicionarConvidados() {
        let convidado = convidados.trimmingCharacters(in: .whitespacesAndNewlines)
                if !convidado.isEmpty {
                    listaConvidados.append(convidado)
                }

        convidados = ""
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
                            
                            VStack(alignment: .leading, spacing: 10) {
                                HStack {
                                    Image(systemName: "person.crop.circle")
                                    TextField("Adicionar participantes", text: $convidados)
                                    Button("Adicionar") {
                                        adicionarConvidados()
                                    }
                                        
                                }
                                

                                List(listaConvidados, id: \.self) { convidado in
                                    VStack(alignment: .leading, spacing: 10) { // Use um VStack para alinhar à esquerda
                                            HStack {
                                                Image(systemName: "person.crop.circle")
                                                Text(convidado)
                                        }
                                    }.padding(.vertical, 1)
                                    
                                }
                                
                            }.padding(.bottom, 10)
                            
                            HStack{
                                
                                VStack(alignment: .leading){
                                    HStack{
                                        Image(systemName: "clock")
                                        Text("Data")
                                            .multilineTextAlignment(.leading)
                                    }
                                    
                                    DatePicker(selection: $dataInicio, label: { Text("Inicio") })
                                    DatePicker(selection: $dataFinal, label: { Text("Final") })
                                }
                            }
                            
                            Toggle(isOn: $repetir) {
                                HStack{
                                    Image(systemName: "repeat")
                                    Text("Repetir")
                                }
                                
                            }
                        
                            
                            HStack{
                                Image(systemName: "mappin.circle")
                                TextField("Localização", text: $localizacao)
                            }
                            
                            HStack{
                                Image(systemName: "eye.fill")
                                Picker(selection: $status, label: Text("Exibir como: ")) {
                                        Text("Ocupado").tag(1)
                                        Text("Disponível").tag(2)
                                    }
                                            
                            }
                            
                            HStack {
                                Image(systemName: "bell.badge.fill")
                                Stepper(value: $notificacao, in: 0...60, step: 1) {
                                                Text("Notificar \(notificacao) minutos antes")
                                            }
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
