//
//  NoteViewModel.swift
//  note
//
//  Created by Giovanni Maya on 2/17/24.
//

import FirebaseFirestore

class NoteViewModel: ObservableObject {
    @Published var notes = [Note]()
    private var databaseReference =  Firestore.firestore().collection("Notes")
    
    // function to post data
    func addData(title: String){
        databaseReference.addDocument(data: ["title": title]) { error in
                if let error = error {
                    // Handle the error
                    print("Error adding document: \(error.localizedDescription)")
                } 
            }
    }
}
