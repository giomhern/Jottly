//
//  ResetPasswordView.swift
//  note
//
//  Created by Giovanni Maya on 2/18/24.
//

import Foundation
import SwiftUI

struct ResetPasswordView: View {
    
    @State private var emailAddress: String = ""
    @EnvironmentObject private var authModel: AuthViewModel
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Email", text: $emailAddress)
                        .textContentType(.emailAddress)
                        .textInputAutocapitalization(.never)
                        .keyboardType(.emailAddress)
                }
                Section(footer: Text("Once sent, check your email to reset your password.")) {
                    Button(
                        action: {
                            authModel.resetPassword(emailAddress: emailAddress)
                        }) {
                            Text("Send email link").bold()
                        }
                }
            }.navigationTitle("Reset password")
                .toolbar {
                    ToolbarItemGroup(placement: .confirmationAction) {
                        Button("Done") {
                            presentationMode.wrappedValue.dismiss()
                        }
                    }
                }
        }
    }
}

struct ResetPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ResetPasswordView()
    }
}
