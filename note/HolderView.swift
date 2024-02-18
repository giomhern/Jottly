//
//  HolderView.swift
//  note
//
//  Created by Giovanni Maya on 2/17/24.
//
import SwiftUI
import Foundation

/*
 Logic implemented here:
    If the user session is nil => as in there's no login
    Else the user session is not nil => show ContentView (homepage)
 */


struct HolderView: View {
    @EnvironmentObject private var authModel: AuthViewModel
    
    var body: some View {
        Group{
            if authModel.user == nil{
                SignUpView()
            } else {
                ContentView()
            }
        }
    }
}
