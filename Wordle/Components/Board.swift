//
//  Board.swift
//  Wordle
//
//  Created by Kike Hernandez D. on 29/08/22.
//

import SwiftUI

struct Board: View {
    let columns: [GridItem] = Array(repeating: GridItem(.flexible(minimum: 20), spacing: 0), count: 5)
    var board: [[CubeModel]] = Array(repeating: Array(repeating: .init(_letter: ""), count: 5), count: 6)
    var body: some View {
        LazyVGrid(columns: columns, spacing: 8) {
            ForEach(0...5, id: \.self) { i in
                ForEach(0...4, id:\.self) { j in
                    let cube = board[i][j]
                    if(cube.status == .normal) {
                        CubeBlank()
                    }
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
