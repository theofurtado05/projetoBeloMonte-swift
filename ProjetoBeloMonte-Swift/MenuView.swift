//
//  MenuView.swift
//  ProjetoBeloMonte-Swift
//
//  Created by Theo Furtado on 16/10/23.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        ZStack {
            VStack{
                VStack{
                    MultiDatePicker(/*@START_MENU_TOKEN@*/"Label"/*@END_MENU_TOKEN@*/, selection: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Binding<Set<DateComponents>>@*/.constant([])/*@END_MENU_TOKEN@*/).padding()
                }
                
                Divider()
                
                VStack{
                    List {
                        GroupBox(label: Text("Reunião da Diretoria")) {
                            HStack{
                                HStack{
                                    Image(systemName: "clock")
                                    Text("09:30")
                                }
                                HStack{
                                    Image(systemName: "calendar")
                                    Text("06/09/2023")
                                }
                                Spacer()
                            }
                            
                        }
                        
                        
                        
                        GroupBox(label: Text("Reunião com Ibmec")) {
                            HStack{
                                HStack{
                                    Image(systemName: "clock")
                                    Text("013:30")
                                }
                                HStack{
                                    Image(systemName: "calendar")
                                    Text("12/09/2023")
                                }
                                Spacer()
                            }
                            
                        }

                    }.ignoresSafeArea()
                    
                    
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
