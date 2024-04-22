//
//  RegistrationView.swift
//  Threads
//
//  Created by Shivansh Mahajan on 08/04/24.
//

import SwiftUI

struct RegistrationView: View {
    @StateObject var viewModel=RegistrationViewModel()
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack{
            Spacer()
            Image("Threads_icon")
                .resizable()
                .scaledToFit()
                .frame(width: 120,height: 120)
                .padding()
            VStack{
                TextField("enter your email",text: $viewModel.email)
                    .modifier(ThreadsTextFeildModifier())
                SecureField("Enter your Password", text: $viewModel.password)
                    .modifier(ThreadsTextFeildModifier())
                TextField("enter your fullname",text: $viewModel.fullname)
                    .modifier(ThreadsTextFeildModifier())
                TextField("enter your username",text: $viewModel.username)
                    .modifier(ThreadsTextFeildModifier())
            }
            
            Button{
                Task{try await viewModel.createUser()}
            } label:{
                Text("Sign Up")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(width: 352,height: 44)
                    .background(.black)
                    .cornerRadius(8)
            }
            .padding(.vertical)
            
            Spacer()
            
            Divider()
            
           Button{
                dismiss()
            } label:{
                HStack(spacing:3){
                    Text("Already Have An Account")
                    Text("Sign In")
                        .fontWeight(.semibold)
                }
                .foregroundColor(.black)
                .font(.footnote)
            }.padding(.vertical,16)
        }
    }
}

struct RegistrationView_Previews: PreviewProvider {
        static var previews: some View {
            RegistrationView()
        }
}
