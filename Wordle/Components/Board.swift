//
//  Board.swift
//  Wordle
//
//  Created by Kike Hernandez D. on 29/08/22.
//

import SwiftUI

struct Board: View {
    @ObservedObject var game: Game
    let columns: [GridItem] = Array(repeating: GridItem(.flexible(minimum: 20), spacing: 0), count: 5)
    var body: some View {
        LazyVGrid(columns: columns, spacing: 8) {
            ForEach(0...5, id: \.self) { i in
                ForEach(game.board[i], id:\.id) { cube in
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
        Board(game: Game())
    }
}
