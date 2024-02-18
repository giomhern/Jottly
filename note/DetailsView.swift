//
//  DetailsView.swift
//  note
//
//  Created by Giovanni Maya on 2/17/24.
//

import Foundation
import SwiftUI

struct DetailsView: View {
    var note: Note
    var body: some View {
        Text("\(note.title ?? "")")
    }
}

struct DetailsView_Preview: PreviewProvider {
    // default data to let our Xcode application run else it will not build
    static var previews: some View {
        DetailsView(note: Note(id: "bKrivNkYirmMbHyAUBWv", title: "Issues are never simple. One thing I'm proud of is that that very rarely will you hear me simplify the issues - Barack Obama"))
    }
}
