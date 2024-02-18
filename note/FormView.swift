//
//  FormView.swift
//  note
//
//  Created by Giovanni Maya on 2/17/24.
//

import Foundation
import SwiftUI

struct FormView: View {
    @Environment(\.dismiss) var dismiss
    @State var titleText = ""
    @ObservedObject private var viewModel = NoteViewModel()
    var body: some View {
        NavigationStack{
            Form {
                Section {
                    TextEditor(text: $titleText)
                        .frame(minHeight: 200)
                }
                Section {
                    Button(action: {
                        self.viewModel.addData(title: titleText)
                        titleText = ""
                        dismiss()
                    }) {
                        Text("Save now")
                    }.disabled(self.titleText.isEmpty)
                        .foregroundColor(.yellow)
                }
            }.navigationTitle("Publish")
                .toolbar {
                ToolbarItemGroup(placement: .destructiveAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
        }
    }
}
