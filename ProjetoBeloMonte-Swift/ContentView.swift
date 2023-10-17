import SwiftUI

struct ContentView: View {
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
                        
                        SecureField("Senha", text: $password)
                            .padding(10)
                            .background(Color("InputBackground"))
                            .cornerRadius(8.0)
                    }
                    
                    
                    Spacer().frame(height: 20)
                    
                    
                    Button(action: {
                        checkLogin()
                    }) {
                        Text("Entrar")
                            .font(.title2)
                            .bold()
                            .foregroundColor(.white)
                            .padding(10)
                            .frame(maxWidth: .infinity)
                            .background(Color("ButtonColor"))
                            .cornerRadius(8)
                    }
                    .alert(isPresented: $isAuthenticated) {
                        Alert(
                            title: Text("Autenticação"),
                            message: Text("Login bem sucedido!"),
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
            
        }
        
    }
    
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        ContentView()
            
    }
}

