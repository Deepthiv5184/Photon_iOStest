//
//  HomeModel.swift
//  PhotoniOSTest
//
//  Created by DEEPTHI on 2/2/24.
//

import Foundation


struct HomeModel: Codable, Identifiable {
    let id = UUID()
    let dbn, schoolName, boro, overviewParagraph: String
    
    enum CodingKeys: String, CodingKey {
        case dbn = "dbn"
        case schoolName = "school_name"
        case boro = "boro"
        case overviewParagraph = "overview_paragraph"
    }
}
