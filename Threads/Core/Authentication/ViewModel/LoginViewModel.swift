//
//  LoginViewModel.swift
//  Threads
//
//  Created by Shivansh Mahajan on 14/04/24.
//

import Foundation
class LoginViewModel:ObservableObject{
    @Published  var email=""
    @Published  var password=""
   
    @MainActor
    func login() async throws{
       try await AuthService.shared.login(withEmail: email, password: password)
    }
}
