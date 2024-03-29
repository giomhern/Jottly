//
//  ContentView.swift
//  note
//
//  Created by Giovanni Maya on 2/17/24.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel = NoteViewModel()
    @State private var showSheet: Bool = false
    @State private var postDetent = PresentationDetent.medium
    @ObservedObject var authModel = AuthViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.notes, id:\.id) { Note in
                    NavigationLink(destination: DetailsView(note: Note)) {
                        VStack(alignment: .leading) {
                            Text(Note.title ?? "").font(.system(size: 22, weight: .regular))
                        }.frame(maxHeight: 200)
                    }
                }.onDelete(perform: self.viewModel.deleteData(at:))
            }.onAppear(perform: self.viewModel.fetchData)
                .toolbar {
                    ToolbarItem(placement: .bottomBar) {
                        Text("\(viewModel.notes.count) notes")
                    }
                    ToolbarItem(placement: .bottomBar) {
                        Button {
                            showSheet.toggle()
                        }  label: {
                            Image(systemName: "square.and.pencil")
                                .imageScale(.large)
                        }.sheet(isPresented: $showSheet) {
                            FormView().presentationDetents([.large, .medium])
                        }
                    }
                    ToolbarItemGroup(placement: .cancellationAction) {
                        Button {
                            authModel.signOut()
                        } label: {
                            Text("Logout")
                        }
                    }
                }.navigationTitle("Notes")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
