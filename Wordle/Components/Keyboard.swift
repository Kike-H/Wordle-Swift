//
//  Keyboard.swift
//  Wordle
//
//  Created by Kike Hernandez D. on 03/09/22.
//

import SwiftUI

struct Keyboard: View {
    @ObservedObject var game: Game
    let columns: [GridItem] = Array(repeating: GridItem(.flexible(minimum: 20), spacing: 0), count: 10)
    var body: some View {
        LazyVGrid(columns: columns, spacing: 12) {
            ForEach(game.keyboard, id: \.self) { k in
                AnyView(k.status == .normal ? AnyView(KeyBlank()) : AnyView(KeyColor(color: k.color)))
                    .overlay {
                        Button {
                            game.addLetter(cube: k)
                        } label: {
                            Text(k.letter)
                                .foregroundColor(Color(uiColor: UIColor(named: "colorSecondary")!))
                                .font(.system(size: 20, weight: .bold))
                        }
                    }
            }
        }
    }
}

struct Keyboard_Previews: PreviewProvider {
    static var previews: some View {
        Keyboard(game: Game())
    }
}
