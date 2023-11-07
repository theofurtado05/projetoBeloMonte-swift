//
//  ForgetPasswordPage.swift
//  ProjetoBeloMonte-Swift
//
//  Created by Theo Furtado on 16/10/23.
//

import SwiftUI

struct ForgetPasswordPage: View {
    @State var email: String = ""
    @State var password: String = ""
    
    @State var emailCerto: String = "Admin@admin"
    @State var passwordCerta: String = "123"
    
    @State var isAuthenticated: Bool = false
    
    func checkLogin() {
        if email == emailCerto && password == passwordCerta{
            isAuthenticated = true
            print(isAuthenticated)
            
            
        } else {
            isAuthenticated = false
        }
    }
    
    
    
    var body: some View {
        NavigationView{
            
            ZStack{
                Color("BackgroundColor").ignoresSafeArea()
                
                VStack{
                    Image("Logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200.0)
                    
                    Spacer().frame(height: 80)
                    
                    VStack{
                        TextField("Email", text: $email)
                            .padding(10)
                            .background(Color("InputBackground"))
                            .cornerRadius(8.0)
                        
                        Spacer().frame(height: 10)

                    }
                    
                    
                    Spacer().frame(height: 20)
                
                    
                    NavigationLink(destination: MenuView()) {
                        Text("Recuperar senha")
                            .font(.title2)
                            .bold()
                            .foregroundColor(.white)
                            .padding(10)
                            .frame(maxWidth: .infinity)
                            .background(Color("ButtonColor"))
                            .cornerRadius(8)
                    }
                    
                    
                    NavigationLink(destination: ContentView()) {
                        Text("Voltar")
                            .font(.title3)
                            .bold()
                            .foregroundColor(.white)
                            .padding(0)
                            .frame(maxWidth: .infinity)
                    }
                    
                    
                }.padding()
            }
            
        }
        
    }
    
}

struct ForgetPasswordPage_Previews: PreviewProvider {
    static var previews: some View {
        ForgetPasswordPage()
    }
}
