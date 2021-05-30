//
//  Login.swift
//  workoutApp
//
//  Created by Abdullah Ridwan on 5/29/21.

import SwiftUI

struct Login: View {
    @State var email = ""
    @State var password = ""
    @ObservedObject var sessionStore = SessionStore()
    
    
    
    
    var body: some View {
        NavigationView{
            VStack{
                Spacer()
                    .frame(height:50)
                Image(systemName: "flame.fill")
                    .foregroundColor(Color.red.opacity(0.6))
                TextField("Email", text: $email)
                    .modifier(FieldModifiers())
                SecureField("Password", text: $password)
                    .modifier(FieldModifiers())
                Button(action: {
                    sessionStore.signIn(email: email, password: password)
                }, label: {Text("Login")})
                    .disabled(email.isEmpty || password.isEmpty)
                Button(action: {
                    sessionStore
                        .create_user(email: email, password: password, completion: { (res) in
                            print(res)
                         })
                        //.signUp(email: email, password: password)
                }, label: {Text("Create Account")})
                    .disabled(email.isEmpty || password.isEmpty)
                Spacer()
            }.navigationTitle("Login")
        }
        
        
    }
}


//Field Modifiers
struct FieldModifiers: ViewModifier{
    func body(content: Content) -> some View{
        return content
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .disableAutocorrection(true)
            .autocapitalization(.none)
            .padding()

    }
}



//Button styling
struct GradientButton: ButtonStyle{
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 300, height: 150)
            .padding()
            .foregroundColor(.white)
            .background(LinearGradient(gradient: Gradient(colors: [Color("DarkGreen"), Color("LightGreen")]), startPoint: .leading, endPoint: .trailing))
            .cornerRadius(40)
            .padding(.horizontal, 20)
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
            .environmentObject(SessionStore())
    }
}
