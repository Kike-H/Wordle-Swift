//
//  CubeModel.swift
//  Wordle
//
//  Created by Kike Hernandez D. on 29/08/22.
//

import SwiftUI

enum Status {
    case normal
    case match
    case dontAppear
    case apear
}

struct CubeModel: Hashable, Identifiable {
    let id: String = UUID().uuidString
    
    let letter: String
    var status: Status
    
    var color: Color {
        switch status {
        case .normal:
            return Color.white
        case .match:
            return Color.green
        case .dontAppear:
            return Color.gray
        case .apear:
            return Color.yellow
        }
    }
    
    init(_letter: String, _status: Status = .normal) {
        self.letter = _letter
        self.status = _status
    }
}

