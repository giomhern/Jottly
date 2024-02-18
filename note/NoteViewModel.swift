//
//  NoteViewModel.swift
//  note
//
//  Created by Giovanni Maya on 2/17/24.
//

import FirebaseFirestore


// centralize all of the functionality you need and then use them in the your views
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
    
    // function to fetch all of the data
    func fetchData() {
        databaseReference.addSnapshotListener{
            (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            self.notes = documents.compactMap {
                queryDocumentSnapshot -> Note? in return try? queryDocumentSnapshot.data(as: Note.self)
            }
        }
    }
    
    // function to edit specific notes
    func updateData(title: String, id: String){
        databaseReference.document(id).updateData(["title": title]){
            error in
            if let error = error {
                print(error.localizedDescription)
            } else {
                print("Note updated successfully")
            }
        }
    }
    
}
