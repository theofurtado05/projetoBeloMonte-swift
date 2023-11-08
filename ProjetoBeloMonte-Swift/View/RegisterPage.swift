//
//  RegisterPage.swift
//  ProjetoBeloMonte-Swift
//
//  Created by Theo Furtado on 16/10/23.
//

import SwiftUI

struct RegisterPage: View {
    @State var email: String = ""
    @State var nome: String = ""
    @State var cargo: String = ""
    @State var senha: String = ""
    @State var confirmarSenha: String = ""
    
    var usuarios = Sistema.shared.usuarios
    

    func registrarUsuario() -> (Bool){
        if email.isEmpty || !email.contains("@") {
            print("Email invalido.")
            return false
        }
        
        for usuario in Sistema.shared.usuarios {
            if usuario.email.lowercased() == email.lowercased() {
                print("Email em uso.")
                return false
            }
        }
        
        if senha != confirmarSenha && !senha.isEmpty {
            print("As senhas devem ser iguais.")
            return false
        }
        
        if nome.isEmpty {
            print("Nome não pode estar vazio.")
            return false
        }
        
        if cargo.isEmpty {
            print("Cargo não pode estar vazio.")
            return false
        }
        
        Sistema.shared.usuarios.append(
            Usuario(nome: nome, cargo: cargo, email: email, senha: senha)
        )
        
        print("Usuario criado!")
        for usuario in Sistema.shared.usuarios {
            print(usuario.email)
        }
        print("Lista de usuarios: ", Sistema.shared.usuarios)
        
        email = ""
        nome = ""
        cargo = ""
        senha = ""
        confirmarSenha = ""
        
        return true
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
                        
                        TextField("Nome", text: $nome)
                            .padding(10)
                            .background(Color("InputBackground"))
                            .cornerRadius(8.0)
                        
                        Spacer().frame(height: 10)
                        
                        TextField("Cargo", text: $cargo)
                            .padding(10)
                            .background(Color("InputBackground"))
                            .cornerRadius(8.0)
                        
                        Spacer().frame(height: 10)
                        
                        SecureField("Senha", text: $senha)
                            .padding(10)
                            .background(Color("InputBackground"))
                            .cornerRadius(8.0)
                        
                        Spacer().frame(height: 10)
                        
                        SecureField("Confirmar Senha", text: $confirmarSenha)
                            .padding(10)
                            .background(Color("InputBackground"))
                            .cornerRadius(8.0)
                    }
                    
                    
                    Spacer().frame(height: 20)
                
                    Button("Registrar"){
                        registrarUsuario()
                    }
                    .font(.title2)
                    .bold()
                    .foregroundColor(.white)
                    .padding(10)
                    .frame(maxWidth: .infinity)
                    .background(Color("ButtonColor"))
                    .cornerRadius(8)
                   
                    
                    NavigationLink(destination: ContentView()) {
                        Text("Entrar")
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

struct RegisterPage_Previews: PreviewProvider {
    static var previews: some View {
        RegisterPage()
    }
}
