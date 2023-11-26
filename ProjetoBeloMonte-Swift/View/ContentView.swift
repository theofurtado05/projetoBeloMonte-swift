import SwiftUI

struct ContentView: View {
    @State var email: String = ""
    @State var password: String = ""
    @State var isError: Bool = false
        
    @State var isAuthenticated: Bool = false
    
    
    
    func Login() -> (AnyView){
        
        for usuario in Sistema.shared.usuarios {
            print(usuario.toString())
            if usuario.email.lowercased() == email.lowercased() {
                if(usuario.senha == password){
                    isAuthenticated = true
                    return AnyView(MenuView())
                } else {
                    isError = true
                }
            } else {
                isError = true
            }
            
        }
        
        isError = true
        
        return AnyView(ContentView())
    }
    
    
    
    var body: some View {
        NavigationView{
            ZStack{
                NavigationLink(destination: MenuView(), isActive: $isAuthenticated) {
                    EmptyView()
                }
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
                        
                        SecureField("Senha", text: $password)
                            .padding(10)
                            .background(Color("InputBackground"))
                            .cornerRadius(8.0)
                    }
                    
                    
                    Spacer().frame(height: 20)
                    
                    Button("Entrar"){
                        Login()
                    }
                    .font(.title2)
                    .bold()
                    .foregroundColor(.white)
                    .padding(10)
                    .frame(maxWidth: .infinity)
                    .background(Color("ButtonColor"))
                    .cornerRadius(8)
                    .alert(isPresented: $isError) {
                        Alert(
                            title: Text("Erro ao logar"),
                            message: Text("Email ou senha inválidos."),
                            dismissButton: .default(Text("OK"))
                        )
                    }
                    
                    NavigationLink(destination: ForgetPasswordPage()) {
                        Text("Esqueceu sua senha?")
                            .font(.title3)
                            .bold()
                            .foregroundColor(.white)
                            .padding(0)
                            .frame(maxWidth: .infinity)
                    }
                    
                    NavigationLink(destination: RegisterPage()) {
                        Text("Registre-se")
                            .font(.title3)
                            .bold()
                            .foregroundColor(.white)
                            .padding(0)
                            .frame(maxWidth: .infinity)
                    }
                    
                }.padding()
            }
            
        }.navigationBarBackButtonHidden(true)
        
    }
    
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        ContentView()
            
    }
}

