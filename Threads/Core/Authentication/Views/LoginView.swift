//
//  LoginView.swift
//  Threads
//
//  Created by Shivansh Mahajan on 08/04/24.
//

import SwiftUI

struct LoginView: View {

    @StateObject var viewModel = LoginViewModel()
    var body: some View {
        NavigationStack{
            VStack{
                Spacer()
                Image("Threads_icon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120,height: 120)
                    .padding()
                VStack{
                    TextField("Enter your email",text: $viewModel.email)
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                        .modifier(ThreadsTextFeildModifier())
                    SecureField("Enter your Password", text: $viewModel.password)
                        .modifier(ThreadsTextFeildModifier())
                }
                NavigationLink{
                    Text("Forgot password")
                }label:{
                    Text("Forgot password?")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .padding(.vertical)
                        .padding(.trailing,28)
                        .foregroundColor(.black)
                        .frame(maxWidth:.infinity,alignment: .trailing)
                }
                Button{
                    Task{ try await viewModel.login()}
                }label:{
                    Text("Login")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 352,height: 44)
                        .background(.black)
                        .cornerRadius(8)
                }
                
                Spacer()
                
                Divider()
                
                NavigationLink{
                    RegistrationView()
                        .navigationBarBackButtonHidden(true)
                }label:{
                    HStack(spacing:3){
                        Text("Don't have an Account")
                        Text("Sign Up")
                            .fontWeight(.semibold)
                    }
                    .foregroundColor(.black)
                    .font(.footnote)
                }.padding(.vertical,16)
                
                
            }
        }
    }
}

#Preview {
    LoginView()
}
