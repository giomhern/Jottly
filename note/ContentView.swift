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
    @ObservedObject private var viewModel = NoteViewModel()
    var body: some View {
        // Using NavigationStack to enable navigation between views.
        NavigationStack {
            List {
                ForEach(viewModel.notes, id: \.id){
                    Note in NavigationLink(destination: DetailsView(note: Note)){
                        VStack(alignment: .leading){
                            Text(Note.title ?? "").font(.system(size: 22, weight: .regular))
                        }.frame(maxHeight: 200)
                    }}.onDelete(perform: self.viewModel.deleteData(at:))
            }.onAppear(perform: {
                self.viewModel.fetchData()
            })
            .toolbar {
                ToolbarItemGroup(placement: .bottomBar) {
                    Text("\(viewModel.notes.count) notes") // Replace X with the number of notes
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
