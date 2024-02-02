//
//  DetailView.swift
//  PhotoniOSTest
//
//  Created by DEEPTHI on 2/2/24.
//

import SwiftUI

struct DetailView: View {
    @State var description: String
    var body: some View {
        VStack {
            Text(description)
        }.frame(alignment: .leading)
    }
}
