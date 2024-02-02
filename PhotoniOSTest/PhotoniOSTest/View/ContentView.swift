//
//  ContentView.swift
//  PhotoniOSTest
//
//  Created by DEEPTHI on 2/2/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = HomeViewModel(manager: WebService())
    var body: some View {
        
        List(viewModel.listItems) { listItem in
            NavigationLink(destination: DetailView(description: listItem.overviewParagraph)) {
                ListCell(title: listItem.schoolName)
            }
            
        }.onAppear {
            if viewModel.listItems.isEmpty {
                Task {
                    await viewModel.fetchDataFromApi()
                }
            }
        }
    }
}

struct ListCell: View {
    var title: String
    var body: some View {
        HStack {
            Text(title)
        }.frame(alignment: .leading)
    }
}

#Preview {
    ContentView()
}
