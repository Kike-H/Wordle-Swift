//
//  Board.swift
//  Wordle
//
//  Created by Kike Hernandez D. on 29/08/22.
//

import SwiftUI

struct Board: View {
    let columns: [GridItem] = Array(repeating: GridItem(.flexible(minimum: 20), spacing: 0), count: 5)
    var body: some View {
        LazyVGrid(columns: columns, spacing: 8) {
            ForEach(0...5, id: \.self) { index in
                ForEach(0...4, id: \.self) { i in
                    CubeBlank()
                }
            }
        }
    }
}

struct Board_Previews: PreviewProvider {
    static var previews: some View {
        Board()
    }
}
