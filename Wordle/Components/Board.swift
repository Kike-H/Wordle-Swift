//
//  Board.swift
//  Wordle
//
//  Created by Kike Hernandez D. on 29/08/22.
//

import SwiftUI

struct Board: View {
    let columns: [GridItem] = Array(repeating: GridItem(.flexible(minimum: 20), spacing: 0), count: 5)
    var board: [[CubeModel]] = [
        //1                     2                   3                    4               5
        [.init(_letter: ""), .init(_letter: ""), .init(_letter: ""), .init(_letter: ""), .init(_letter: "")], // 1
        [.init(_letter: ""), .init(_letter: ""), .init(_letter: ""), .init(_letter: ""), .init(_letter: "")], // 2
        [.init(_letter: ""), .init(_letter: ""), .init(_letter: ""), .init(_letter: ""), .init(_letter: "")], // 3
        [.init(_letter: ""), .init(_letter: ""), .init(_letter: ""), .init(_letter: ""), .init(_letter: "")], // 4
        [.init(_letter: ""), .init(_letter: ""), .init(_letter: ""), .init(_letter: ""), .init(_letter: "")], // 5
        [.init(_letter: ""), .init(_letter: ""), .init(_letter: ""), .init(_letter: ""), .init(_letter: "")], // 6
    ]
    var body: some View {
        LazyVGrid(columns: columns, spacing: 8) {
            ForEach(0...5, id: \.self) { i in
                ForEach(board[i], id:\.id) { cube in
                    if(cube.status == .normal) {
                        CubeBlank()
                    }
                    else {
                        CubeColor(color: cube.color, letter: cube.letter)
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
