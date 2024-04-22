//
//  AuthService.swift
//  Threads
//
//  Created by Shivansh Mahajan on 14/04/24.
//
import Firebase
import Foundation
import FirebaseFirestoreSwift

class AuthService{
    @Published var userSession:FirebaseAuth.User?
    static let shared=AuthService()
    init(){
        self.userSession=Auth.auth().currentUser
    }
    @MainActor
    func login(withEmail email:String,password:String) async throws{
        do{
            let result=try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession=result.user
            print("DEBUG: Created user \(result.user.uid)")
        }catch{
            print("DEBUG: Failed to create user with error \(error.localizedDescription)")
        }
    }
    @MainActor
    func createUser(withEmail email:String,password:String,fullname:String,username:String) async throws{
        do{
            let result=try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession=result.user
            print("DEBUG: Created user \(result.user.uid)")
        }catch{
            print("DEBUG: Failed to create user with error \(error.localizedDescription)")
        }
    }
    func signOut(){
        try?Auth.auth().signOut()
        self.userSession=nil
    }
    @MainActor
    private func uploadUserData(withEmail email:String,
                                password :String,
                                fullname:String,
                                username:String,
                                id:String)async throws{
        let user=User(id: id, fullname: fullname, email: email, username: username)
        guard let userData=try? Firestore.Encoder().encode(user)
        else{
            return
        }
        try await Firestore.firestore().collection("users").document(id).setData(userData)
    }
}
