//
//  Note.swift
//  note
//
//  Created by Giovanni Maya on 2/17/24.
//

import Foundation
import FirebaseFirestoreSwift

struct Note: Codable {
    @DocumentID var id: String?
    var title: String?
    
}

