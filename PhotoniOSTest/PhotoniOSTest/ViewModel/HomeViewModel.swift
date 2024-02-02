//
//  HomeViewModel.swift
//  PhotoniOSTest
//
//  Created by DEEPTHI on 2/2/24.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    @Published var listItems = [HomeModel]()
    let serviceManager: WebSertviceProtocol
    init(manager: WebSertviceProtocol) {
        self.serviceManager = manager
    }
    
    func fetchDataFromApi() async {
        let urlString = "https://data.cityofnewyork.us/resource/s3k6-pzi2.json"
        guard let listData: [HomeModel] = await serviceManager.getData(fromUrl: urlString) else { return }
        listItems = listData
    }
    
}



