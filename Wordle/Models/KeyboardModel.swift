//
//  KeyboardModel.swift
//  Wordle
//
//  Created by Kike Hernandez D. on 03/09/22.
//

import SwiftUI

let keys = Array("QWERTYUIOPASDFGHJKLÑ 🚀ZXCVBNM ")
var keyboardData: [CubeModel] = keys.map { .init(_letter: String($0)) }


