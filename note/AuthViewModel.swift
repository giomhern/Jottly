//
//  AuthViewModel.swift
//  note
//
//  Created by Giovanni Maya on 2/17/24.
//

import Foundation
import SwiftUI
import FirebaseAuth

final class AuthViewModel: ObservableObject {
    
    // do not need a model because FIRUser already includes displayName, picture URL, an email, phone number, and a provider identifier
    
    @Published var user: User?
    
    func listenToAuthState(){
        Auth.auth().addStateDidChangeListener{[weak self]
            _, user in
            guard let self = self
            else {
                return
            }
            self.user = user
        }
    }
    
    // function to sign-in
    
    func signIn(emailAddress: String, password: String) {
        Auth.auth().signIn(withEmail: emailAddress, password: password) { (authResult, error) in
            if let error = error {
                print("An error occurred: \(error.localizedDescription)")
                return
            }
            // Successfully signed in
            // You can access `authResult` for more details about the authenticated user
        }
    }
    // function to create an account
    
    func signUp (emailAddress: String, password: String) {
        Auth.auth().createUser(withEmail: emailAddress, password: password) { (result, error) in
            if let error = error {
                print("an error occurred: \(error.localizedDescription)")
                return
            }
        }
    }
    
    // function to logout
    
    
    
    // function to reset password
}
