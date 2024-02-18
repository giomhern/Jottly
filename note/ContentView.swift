//
//  ContentView.swift
//  note
//
//  Created by Giovanni Maya on 2/17/24.
//

import SwiftUI

struct ContentView: View {
    // State variables to control the display of the sheet and the detent size.
    @State private var showingSheet = false
    @State private var postDetent = PresentationDetent.medium
    
    var body: some View {
        // Using NavigationStack to enable navigation between views.
        NavigationStack {
            List {
                // Your notes will go here.
            }
            .toolbar {
                ToolbarItemGroup(placement: .bottomBar) {
                    Text("X notes") // Replace X with the number of notes
                    Spacer()
                    Button(action: {
                        showingSheet.toggle()
                    }) {
                        Image(systemName: "square.and.pencil")
                    }
                    .imageScale(.large)
                }
            }
            .navigationTitle("Notes")
            .sheet(isPresented: $showingSheet) {
                FormView().presentationDetents([.large, .medium]) // Make sure FormView is correctly defined elsewhere
            }
        }
    }
}

#Preview {
    ContentView()
}
