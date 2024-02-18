//
//  DetailsView.swift
//  note
//
//  Created by Giovanni Maya on 2/17/24.
//

import Foundation
import SwiftUI

struct DetailsView: View {
    @State private var presentAlert = false // handle presentation of alert
    @State private var titleText: String = "" // new entry of Textfield
    @ObservedObject private var viewModel = NoteViewModel()
    
    var note: Note
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack{
                    Text("\(note.title ?? "")").font(.system(size: 22, weight: .regular)).padding()
                    Spacer()
                }
            }
        }.navigationTitle("Details").toolbar {
            ToolbarItemGroup(placement: .confirmationAction){
                Button {
                    presentAlert = true
                } label: {
                    Text("Edit").bold()
                }.alert("Note", isPresented: $presentAlert, actions: {
                    TextField("\(note.title ?? "")", text: $titleText)
                    Button("Update", action: {
                        self.viewModel.updateData(title: titleText, id: note.id ?? " ")
                        titleText = " "
                    })
                    Button("Cancel", role: .cancel, action: {
                        presentAlert = false
                        titleText = ""
                    })
                }, message: {
                    Text("Write your new note here")
                })
            }
        }
    }
}

struct DetailsView_Preview: PreviewProvider {
    // default data to let our Xcode application run else it will not build
    static var previews: some View {
        DetailsView(note: Note(id: "bKrivNkYirmMbHyAUBWv", title: "Issues are never simple. One thing I'm proud of is that that very rarely will you hear me simplify the issues - Barack Obama"))
    }
}
